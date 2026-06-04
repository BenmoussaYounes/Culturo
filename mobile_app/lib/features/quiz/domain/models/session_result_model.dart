class SessionResultModel {
  final int finalScore;
  final int earnedXp;
  final int totalXp;
  final int level;
  final bool isBattleUnlocked;

  const SessionResultModel({
    required this.finalScore,
    required this.earnedXp,
    required this.totalXp,
    required this.level,
    required this.isBattleUnlocked,
  });
}
