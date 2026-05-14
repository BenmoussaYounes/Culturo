import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../domain/models/user_info_model.dart';

class HomeHeader extends StatelessWidget {
  final UserInfoModel userInfo;

  const HomeHeader({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      children: [
        Row(
          children: [
            AppAvatar(userInfo.initial, userInfo.avatarBgColor),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '${userInfo.name}!',
                  style: InstrumentSerifFontStyle.font16W400GreyGreenItalic.copyWith(height: 0.8.h),
                ),
                Text(userInfo.name, style: InstrumentSerifFontStyle.font18W400PrimaryWhite),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: DesertColors.accent.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.local_fire_department, size: 14.sp, color: DesertColors.accent),
              horizontalSpace(4),
              Text('${userInfo.streakCount}', style: InterFontStyle.font13W700Accent),
            ],
          ),
        ),
      ],
    );
  }
}
