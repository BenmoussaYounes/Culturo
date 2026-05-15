import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/jet_brains_mono_font_style.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/battle_game_cubit.dart';
import 'widgets/widgets.dart';

class BattleGameScreen extends StatelessWidget {
  const BattleGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<BattleGameCubit>()..loadGame(), child: const _GameContent());
  }
}

class _GameContent extends StatelessWidget {
  const _GameContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<BattleGameCubit, BattleGameState>(
        builder: (context, state) => switch (state) {
          BattleGameInitial() => const AppCircularProgressIndicator(),
          BattleGameInProgress() => SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  BattleGameHeader(
                    player1Name: state.player1Name,
                    player1Initial: state.player1Initial,
                    player1AvatarBg: state.player1AvatarBg,
                    player1Answered: state.player1Answered,
                    player1Score: state.player1Score,
                    player2Name: state.player2Name,
                    player2Initial: state.player2Initial,
                    player2AvatarBg: state.player2AvatarBg,
                    player2Thinking: state.player2Thinking,
                    player2Score: state.player2Score,
                    totalRounds: state.totalRounds,
                    timerProgress: state.timerProgress,
                  ),
                  verticalSpace(12),
                  _RoundInfoRow(
                    currentRound: state.currentRound,
                    totalRounds: state.totalRounds,
                    category: state.category,
                    timerLabel: state.timerLabel,
                  ),
                  verticalSpace(20),
                  BattleGameQuestion(
                    before: state.questionBefore,
                    highlight: state.questionHighlight,
                    after: state.questionAfter,
                  ),
                  verticalSpace(20),
                  for (final answer in state.answers) ...[BattleGameAnswerOption(answer: answer), verticalSpace(10)],
                  const Spacer(),
                  const BattleGameReactions(),
                  verticalSpace(8),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}

class _RoundInfoRow extends StatelessWidget {
  final int currentRound;
  final int totalRounds;
  final String category;
  final String timerLabel;

  const _RoundInfoRow({
    required this.currentRound,
    required this.totalRounds,
    required this.category,
    required this.timerLabel,
  });

  @override
  Widget build(BuildContext context) {
    final roundStr = currentRound.toString().padLeft(2, '0');
    final totalStr = totalRounds.toString().padLeft(2, '0');

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          'MANCHE $roundStr / $totalStr · ${category.toUpperCase()}',
          style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 0.8),
        ),
        Text(timerLabel, style: JetBrainsMonoFontStyle.font13W600Ink.copyWith(color: DesertColors.primary)),
      ],
    );
  }
}
