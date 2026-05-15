import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/instrument_serif_font_style.dart';
import '../../../core/theming/inter_font_style.dart';
import '../../../core/theming/jet_brains_mono_font_style.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/battle_cubit.dart';
import 'widgets/widgets.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BattleBlocListener(
      child: Scaffold(
        backgroundColor: DesertColors.bg,
        body: BlocBuilder<BattleCubit, BattleState>(
          builder: (context, state) => switch (state) {
            BattleInitial() => const AppCircularProgressIndicator(),
            BattleNavigateToMatchmaking() => const AppCircularProgressIndicator(),
            BattleLoaded() => SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 12.h, bottom: 24.h),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _BattleHeader(onlineCountLabel: state.onlineCountLabel),
                    verticalSpace(14),
                    BattleEloCard(
                      eloLabel: state.eloLabel,
                      eloDeltaLabel: state.eloDeltaLabel,
                      rankLabel: state.rankLabel,
                      rankProgress: state.rankProgress,
                      winsLabel: state.winsLabel,
                      lossesLabel: state.lossesLabel,
                      winRateLabel: state.winRateLabel,
                      streakLabel: state.streakLabel,
                    ),
                    verticalSpace(14),
                    BattleQuickMatchButton(onTap: () => context.read<BattleCubit>().onQuickMatchTapped()),
                    verticalSpace(12),
                    const BattleActionButtons(),
                    verticalSpace(20),
                    BattleCategorySection(categories: state.categories),
                    verticalSpace(20),
                    BattleRecentOpponents(opponents: state.recentOpponents),
                  ],
                ),
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _BattleHeader extends StatelessWidget {
  final String onlineCountLabel;

  const _BattleHeader({required this.onlineCountLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text('MODE', style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.0)),
            Text('Battle lvl', style: InstrumentSerifFontStyle.font26W500ItalicInk),
          ],
        ),
        _OnlineChip(label: onlineCountLabel),
      ],
    );
  }
}

class _OnlineChip extends StatelessWidget {
  final String label;

  const _OnlineChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: DesertColors.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(color: DesertColors.accent, shape: .circle),
          ),
          horizontalSpace(5),
          Text(
            '$label EN LIGNE',
            style: InterFontStyle.font12W400GreyGreen.copyWith(color: DesertColors.accent, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
