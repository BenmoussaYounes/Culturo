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

  static TextStyle font12W400GreyGreen = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.greyGreen,
  );

  static TextStyle font12W600PrimaryBlack = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.primaryBlack,
  );
}
