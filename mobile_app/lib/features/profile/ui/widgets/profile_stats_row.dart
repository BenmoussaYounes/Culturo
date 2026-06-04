import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../domain/models/profile_model.dart';

class ProfileStatsRow extends StatelessWidget {
  final ProfileModel profile;

  const ProfileStatsRow({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final xpFormatted = _formatXp(profile.xp);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        _StatCard(label: 'NIVEAU', value: '${profile.level}', sublabel: 'actuel'),
        _StatCard(label: 'XP TOTAL', value: xpFormatted, sublabel: 'points'),
        _StatCard(
          label: 'BATTLES',
          value: profile.isBattleUnlocked ? 'Actif' : 'Bloqué',
          sublabelWidget: Icon(
            profile.isBattleUnlocked ? Icons.lock_open_rounded : Icons.lock_rounded,
            size: 14,
            color: profile.isBattleUnlocked ? SemanticColors.success : ColorsManager.lightGrey,
          ),
        ),
      ],
    );
  }

  String _formatXp(int xp) {
    if (xp < 1000) return '$xp';
    final s = xp.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(' ');
      buf.write(s[i]);
    }
    return buf.toString();
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
          if (sublabelWidget != null)
            sublabelWidget!
          else
            Text(sublabel ?? '', style: InterFontStyle.font11W500LightGrey),
        ],
      ),
    );
  }
}
