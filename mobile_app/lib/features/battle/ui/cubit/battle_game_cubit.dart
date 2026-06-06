import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dtos/battle_socket_dtos.dart';
import '../../data/repositories/battle_repository.dart';
import '../../domain/models/battle_game_models.dart';

part 'battle_game_state.dart';

class BattleGameCubit extends Cubit<BattleGameState> {
  final BattleRepository _repository;

  BattleGameCubit(this._repository) : super(BattleGameInitial());

  StreamSubscription<NewQuestionDto>? _questionSub;
  StreamSubscription<ScoreUpdateDto>? _scoreSub;
  StreamSubscription<BattleEndDto>? _endSub;
  Timer? _questionTimer;

  int _timerSeconds = 0;
  int _questionTimeLimit = 15;

  String _battleId = '';
  String _playerName = '';
  String _playerInitial = '';
  Color _playerAvatarBg = Colors.grey;
  String _opponentName = '';

  void loadGame({
    required String battleId,
    required String playerName,
    required String playerInitial,
    required Color playerAvatarBg,
    required String opponentName,
    required int opponentElo,
  }) {
    _battleId = battleId;
    _playerName = playerName;
    _playerInitial = playerInitial;
    _playerAvatarBg = playerAvatarBg;
    _opponentName = opponentName;

    _questionSub = _repository.onNewQuestion.listen(_onNewQuestion);
    _scoreSub = _repository.onScoreUpdated.listen(_onScoreUpdated);
    _endSub = _repository.onBattleEnd.listen(_onBattleEnd);
  }

  void onAnswerSelected(String answer) {
    final s = state;
    if (s is! BattleGameInProgress) return;
    _questionTimer?.cancel();

    _repository.submitAnswer(battleId: s.battleId, questionId: s.questionId, answer: answer);

    final updatedAnswers = s.answers
        .map(
          (a) => a.text == answer
              ? BattleAnswerModel(letter: a.letter, text: a.text, state: BattleAnswerState.selectedWrong)
              : a,
        )
        .toList();

    emit(s.copyWith(player1Answered: true, answers: updatedAnswers));
  }

  void _onNewQuestion(NewQuestionDto dto) {
    _questionTimer?.cancel();
    _questionTimeLimit = dto.timeLimit;
    _timerSeconds = dto.timeLimit;

    final currentScore1 = switch (state) {
      BattleGameInProgress(:final player1Score) => player1Score,
      _ => 0,
    };
    final currentScore2 = switch (state) {
      BattleGameInProgress(:final player2Score) => player2Score,
      _ => 0,
    };

    emit(
      BattleGameInProgress(
        battleId: _battleId,
        questionId: dto.questionId,
        player1Name: _playerName,
        player1Initial: _playerInitial,
        player1AvatarBg: _playerAvatarBg,
        player1Answered: false,
        player1Score: currentScore1,
        player2Name: _opponentName,
        player2Initial: _opponentName.isNotEmpty ? _opponentName[0].toUpperCase() : '?',
        player2AvatarBg: const Color(0xFFD4891A),
        player2Thinking: true,
        player2Score: currentScore2,
        currentRound: dto.round,
        totalRounds: dto.totalRounds,
        category: 'Battle',
        timerLabel: _formatTimer(_timerSeconds),
        timerProgress: 1.0,
        questionBefore: dto.question,
        questionHighlight: '',
        questionAfter: '',
        answers: dto.options.map((o) => BattleAnswerModel(letter: o.letter, text: o.text)).toList(),
      ),
    );

    _questionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (isClosed) return;
      _timerSeconds = (_timerSeconds - 1).clamp(0, _questionTimeLimit);
      final s = state;
      if (s is BattleGameInProgress) {
        emit(
          s.copyWith(
            timerLabel: _formatTimer(_timerSeconds),
            timerProgress: _questionTimeLimit > 0 ? _timerSeconds / _questionTimeLimit : 0,
          ),
        );
      }
      if (_timerSeconds == 0) _questionTimer?.cancel();
    });
  }

  void _onScoreUpdated(ScoreUpdateDto dto) {
    final s = state;
    if (s is! BattleGameInProgress) return;

    List<BattleAnswerModel>? updatedAnswers;
    if (dto.correctAnswer != null) {
      updatedAnswers = s.answers.map((a) {
        if (a.text == dto.correctAnswer) {
          return BattleAnswerModel(letter: a.letter, text: a.text, state: BattleAnswerState.correct);
        }
        return a;
      }).toList();
    }

    emit(
      s.copyWith(
        player1Score: dto.myScore,
        player2Score: dto.opponentScore,
        player1Answered: dto.myAnswered,
        player2Thinking: !dto.opponentAnswered,
        answers: updatedAnswers,
      ),
    );
  }

  void _onBattleEnd(BattleEndDto dto) {
    _questionTimer?.cancel();
    emit(
      BattleGameFinished(
        myScore: dto.myScore,
        opponentScore: dto.opponentScore,
        didWin: dto.myScore > dto.opponentScore,
      ),
    );
  }

  String _formatTimer(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Future<void> close() {
    _questionTimer?.cancel();
    _questionSub?.cancel();
    _scoreSub?.cancel();
    _endSub?.cancel();
    _repository.disconnect();
    return super.close();
  }
}
