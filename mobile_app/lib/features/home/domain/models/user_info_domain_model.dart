import 'package:flutter/widgets.dart';

class UserInfoDomainModel {
  final String name;
  final String initial;
  final int streakCount;
  final Color avatarBgColor;

  UserInfoDomainModel({
    required this.name,
    required this.initial,
    required this.streakCount,
    required this.avatarBgColor,
  });
}
