import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../domain/models/battle_game_models.dart';

part 'battle_matchmaking_state.dart';

class BattleMatchmakingCubit extends Cubit<BattleMatchmakingState> {
  BattleMatchmakingCubit() : super(BattleMatchmakingInitial());

  Timer? _matchTimer;

  void loadMatchmaking() {
    emit(
      BattleMatchmakingSearching(
        playerName: 'Amine',
        playerInitial: 'A',
        playerAvatarBg: DesertColors.primary,
        playerLocation: 'Alger',
        playerRank: '#142',
        playerElo: 1842,
        countdown: 3,
        settings: const BattleMatchSettingsModel(
          rounds: 7,
          secondsPerQuestion: 15,
          category: 'Mixte',
          difficulty: 'Moyen',
        ),
        inviteLink: 'tahaddl.dz/v/A7K2',
      ),
    );

    _matchTimer = Timer(const Duration(seconds: 5), onMatchFound);
  }

  void onMatchFound() => emit(BattleMatchmakingNavigateToGame());

  void onCancelTapped() {
    _matchTimer?.cancel();
    emit(BattleMatchmakingPop());
  }

  @override
  Future<void> close() {
    _matchTimer?.cancel();
    return super.close();
  }
}
