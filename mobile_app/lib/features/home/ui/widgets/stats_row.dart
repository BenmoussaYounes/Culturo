import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/user_stats_model.dart';

class StatsRow extends StatelessWidget {
  final UserStatsModel stats;

  const StatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCard(value: '${stats.streakDays}', unit: ' jours', label: 'SÉRIE'),
        horizontalSpace(10),
        _StatCard(value: '${stats.precisionPercent}', unit: ' %', label: 'PRÉCISION'),
        horizontalSpace(10),
        _StatCard(value: '#${stats.rank}', unit: stats.city, label: 'RANG'),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const _StatCard({required this.value, required this.unit, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: DesertColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: DesertColors.primarySoft),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: value, style: InstrumentSerifFontStyle.font26W500Ink),
                if (unit.isNotEmpty) TextSpan(text: unit, style: InstrumentSerifFontStyle.font13W400MediumGrey),
              ],
            ),
          ),
          verticalSpace(1),
          Text(label, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ],
      ),
    );
  }
}
