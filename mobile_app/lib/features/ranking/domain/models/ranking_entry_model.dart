import 'package:flutter/material.dart';

class RankingEntryModel {
  final int rank;
  final String username;
  final String initial;
  final String country;
  final String countryCode;
  final String ptsFormatted;
  final String scoreFormatted;
  final String deltaFormatted;
  final Color deltaColor;
  final bool isVerified;
  final Color avatarBg;

  const RankingEntryModel({
    required this.rank,
    required this.username,
    required this.initial,
    required this.country,
    required this.countryCode,
    required this.ptsFormatted,
    required this.scoreFormatted,
    required this.deltaFormatted,
    required this.deltaColor,
    this.isVerified = false,
    required this.avatarBg,
  });
}
