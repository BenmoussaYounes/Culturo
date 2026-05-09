import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class InstrumentSerifFontStyle {
  static TextStyle font18W400GreyGreenItalic = GoogleFonts.instrumentSerif(
    fontSize: 18.sp,
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
}
