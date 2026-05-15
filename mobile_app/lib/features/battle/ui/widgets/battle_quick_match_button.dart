import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';

class BattleQuickMatchButton extends StatelessWidget {
  final VoidCallback onTap;

  const BattleQuickMatchButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(color: DesertColors.accent, borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: Text('⚔', style: TextStyle(fontSize: 18.sp)),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Match rapide', style: InterFontStyle.font16W700Ink.copyWith(color: Colors.white)),
                  Text(
                    'Adversaire de ton niveau · ~5 s',
                    style: InterFontStyle.font12W400GreyGreen.copyWith(color: Colors.white.withValues(alpha: 0.75)),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
