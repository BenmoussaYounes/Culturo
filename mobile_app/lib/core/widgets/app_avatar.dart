import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/instrument_serif_font_style.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar(this.initial, this.bgColor, {super.key});

  final String initial;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(initial, style: InstrumentSerifFontStyle.font18W400White),
    );
  }
}
