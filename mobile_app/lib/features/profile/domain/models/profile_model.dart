import 'package:flutter/material.dart';

class ProfileModel {
  final String username;
  final String email;
  final String initial;
  final Color avatarBgColor;
  final String memberSinceLabel;
  final int xp;
  final int level;
  final bool isBattleUnlocked;

  const ProfileModel({
    required this.username,
    required this.email,
    required this.initial,
    required this.avatarBgColor,
    required this.memberSinceLabel,
    required this.xp,
    required this.level,
    required this.isBattleUnlocked,
  });
}
