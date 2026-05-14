import 'package:flutter/material.dart';

class ColorsManager {
  static const Color primaryBlack = Color(0xFF16201b);
  static const Color ink = Color(0xFF1f2a24);

  static const Color vanilla = Color(0xFFf4ecdd);
  static const Color beige = Color(0xFFebe0cb);

  static const Color lightGrey = Color(0xFF9a9a8e);
  static const Color mediumGrey = Color(0xFF8a8478);
  static const Color greyGreen = Color(0xFF5a6660);
  static const Color greyBlue = Color(0xFF5b6660);
}

/// Desert — default theme (warm cream paper, deep emerald, Casbah terracotta)
class DesertColors {
  static const Color bg = Color(0xFFF4ECDD);
  static const Color surface = Color(0xFFFBF6EA);
  static const Color paper = Color(0xFFF7F4EC);
  static const Color primarySoft = Color(0xFFE1ECE5); // soft emerald glow
  static const Color primary = Color(0xFF0E5C3A);
  static const Color accent = Color(0xFFC8512B);
  static const Color ink = Color(0xFF1F2A24);
  static const Color gold = Color(0xFFC9A24A);
}

/// Patriotic — flag-forward theme (Algeria tricolore)
class PatrioticColors {
  static const Color bg = Color(0xFFF7F5F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF006233);
  static const Color accent = Color(0xFFD21034);
  static const Color ink = Color(0xFF0E1E16);
  static const Color gold = Color(0xFFD4A23B);
}

/// Midnight — dark mode companion
class MidnightColors {
  static const Color bg = Color(0xFF0F1814);
  static const Color surface = Color(0xFF162420);
  static const Color primary = Color(0xFF3DCB8A);
  static const Color accent = Color(0xFFFF8255);
  static const Color ink = Color(0xFFF1ECDD);
  static const Color gold = Color(0xFFE8C36A);
}

/// Semantic & state colors — shared across all themes
class SemanticColors {
  static const Color success = Color(0xFF3A8B5C);
  static const Color warning = Color(0xFFD9A22C);
  static const Color danger = Color(0xFFB53324);
  static const Color frBleu = Color(0xFF0055A4);
}
