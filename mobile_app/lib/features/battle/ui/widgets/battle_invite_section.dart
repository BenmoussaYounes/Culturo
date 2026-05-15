import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';

class BattleInviteSection extends StatelessWidget {
  final String inviteLink;

  const BattleInviteSection({super.key, required this.inviteLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(color: DesertColors.primarySoft, borderRadius: BorderRadius.circular(14.r)),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: DesertColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.edit_outlined, color: DesertColors.primary, size: 16.sp),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text('Inviter un pote', style: InterFontStyle.font14W600Ink),
                verticalSpace(2),
                Text(
                  '$inviteLink — copié dans le presse-papier',
                  style: InterFontStyle.font12W400GreyGreen,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
