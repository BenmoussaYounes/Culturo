import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/battle_models.dart';

part 'battle_state.dart';

class BattleCubit extends Cubit<BattleState> {
  BattleCubit() : super(BattleInitial());

  BattleLoaded? _loadedState;

  void loadBattle() {
    final s = BattleLoaded(
      onlineCountLabel: '1 842',
      eloLabel: '1 842',
      eloDeltaLabel: '+24',
      rankLabel: 'Rang Argent II · 158 avant Or',
      rankProgress: 0.52,
      winsLabel: '32 W',
      lossesLabel: '18 L',
      winRateLabel: '64% WIN',
      streakLabel: '5 en série',
      categories: const [
        BattleCategoryModel(label: 'Mixte', isSelected: true),
        BattleCategoryModel(label: 'Histoire', isSelected: false),
        BattleCategoryModel(label: 'Darja', isSelected: false),
        BattleCategoryModel(label: 'Football', isSelected: false),
        BattleCategoryModel(label: 'Musique', isSelected: false),
      ],
      recentOpponents: const [
        BattleRecentOpponentModel(
          username: 'mehdi_31',
          initial: 'M',
          avatarBg: Color(0xFF2A6B4A),
          isOnline: true,
          location: 'Oran',
          elo: 1910,
          timeLabel: 'hier',
        ),
      ],
    );
    _loadedState = s;
    emit(s);
  }

  void onQuickMatchTapped() {
    emit(BattleNavigateToMatchmaking());
    if (_loadedState != null) emit(_loadedState!);
  }
}
