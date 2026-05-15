import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';

class BattleEloCard extends StatelessWidget {
  final String eloLabel;
  final String eloDeltaLabel;
  final String rankLabel;
  final double rankProgress;
  final String winsLabel;
  final String lossesLabel;
  final String winRateLabel;
  final String streakLabel;

  const BattleEloCard({
    super.key,
    required this.eloLabel,
    required this.eloDeltaLabel,
    required this.rankLabel,
    required this.rankProgress,
    required this.winsLabel,
    required this.lossesLabel,
    required this.winRateLabel,
    required this.streakLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: DesertColors.ink, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          Row(
            children: [
              _EloAvatar(),
              horizontalSpace(14),
              _EloInfo(eloLabel: eloLabel, eloDeltaLabel: eloDeltaLabel, rankLabel: rankLabel),
            ],
          ),
          verticalSpace(12),
          _RankProgressBar(progress: rankProgress),
          verticalSpace(10),
          _StatsRow(
            winsLabel: winsLabel,
            lossesLabel: lossesLabel,
            winRateLabel: winRateLabel,
            streakLabel: streakLabel,
          ),
        ],
      ),
    );
  }
}

class _EloAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      height: 52.w,
      decoration: const BoxDecoration(color: DesertColors.accent, shape: .circle),
      alignment: Alignment.center,
      child: Text('A', style: InstrumentSerifFontStyle.font22W700WhiteItalic),
    );
  }
}

class _EloInfo extends StatelessWidget {
  final String eloLabel;
  final String eloDeltaLabel;
  final String rankLabel;

  const _EloInfo({required this.eloLabel, required this.eloDeltaLabel, required this.rankLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'ELO · CETTE SAISON',
          style: JetBrainsMonoFontStyle.font10W500Vanilla.copyWith(
            color: ColorsManager.vanilla.withValues(alpha: 0.55),
            letterSpacing: 0.5,
          ),
        ),
        verticalSpace(2),
        Row(
          crossAxisAlignment: .end,
          children: [
            Text(eloLabel, style: InstrumentSerifFontStyle.font38W400Italic(ColorsManager.vanilla)),
            horizontalSpace(6),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(eloDeltaLabel, style: InterFontStyle.font13W700Ink.copyWith(color: SemanticColors.success)),
            ),
          ],
        ),
        Text(
          rankLabel,
          style: InterFontStyle.font12W400GreyGreen.copyWith(color: ColorsManager.vanilla.withValues(alpha: 0.5)),
        ),
      ],
    );
  }
}

class _RankProgressBar extends StatelessWidget {
  final double progress;

  const _RankProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.vanilla.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [DesertColors.gold, DesertColors.accent]),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final String winsLabel;
  final String lossesLabel;
  final String winRateLabel;
  final String streakLabel;

  const _StatsRow({
    required this.winsLabel,
    required this.lossesLabel,
    required this.winRateLabel,
    required this.streakLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            Text(winsLabel, style: JetBrainsMonoFontStyle.font10W500Vanilla),
            horizontalSpace(12),
            Text(lossesLabel, style: JetBrainsMonoFontStyle.font10W500Vanilla),
            horizontalSpace(12),
            Text(winRateLabel, style: JetBrainsMonoFontStyle.font10W500Vanilla),
          ],
        ),
        Text('★ $streakLabel', style: JetBrainsMonoFontStyle.font10W700Gold),
      ],
    );
  }
}
