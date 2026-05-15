import 'package:flutter/material.dart';

import 'category_accuracy_model.dart';

class ProfileModel {
  final String name;
  final String handle;
  final String initial;
  final Color avatarBgColor;
  final bool isPro;
  final String subtitleLabel;
  final int streakDays;
  final int precisionPercent;
  final String precisionSublabel;
  final String battlesLabel;
  final int battleWinRatePercent;
  // [week][day], values 0–4 (intensity), 5 weeks × 7 days
  final List<List<int>> activityGrid;
  final List<CategoryAccuracyModel> categoryAccuracies;

  const ProfileModel({
    required this.name,
    required this.handle,
    required this.initial,
    required this.avatarBgColor,
    required this.isPro,
    required this.subtitleLabel,
    required this.streakDays,
    required this.precisionPercent,
    required this.precisionSublabel,
    required this.battlesLabel,
    required this.battleWinRatePercent,
    required this.activityGrid,
    required this.categoryAccuracies,
  });
}
