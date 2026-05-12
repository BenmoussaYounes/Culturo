import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('WELCOME BACK', style: InterFontStyle.font10W600Primary),
        verticalSpace(4),
        Text('Sign in to\nyour account.', style: InstrumentSerifFontStyle.font38W400BlackItalic.copyWith(height: 1.h)),
        verticalSpace(8),
        Text('Pick up your streak where you left off.', style: InterFontStyle.font14W500GreyGreen),
      ],
    );
  }
}
