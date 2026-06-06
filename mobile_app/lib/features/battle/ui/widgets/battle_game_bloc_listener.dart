import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/battle_game_cubit.dart';

class BattleGameBlocListener extends StatelessWidget {
  final Widget child;

  const BattleGameBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BattleGameCubit, BattleGameState>(
      listener: (context, state) => switch (state) {
        BattleGameFinished() => Navigator.of(context).popUntil((r) => r.isFirst),
        _ => null,
      },
      child: child,
    );
  }
}
