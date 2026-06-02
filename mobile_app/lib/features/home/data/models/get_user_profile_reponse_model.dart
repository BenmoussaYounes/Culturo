class GetUserProfileResponseModel {
  final String id;
  final String username;
  final String email;
  final String? dateOfBirth;
  final bool isActivate;
  final String color;
  final bool notification;
  final UserLevelResponseModel userLevel;
  final String createdAt;
  final String updatedAt;

  GetUserProfileResponseModel({
    required this.id,
    required this.username,
    required this.email,
    this.dateOfBirth,
    required this.isActivate,
    required this.color,
    required this.notification,
    required this.userLevel,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetUserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return GetUserProfileResponseModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      isActivate: json['isActivate'],
      color: json['color'],
      notification: json['notification'],
      userLevel: UserLevelResponseModel.fromJson(json['userLevel']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class UserLevelResponseModel {
  final String id;
  final String userId;
  final int xp;
  final int level;
  final bool isBattleUnlocked;

  UserLevelResponseModel({
    required this.id,
    required this.userId,
    required this.xp,
    required this.level,
    required this.isBattleUnlocked,
  });

  factory UserLevelResponseModel.fromJson(Map<String, dynamic> json) {
    return UserLevelResponseModel(
      id: json['id'],
      userId: json['userId'],
      xp: json['xp'],
      level: json['level'],
      isBattleUnlocked: json['isBattleUnlocked'],
    );
  }
}
