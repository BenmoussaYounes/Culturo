import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class VerifyEmailHeader extends StatelessWidget {
  final String email;

  const VerifyEmailHeader({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('STEP 2 OF 2 · VERIFY', style: InterFontStyle.font10W600Primary),
        verticalSpace(4),
        Text('Check your\ninbox.', style: InstrumentSerifFontStyle.font38W400BlackItalic.copyWith(height: 1.h)),
        verticalSpace(8),
        Text.rich(
          TextSpan(
            text: 'We sent a 6-digit code to ',
            style: InterFontStyle.font14W500GreyGreen,
            children: [
              TextSpan(
                text: email,
                style: InterFontStyle.font14W500GreyGreen.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.primaryBlack,
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: 'change',
                style: InterFontStyle.font14W500GreyGreen.copyWith(color: DesertColors.accent),
                recognizer: TapGestureRecognizer()..onTap = context.pop,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
