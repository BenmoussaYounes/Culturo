part of 'battle_game_cubit.dart';

sealed class BattleGameState {}

final class BattleGameInitial extends BattleGameState {}

final class BattleGameInProgress extends BattleGameState {
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
}
