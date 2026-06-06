import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extentions.dart';
import '../theming/colors_manager.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorsManager.primaryBlack.withValues(alpha: 0.15)),
        ),
        child: Icon(Icons.arrow_back, size: 18.sp, color: ColorsManager.primaryBlack),
      ),
    );
  }
}
