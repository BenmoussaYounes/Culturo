class DailyChallengeDomainModel {
  final String date;
  final String resetCountdown;
  final int questionCount;
  final String playsCountFormatted;

  const DailyChallengeDomainModel({
    required this.date,
    required this.resetCountdown,
    required this.questionCount,
    required this.playsCountFormatted,
  });
}
