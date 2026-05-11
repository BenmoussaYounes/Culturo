import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';

class DoYouRellayNowText extends StatelessWidget {
  const DoYouRellayNowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        RichText(
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          text: TextSpan(
            text: 'Do you',
            style: InstrumentSerifFontStyle.font38W400BlackItalic.copyWith(height: 0.9.h),
            children: [
              WidgetSpan(child: horizontalSpace(4)),
              TextSpan(
                text: 'really \n',
                style: InstrumentSerifFontStyle.font38W400Italic(DesertColors.primary).copyWith(height: 0.5.h),
              ),
              TextSpan(text: 'know Your \n', style: InstrumentSerifFontStyle.font38W400BlackItalic),
              TextSpan(text: 'country?', style: InstrumentSerifFontStyle.font38W400BlackItalic),
            ],
          ),
        ),
        verticalSpace(8),
        Text(
          'Connais-tu vraiment ton bled ?',
          style: InstrumentSerifFontStyle.font18W400GreyGreenItalic.copyWith(letterSpacing: -0.5),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('هل تعرف بلدك حقًّا؟', style: InstrumentSerifFontStyle.font18W400GreyGreenItalic)],
        ),
        verticalSpace(16),
        Text(
          'History, music, slang, food, football. Pick one country — or many — and prove it.',
          style: InterFontStyle.font16W600White.copyWith(
            color: ColorsManager.lightGrey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
