import 'package:flutter/widgets.dart';

class CategoryModel {
  final String name;
  final String description;
  final bool isPremium;
  final Color iconColor;
  final Color iconBg;

  const CategoryModel({
    required this.name,
    required this.description,
    this.isPremium = false,
    required this.iconColor,
    required this.iconBg,
  });
}
