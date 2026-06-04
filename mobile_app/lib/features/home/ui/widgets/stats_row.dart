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
        _StatCard(
          value: stats.isBattleUnlocked ? 'Actif' : 'Bloqué',
          label: 'BATTLES',
          valueWidget: Row(
            children: [
              Icon(
                stats.isBattleUnlocked ? Icons.lock_open_rounded : Icons.lock_rounded,
                size: 20.sp,
                color: stats.isBattleUnlocked ? SemanticColors.success : ColorsManager.lightGrey,
              ),
              horizontalSpace(6),
              Text(stats.isBattleUnlocked ? 'Actif' : 'Bloqué', style: InstrumentSerifFontStyle.font22W400Ink),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Widget? valueWidget;

  const _StatCard({required this.value, required this.label, this.valueWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
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
          valueWidget ?? Text(value, style: InstrumentSerifFontStyle.font26W500Ink),
          verticalSpace(1),
          Text(label, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ],
      ),
    );
  }
}
