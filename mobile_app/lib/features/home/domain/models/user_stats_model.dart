class UserStatsModel {
  final int streakDays;
  final int precisionPercent;
  final int rank;
  final String city;

  const UserStatsModel({
    required this.streakDays,
    required this.precisionPercent,
    required this.rank,
    required this.city,
  });
}
