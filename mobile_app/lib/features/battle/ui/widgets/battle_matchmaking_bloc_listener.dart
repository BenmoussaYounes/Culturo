import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../battle_game_screen.dart';
import '../cubit/battle_matchmaking_cubit.dart';

class BattleMatchmakingBlocListener extends StatelessWidget {
  final Widget child;

  const BattleMatchmakingBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BattleMatchmakingCubit, BattleMatchmakingState>(
      listener: (context, state) => switch (state) {
        BattleMatchmakingNavigateToGame(
          :final battleId,
          :final playerName,
          :final playerInitial,
          :final playerAvatarBg,
          :final opponentName,
          :final opponentElo,
        ) =>
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => BattleGameScreen(
                battleId: battleId,
                playerName: playerName,
                playerInitial: playerInitial,
                playerAvatarBg: playerAvatarBg,
                opponentName: opponentName,
                opponentElo: opponentElo,
              ),
            ),
          ),
        BattleMatchmakingPop() => Navigator.of(context).pop(),
        _ => null,
      },
      child: child,
    );
  }
}
