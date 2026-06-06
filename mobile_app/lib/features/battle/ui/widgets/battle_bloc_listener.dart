import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../battle_matchmaking_screen.dart';
import '../cubit/battle_cubit.dart';

class BattleBlocListener extends StatelessWidget {
  final Widget child;

  const BattleBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BattleCubit, BattleState>(
      listener: (context, state) => switch (state) {
        BattleNavigateToMatchmaking(:final categoryId) => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => BattleMatchmakingScreen(categoryId: categoryId))),
        _ => null,
      },
      child: child,
    );
  }
}
