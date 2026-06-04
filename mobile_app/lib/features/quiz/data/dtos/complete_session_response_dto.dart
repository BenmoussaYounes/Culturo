class CompleteSessionResponseDto {
  final int finalScore;
  final int earnedXp;
  final int totalXp;
  final int level;
  final bool isBattleUnlocked;

  const CompleteSessionResponseDto({
    required this.finalScore,
    required this.earnedXp,
    required this.totalXp,
    required this.level,
    required this.isBattleUnlocked,
  });

  factory CompleteSessionResponseDto.fromJson(Map<String, dynamic> json) => CompleteSessionResponseDto(
    finalScore: json['finalScore'] as int,
    earnedXp: json['earnedXp'] as int,
    totalXp: json['totalXp'] as int,
    level: json['level'] as int,
    isBattleUnlocked: json['isBattleUnlocked'] as bool,
  );
}
