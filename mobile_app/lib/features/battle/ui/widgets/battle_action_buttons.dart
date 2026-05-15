import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';

class BattleActionButtons extends StatelessWidget {
  const BattleActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            iconWidget: Icon(Icons.edit_outlined, color: DesertColors.primary, size: 18.sp),
            iconBg: DesertColors.primary.withValues(alpha: 0.1),
            title: 'Pote',
            subtitle: 'Inviter un ami',
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: _ActionCard(
            iconWidget: Text(
              '#',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: DesertColors.ink),
            ),
            iconBg: ColorsManager.mediumGrey.withValues(alpha: 0.15),
            title: 'Code',
            subtitle: 'Rejoindre',
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final Widget iconWidget;
  final Color iconBg;
  final String title;
  final String subtitle;

  const _ActionCard({required this.iconWidget, required this.iconBg, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        decoration: BoxDecoration(color: DesertColors.surface, borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(8.r)),
              alignment: Alignment.center,
              child: iconWidget,
            ),
            verticalSpace(10),
            Text(title, style: InterFontStyle.font14W600Ink),
            verticalSpace(2),
            Text(subtitle, style: InterFontStyle.font12W400GreyGreen),
          ],
        ),
      ),
    );
  }
}
