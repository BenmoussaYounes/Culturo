import 'package:flutter/widgets.dart';

class UserInfoModel {
  final String name;
  final String initial;
  final int streakCount;
  final Color avatarBgColor;

  UserInfoModel({required this.name, required this.initial, required this.streakCount, required this.avatarBgColor});
}
