import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../domain/models/ranking_entry_model.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  RankingCubit() : super(RankingInitial());

  static const _totalPlayersLabel = '184 320 joueurs';

  static const _entries = [
    RankingEntryModel(
      rank: 1,
      username: 'leila_oran',
      initial: 'L',
      country: "Algérie",
      countryCode: 'DZ',
      ptsFormatted: '14 820',
      scoreFormatted: '14,8k',
      deltaFormatted: '+1',
      deltaColor: SemanticColors.success,
      isVerified: true,
      avatarBg: Color(0xFF2A6B4A),
    ),
    RankingEntryModel(
      rank: 2,
      username: 'k.benz',
      initial: 'K',
      country: 'France',
      countryCode: 'FR',
      ptsFormatted: '14 200',
      scoreFormatted: '14,2k',
      deltaFormatted: '0',
      deltaColor: ColorsManager.lightGrey,
      isVerified: true,
      avatarBg: Color(0xFF1A4B35),
    ),
    RankingEntryModel(
      rank: 3,
      username: 'amir_casa',
      initial: 'A',
      country: 'Maroc',
      countryCode: 'MA',
      ptsFormatted: '14 000',
      scoreFormatted: '14,0k',
      deltaFormatted: '+4',
      deltaColor: SemanticColors.success,
      avatarBg: Color(0xFF3A5530),
    ),
    RankingEntryModel(
      rank: 4,
      username: 'wassim.t',
      initial: 'W',
      country: 'Tunisie',
      countryCode: 'TN',
      ptsFormatted: '13 600',
      scoreFormatted: '13,6k',
      deltaFormatted: '−1',
      deltaColor: SemanticColors.danger,
      isVerified: true,
      avatarBg: Color(0xFF1E3D38),
    ),
    RankingEntryModel(
      rank: 5,
      username: 'rania.k',
      initial: 'R',
      country: 'Algérie',
      countryCode: 'DZ',
      ptsFormatted: '13 100',
      scoreFormatted: '13,1k',
      deltaFormatted: '+2',
      deltaColor: SemanticColors.success,
      isVerified: true,
      avatarBg: Color(0xFF2E5A3A),
    ),
    RankingEntryModel(
      rank: 6,
      username: 'youssef.cai',
      initial: 'Y',
      country: 'Égypte',
      countryCode: 'EG',
      ptsFormatted: '12 900',
      scoreFormatted: '12,9k',
      deltaFormatted: '0',
      deltaColor: ColorsManager.lightGrey,
      avatarBg: Color(0xFF6B6A30),
    ),
    RankingEntryModel(
      rank: 7,
      username: 'noor.b',
      initial: 'N',
      country: 'Liban',
      countryCode: 'LB',
      ptsFormatted: '12 400',
      scoreFormatted: '12,4k',
      deltaFormatted: '−3',
      deltaColor: SemanticColors.danger,
      avatarBg: Color(0xFF404035),
    ),
  ];

  void loadRanking() {
    emit(
      RankingLoaded(
        weekLabel: '22 — 28 avril',
        scopePrefix: 'Monde entier',
        totalPlayersLabel: _totalPlayersLabel,
        topEntry: _entries.first,
        entries: _entries,
      ),
    );
  }
}
