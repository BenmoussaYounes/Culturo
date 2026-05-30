import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('CREATE ACCOUNT', style: InterFontStyle.font10W600Primary),
        verticalSpace(4),
        Text('Join the\nquiz.', style: InstrumentSerifFontStyle.font38W400BlackItalic.copyWith(height: 1.h)),
        verticalSpace(8),
        Text(
          "We'll send a 6-digit code to your email to confirm it's really you.",
          style: InterFontStyle.font14W500GreyGreen,
        ),
      ],
    );
  }
}
