import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onSendCode;

  const SignUpFooter({super.key, required this.onSendCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final isLoading = state is SignUpLoading;
            return SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: isLoading ? null : onSendCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryBlack,
                  disabledBackgroundColor: ColorsManager.primaryBlack.withValues(alpha: 0.6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text('Send verification code', style: InterFontStyle.font16W600White),
              ),
            );
          },
        ),
        verticalSpace(12),
        Text.rich(
          TextSpan(
            text: 'By creating an account you agree to the ',
            style: InterFontStyle.font13W400GreyGreen,
            children: [
              TextSpan(
                text: 'Terms',
                style: InterFontStyle.font13W400GreyGreen.copyWith(
                  decoration: TextDecoration.underline,
                  color: ColorsManager.primaryBlack,
                  fontWeight: FontWeight.w700,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: ' and ', style: InterFontStyle.font13W400GreyGreen),
              TextSpan(
                text: 'Privacy',
                style: InterFontStyle.font13W400GreyGreen.copyWith(
                  decoration: TextDecoration.underline,
                  color: ColorsManager.primaryBlack,
                  fontWeight: FontWeight.w700,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: '.', style: InterFontStyle.font13W400GreyGreen),
            ],
          ),
          textAlign: .center,
        ),
      ],
    );
  }
}
