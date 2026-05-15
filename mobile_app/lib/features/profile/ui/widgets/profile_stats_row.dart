import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../domain/models/profile_model.dart';

class ProfileStatsRow extends StatelessWidget {
  final ProfileModel profile;

  const ProfileStatsRow({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        _StatCard(
          label: 'SÉRIE\nACTUELLE',
          value: '${profile.streakDays}',
          sublabelWidget: Row(
            children: [
              Text('jours', style: InterFontStyle.font11W500LightGrey),
              horizontalSpace(4),
              Icon(Icons.whatshot, size: 14, color: DesertColors.accent),
            ],
          ),
        ),

        _StatCard(label: 'PRÉCISION', value: '${profile.precisionPercent}', sublabel: profile.precisionSublabel),

        _StatCard(label: 'BATTLES\nN/L', value: profile.battlesLabel, sublabel: '${profile.battleWinRatePercent}%'),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? sublabel;

  final Widget? sublabelWidget;

  const _StatCard({required this.label, required this.value, this.sublabel, this.sublabelWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: 108.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: DesertColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: DesertColors.primarySoft),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .start,
        children: [
          Text(label, style: InterFontStyle.font10W600MediumGrey, maxLines: 2),
          Text(value, style: InstrumentSerifFontStyle.font22W400Ink),
          if (sublabelWidget != null) sublabelWidget! else Text(sublabel!, style: InterFontStyle.font11W500LightGrey),
        ],
      ),
    );
  }
}
