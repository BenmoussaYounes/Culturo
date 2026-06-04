part of 'ranking_cubit.dart';

sealed class RankingState {}

final class RankingInitial extends RankingState {}

final class RankingError extends RankingState {
  final String message;

  RankingError(this.message);
}

final class RankingLoaded extends RankingState {
  final String weekLabel;
  final String scopePrefix;
  final String totalPlayersLabel;
  final RankingEntryModel topEntry;
  final List<RankingEntryModel> entries;

  RankingLoaded({
    required this.weekLabel,
    required this.scopePrefix,
    required this.totalPlayersLabel,
    required this.topEntry,
    required this.entries,
  });
}
