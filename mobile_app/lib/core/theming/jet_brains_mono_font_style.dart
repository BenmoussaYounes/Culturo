import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class JetBrainsMonoFontStyle {
  static TextStyle font10W700Primary(Color color) =>
      GoogleFonts.jetBrainsMono(fontSize: 10.sp, fontWeight: FontWeight.w700, color: color);

  // Grey Blue
  static TextStyle font11W600GreyBlue = GoogleFonts.jetBrainsMono(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.greyBlue,
  );

  // Gold
  static TextStyle font10W700Gold = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: DesertColors.gold,
  );

  // Ink
  static TextStyle font12W600Ink = GoogleFonts.jetBrainsMono(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: DesertColors.ink,
  );

  // white
  static TextStyle font12W400White = GoogleFonts.jetBrainsMono(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font16W400Ink = GoogleFonts.jetBrainsMono(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: DesertColors.ink,
  );

  // Light grey
  static TextStyle font10W600Grey = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.lightGrey,
  );

  // White
  static TextStyle font10W600White = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font10W500White = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font9W600White = GoogleFonts.jetBrainsMono(
    fontSize: 9.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font9W600(Color color) =>
      GoogleFonts.jetBrainsMono(fontSize: 9.sp, fontWeight: FontWeight.w600, color: color);

  static TextStyle font22W700White = GoogleFonts.jetBrainsMono(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle font13W600Ink = GoogleFonts.jetBrainsMono(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: DesertColors.ink,
  );

  static TextStyle font11W600(Color color) =>
      GoogleFonts.jetBrainsMono(fontSize: 11.sp, fontWeight: FontWeight.w600, color: color);

  // Medium Grey
  static TextStyle font10W500MediumGrey = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.mediumGrey,
  );
  // Medium Grey
  static TextStyle font11W500MediumGrey = GoogleFonts.jetBrainsMono(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.mediumGrey,
  );

  // Vanilla
  static TextStyle font10W500Vanilla = GoogleFonts.jetBrainsMono(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.vanilla,
  );
}
