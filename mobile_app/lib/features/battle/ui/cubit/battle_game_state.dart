part of 'battle_game_cubit.dart';

sealed class BattleGameState {}

final class BattleGameInitial extends BattleGameState {}

final class BattleGameInProgress extends BattleGameState {
  final String battleId;
  final String questionId;
  final String player1Name;
  final String player1Initial;
  final Color player1AvatarBg;
  final bool player1Answered;
  final int player1Score;
  final String player2Name;
  final String player2Initial;
  final Color player2AvatarBg;
  final bool player2Thinking;
  final int player2Score;
  final int currentRound;
  final int totalRounds;
  final String category;
  final String timerLabel;
  final double timerProgress;
  final String questionBefore;
  final String questionHighlight;
  final String questionAfter;
  final List<BattleAnswerModel> answers;

  BattleGameInProgress({
    required this.battleId,
    required this.questionId,
    required this.player1Name,
    required this.player1Initial,
    required this.player1AvatarBg,
    required this.player1Answered,
    required this.player1Score,
    required this.player2Name,
    required this.player2Initial,
    required this.player2AvatarBg,
    required this.player2Thinking,
    required this.player2Score,
    required this.currentRound,
    required this.totalRounds,
    required this.category,
    required this.timerLabel,
    required this.timerProgress,
    required this.questionBefore,
    required this.questionHighlight,
    required this.questionAfter,
    required this.answers,
  });

  BattleGameInProgress copyWith({
    String? questionId,
    bool? player1Answered,
    int? player1Score,
    bool? player2Thinking,
    int? player2Score,
    int? currentRound,
    String? timerLabel,
    double? timerProgress,
    String? questionBefore,
    String? questionHighlight,
    String? questionAfter,
    List<BattleAnswerModel>? answers,
  }) => BattleGameInProgress(
    battleId: battleId,
    questionId: questionId ?? this.questionId,
    player1Name: player1Name,
    player1Initial: player1Initial,
    player1AvatarBg: player1AvatarBg,
    player1Answered: player1Answered ?? this.player1Answered,
    player1Score: player1Score ?? this.player1Score,
    player2Name: player2Name,
    player2Initial: player2Initial,
    player2AvatarBg: player2AvatarBg,
    player2Thinking: player2Thinking ?? this.player2Thinking,
    player2Score: player2Score ?? this.player2Score,
    currentRound: currentRound ?? this.currentRound,
    totalRounds: totalRounds,
    category: category,
    timerLabel: timerLabel ?? this.timerLabel,
    timerProgress: timerProgress ?? this.timerProgress,
    questionBefore: questionBefore ?? this.questionBefore,
    questionHighlight: questionHighlight ?? this.questionHighlight,
    questionAfter: questionAfter ?? this.questionAfter,
    answers: answers ?? this.answers,
  );
}

final class BattleGameFinished extends BattleGameState {
  final int myScore;
  final int opponentScore;
  final bool didWin;

  BattleGameFinished({required this.myScore, required this.opponentScore, required this.didWin});
}
