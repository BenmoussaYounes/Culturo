import '../../domain/models/leaderboard_player_model.dart';

class LeaderboardPlayerDto {
  final String userId;
  final String username;
  final String color;
  final int level;
  final int xp;

  const LeaderboardPlayerDto({
    required this.userId,
    required this.username,
    required this.color,
    required this.level,
    required this.xp,
  });

  factory LeaderboardPlayerDto.fromJson(Map<String, dynamic> json) => LeaderboardPlayerDto(
    userId: json['userId'] as String,
    username: json['username'] as String,
    color: (json['color'] as String?) ?? '',
    level: (json['level'] as int?) ?? 1,
    xp: (json['xp'] as int?) ?? 0,
  );

  LeaderboardPlayerModel toDomain() =>
      LeaderboardPlayerModel(userId: userId, username: username, color: color, level: level, xp: xp);
}

class LeaderboardResponseDto {
  final List<LeaderboardPlayerDto> topByXP;

  const LeaderboardResponseDto({required this.topByXP});

  factory LeaderboardResponseDto.fromJson(Map<String, dynamic> json) {
    final list = json['topByXP'] as List? ?? [];
    return LeaderboardResponseDto(
      topByXP: list.map((e) => LeaderboardPlayerDto.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
