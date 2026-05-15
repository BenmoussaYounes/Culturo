import 'package:flutter/material.dart';

class BattleCategoryModel {
  final String label;
  final bool isSelected;

  const BattleCategoryModel({required this.label, required this.isSelected});
}

class BattleRecentOpponentModel {
  final String username;
  final String initial;
  final Color avatarBg;
  final bool isOnline;
  final String location;
  final int elo;
  final String timeLabel;

  const BattleRecentOpponentModel({
    required this.username,
    required this.initial,
    required this.avatarBg,
    required this.isOnline,
    required this.location,
    required this.elo,
    required this.timeLabel,
  });
}
