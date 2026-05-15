import 'package:culturo/core/theming/instrument_serif_font_style.dart';
import 'package:culturo/core/theming/jet_brains_mono_font_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../domain/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      children: [
        CircleAvatar(
          radius: 32.r,
          backgroundColor: profile.avatarBgColor,
          child: Text(profile.initial, style: InstrumentSerifFontStyle.font30W400WhiteItalic),
        ),
        horizontalSpace(14),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(profile.name, style: InstrumentSerifFontStyle.font22W400Ink),
                  if (profile.isPro) ...[horizontalSpace(6), _ProBadge()],
                ],
              ),

              Text(profile.handle, style: InterFontStyle.font12W500MediumGrey),
              Text(profile.subtitleLabel, style: InterFontStyle.font12W500MediumGrey),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: DesertColors.gold.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(Icons.diamond, size: 10.sp, color: DesertColors.gold),
          horizontalSpace(3),
          Text('PRO', style: JetBrainsMonoFontStyle.font10W700Gold),
        ],
      ),
    );
  }
}
