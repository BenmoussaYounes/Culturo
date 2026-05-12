import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class InterFontStyle {
  static TextStyle font16W600White = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font12W600GreyGreen = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.greyGreen,
  );

  static TextStyle font12W600PrimaryBlack = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.primaryBlack,
  );

  static TextStyle font10W600Primary = GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: DesertColors.primary,
    letterSpacing: 0.8,
  );

  static TextStyle font14W500GreyGreen = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.greyGreen,
  );

  static TextStyle font11W500LightGrey = GoogleFonts.inter(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.lightGrey,
  );

  static TextStyle font13W700Accent = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: DesertColors.accent,
  );

  static TextStyle font15W500Ink = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.primaryBlack,
  );

  static TextStyle font13W400GreyGreen = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.greyGreen,
  );
}
