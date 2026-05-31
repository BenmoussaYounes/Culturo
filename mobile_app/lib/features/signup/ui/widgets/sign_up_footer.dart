import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/states/action_state.dart';
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
        BlocBuilder<SignUpCubit, ActionState>(
          builder: (context, state) => state.maybeWhen(
            processing: () => SizedBox(
              width: double.infinity,
              height: 52.h,
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            orElse: () => SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: onSendCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryBlack,
                  disabledBackgroundColor: ColorsManager.primaryBlack.withValues(alpha: 0.6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Text('Send verification code', style: InterFontStyle.font16W600White),
              ),
            ),
          ),
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
