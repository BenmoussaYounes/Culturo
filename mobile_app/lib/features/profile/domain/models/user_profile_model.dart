class UserProfileModel {
  final String id;
  final String username;
  final String email;
  final String color;
  final String createdAt;
  final int xp;
  final int level;
  final bool isBattleUnlocked;

  const UserProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.color,
    required this.createdAt,
    required this.xp,
    required this.level,
    required this.isBattleUnlocked,
  });
}
