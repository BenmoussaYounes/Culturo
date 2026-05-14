import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class InstrumentSerifFontStyle {
  static TextStyle font18W400White = GoogleFonts.instrumentSerif(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFFFFFF),
  );

  // primary white
  static TextStyle font18W400PrimaryWhite = GoogleFonts.instrumentSerif(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryWhite,
  );

  //
  static TextStyle font18W400GreyGreenItalic = GoogleFonts.instrumentSerif(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.greyGreen,
    fontStyle: FontStyle.italic,
  );

  static TextStyle font16W400GreyGreenItalic = GoogleFonts.instrumentSerif(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.greyGreen,
    fontStyle: FontStyle.italic,
  );
  // Black
  static TextStyle font19W400Black = GoogleFonts.instrumentSerif(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryBlack,
  );
  static TextStyle font38W400BlackItalic = GoogleFonts.instrumentSerif(
    fontSize: 38.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryBlack,
    fontStyle: FontStyle.italic,
  );

  static TextStyle font38W400Italic(Color color) => GoogleFonts.instrumentSerif(
    fontSize: 38.sp,
    fontWeight: FontWeight.w400,
    color: color,
    fontStyle: FontStyle.italic,
  );

  static TextStyle font30W500WhiteItalic = GoogleFonts.instrumentSerif(
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFFFFFFF),
    fontStyle: FontStyle.italic,
  );

  static TextStyle font28W400WhiteItalic = GoogleFonts.instrumentSerif(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFFFFFF),
    fontStyle: FontStyle.italic,
  );

  static TextStyle font26W500Ink = GoogleFonts.instrumentSerif(
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
    color: DesertColors.ink,
  );

  static TextStyle font22W400Ink = GoogleFonts.instrumentSerif(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryBlack,
  );

  // Medium Grey
  static TextStyle font13W400MediumGrey = GoogleFonts.instrumentSerif(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.mediumGrey,
  );
}
