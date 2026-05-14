import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/daily_challenge_model.dart';

class DailyChallengeCard extends StatelessWidget {
  final DailyChallengeModel data;

  const DailyChallengeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(color: DesertColors.primary, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _CardTopRow(date: data.date, resetCountdown: data.resetCountdown),
          verticalSpace(10),
          Text(
            '${data.questionCount} questions.\nUne seule chance.',
            style: InstrumentSerifFontStyle.font30W500WhiteItalic.copyWith(height: 1.1.h),
          ),
          verticalSpace(14),
          _CardBottomRow(playsCount: data.playsCountFormatted),
        ],
      ),
    );
  }
}

class _CardTopRow extends StatelessWidget {
  final String date;
  final String resetCountdown;

  const _CardTopRow({required this.date, required this.resetCountdown});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: JetBrainsMonoFontStyle.font10W600White.copyWith(
              color: const Color(0xFFFFFFFF).withValues(alpha: 0.6),
            ),
            children: [
              const TextSpan(text: 'DÉFI'),
              WidgetSpan(child: horizontalSpace(8)),
              const TextSpan(text: 'DU'),
              WidgetSpan(child: horizontalSpace(8)),
              const TextSpan(text: 'JOUR'),
              WidgetSpan(child: horizontalSpace(12)),
              const TextSpan(text: '·'),
              WidgetSpan(child: horizontalSpace(12)),
              TextSpan(text: date),
            ],
          ),
        ),
        Text(
          ' Reset $resetCountdown',
          style: JetBrainsMonoFontStyle.font10W500White.copyWith(color: const Color(0xFFFFFFFF).withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}

class _CardBottomRow extends StatelessWidget {
  final String playsCount;

  const _CardBottomRow({required this.playsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
            alignment: Alignment.center,
            child: Text('Jouer maintenant', style: InterFontStyle.font15W700PrimaryGreen),
          ),
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(playsCount, style: InterFontStyle.font13W700White),
            Text(
              'déjà joué',
              style: InterFontStyle.font12W500White.copyWith(color: const Color(0xFFFFFFFF).withValues(alpha: 0.6)),
            ),
          ],
        ),
      ],
    );
  }
}
