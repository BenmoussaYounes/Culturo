import 'package:flutter/material.dart';

class RankingEntryModel {
  final int rank;
  final String username;
  final String initial;
  final int level;
  final String ptsFormatted;
  final String scoreFormatted;
  final Color avatarBg;

  const RankingEntryModel({
    required this.rank,
    required this.username,
    required this.initial,
    required this.level,
    required this.ptsFormatted,
    required this.scoreFormatted,
    required this.avatarBg,
  });
}
