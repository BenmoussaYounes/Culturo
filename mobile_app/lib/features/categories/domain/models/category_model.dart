import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String subtitle;
  final int questionCount;
  final bool isPremium;
  final Color iconColor;
  final Color iconBg;
  final IconData icon;

  const CategoryModel({
    required this.name,
    required this.subtitle,
    required this.questionCount,
    this.isPremium = false,
    required this.iconColor,
    required this.iconBg,
    required this.icon,
  });
}
