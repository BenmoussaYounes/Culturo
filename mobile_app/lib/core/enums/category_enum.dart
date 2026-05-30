import 'package:flutter/widgets.dart';

enum CategoryThemeEnum {
  teal(Color(0xFF2A7D65), Color(0xFFD0ECE5), "TEAL", 1),
  rose(Color(0xFFB54470), Color(0xFFF5DDE5), "ROSE", 2),
  blue(Color(0xFF2A5A8B), Color(0xFFD6E8F5), "BLUE", 3),
  forest(Color(0xFF3A7A35), Color(0xFFD8EDD5), "FOREST", 4),
  brown(Color(0xFF8B5E35), Color(0xFFF0E2D0), "BROWN", 5),
  crimson(Color(0xFF8B2A2A), Color(0xFFEDD5D5), "CRIMSON", 6),
  purple(Color(0xFF5E2A8B), Color(0xFFE8D5F0), "PURPLE", 7),
  orange(Color(0xFFB5632A), Color(0xFFF5D9C9), "ORANGE", 8),
  cyan(Color(0xFF2A8B8B), Color(0xFFD5EDED), "CYAN", 9);

  const CategoryThemeEnum(this.primaryColor, this.bgColor, this.name, this.themeIndex);

  final Color primaryColor;
  final Color bgColor;
  final String name;
  final int themeIndex;

  static CategoryThemeEnum getThemeFromName(String name) =>
      CategoryThemeEnum.values.firstWhere((element) => element.name == name);

  static CategoryThemeEnum getThemeFromIndex(int index) =>
      CategoryThemeEnum.values.firstWhere((element) => element.themeIndex == index);
}
