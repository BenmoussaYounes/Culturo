part of 'battle_cubit.dart';

sealed class BattleState {}

final class BattleInitial extends BattleState {}

final class BattleNavigateToMatchmaking extends BattleState {
  final String categoryId;
  BattleNavigateToMatchmaking({required this.categoryId});
}

final class BattleLoaded extends BattleState {
  final String onlineCountLabel;
  final String eloLabel;
  final String eloDeltaLabel;
  final String rankLabel;
  final double rankProgress;
  final String winsLabel;
  final String lossesLabel;
  final String winRateLabel;
  final String streakLabel;
  final List<BattleCategoryModel> categories;
  final List<BattleRecentOpponentModel> recentOpponents;

  BattleLoaded({
    required this.onlineCountLabel,
    required this.eloLabel,
    required this.eloDeltaLabel,
    required this.rankLabel,
    required this.rankProgress,
    required this.winsLabel,
    required this.lossesLabel,
    required this.winRateLabel,
    required this.streakLabel,
    required this.categories,
    required this.recentOpponents,
  });
}
