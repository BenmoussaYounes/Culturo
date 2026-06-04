import '../../domain/models/user_profile_model.dart';

class UserProfileDto {
  final String id;
  final String username;
  final String email;
  final String color;
  final String createdAt;
  final int xp;
  final int level;
  final bool isBattleUnlocked;

  const UserProfileDto({
    required this.id,
    required this.username,
    required this.email,
    required this.color,
    required this.createdAt,
    required this.xp,
    required this.level,
    required this.isBattleUnlocked,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    final userLevel = json['userLevel'] as Map<String, dynamic>? ?? {};
    return UserProfileDto(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      color: (json['color'] as String?) ?? '',
      createdAt: (json['createdAt'] as String?) ?? '',
      xp: (userLevel['xp'] as int?) ?? 0,
      level: (userLevel['level'] as int?) ?? 1,
      isBattleUnlocked: (userLevel['isBattleUnlocked'] as bool?) ?? false,
    );
  }

  UserProfileModel toDomain() => UserProfileModel(
    id: id,
    username: username,
    email: email,
    color: color,
    createdAt: createdAt,
    xp: xp,
    level: level,
    isBattleUnlocked: isBattleUnlocked,
  );
}
