import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../data/dtos/battle_socket_dtos.dart';
import '../../data/repositories/battle_repository.dart';
import '../../domain/models/battle_game_models.dart';

part 'battle_matchmaking_state.dart';

class BattleMatchmakingCubit extends Cubit<BattleMatchmakingState> {
  final BattleRepository _repository;

  BattleMatchmakingCubit(this._repository) : super(BattleMatchmakingInitial());

  StreamSubscription<MatchFoundDto>? _matchFoundSub;
  late BattleMatchmakingSearching _searchingState;

  Future<void> loadMatchmaking(String categoryId) async {
    _searchingState = BattleMatchmakingSearching(
      playerName: 'Amine',
      playerInitial: 'A',
      playerAvatarBg: DesertColors.primary,
      playerLocation: 'Alger',
      playerRank: '#142',
      playerElo: 1842,
      countdown: null,
      settings: const BattleMatchSettingsModel(
        rounds: 7,
        secondsPerQuestion: 15,
        category: 'Mixte',
        difficulty: 'Moyen',
      ),
      inviteLink: 'tahaddl.dz/v/A7K2',
    );
    emit(_searchingState);

    try {
      await _repository.connect();
    } catch (_) {
      if (!isClosed) emit(BattleMatchmakingPop());
      return;
    }

    if (isClosed) return;
    _repository.findMatch(categoryId);
    _matchFoundSub = _repository.onMatchFound.listen(_onMatchFound);
  }

  void _onMatchFound(MatchFoundDto dto) {
    _matchFoundSub?.cancel();
    emit(
      BattleMatchmakingNavigateToGame(
        battleId: dto.battleId,
        playerName: _searchingState.playerName,
        playerInitial: _searchingState.playerInitial,
        playerAvatarBg: _searchingState.playerAvatarBg,
        opponentName: dto.opponentUsername,
        opponentElo: dto.opponentElo,
      ),
    );
  }

  void onCancelTapped() {
    _matchFoundSub?.cancel();
    _repository.disconnect();
    emit(BattleMatchmakingPop());
  }

  @override
  Future<void> close() {
    _matchFoundSub?.cancel();
    return super.close();
  }
}
