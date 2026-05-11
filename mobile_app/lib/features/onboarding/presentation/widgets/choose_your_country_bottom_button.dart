import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../cubit/onboarding_cubit.dart';

class ChooseYourCountryBottomButton extends StatelessWidget {
  const ChooseYourCountryBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        ElevatedButton(
          onPressed: () => context.read<OnboardingCubit>().navigateToSignUpPage(),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48.h),
            backgroundColor: ColorsManager.primaryBlack,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
          child: Text('Choose Your Country →', style: InterFontStyle.font16W600White),
        ),
        verticalSpace(16),
        RichText(
          text: TextSpan(
            text: 'Already have an account?',
            style: InterFontStyle.font12W400GreyGreen,
            children: [
              WidgetSpan(child: horizontalSpace(6)),
              TextSpan(
                text: 'Sign In',
                style: InterFontStyle.font12W600PrimaryBlack.copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
