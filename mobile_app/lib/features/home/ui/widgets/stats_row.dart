import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/user_stats_domain_model.dart';

class StatsRow extends StatelessWidget {
  final UserStatsDomainModel stats;

  const StatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCard(value: '${stats.xp}', label: 'Xp'),
        horizontalSpace(10),
        _StatCard(value: '${stats.level}', label: 'LEVEL'),
        horizontalSpace(10),
        _StatCard(value: '#${stats.rank}', label: 'RANG'),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

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
          Text(value, style: InstrumentSerifFontStyle.font26W500Ink),
          verticalSpace(1),
          Text(label, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ],
      ),
    );
  }
}
