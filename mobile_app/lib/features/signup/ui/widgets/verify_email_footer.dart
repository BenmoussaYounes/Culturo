import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/verify_email_cubit.dart';

class VerifyEmailFooter extends StatelessWidget {
  final bool isOtpComplete;
  final VoidCallback onVerify;

  const VerifyEmailFooter({super.key, required this.isOtpComplete, required this.onVerify});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
          builder: (context, state) {
            final isLoading = state is VerifyEmailLoading;
            return SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: (isOtpComplete && !isLoading) ? onVerify : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryBlack,
                  disabledBackgroundColor: ColorsManager.greyGreen.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text('Enter the 6 digits', style: InterFontStyle.font16W600White),
              ),
            );
          },
        ),
        verticalSpace(16),
        BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
          builder: (context, state) => switch (state) {
            VerifyEmailReady(:final countdown) when countdown > 0 => Text.rich(
              TextSpan(
                text: "Didn't get the code? ",
                style: InterFontStyle.font13W400GreyGreen,
                children: [
                  TextSpan(
                    text: 'Resend in 0:${countdown.toString().padLeft(2, '0')}',
                    style: InterFontStyle.font13W700Accent,
                  ),
                ],
              ),
            ),
            VerifyEmailReady() => Text.rich(
              TextSpan(
                text: "Didn't get the code? ",
                style: InterFontStyle.font13W400GreyGreen,
                children: [
                  TextSpan(
                    text: 'Resend',
                    style: InterFontStyle.font13W700Accent,
                    recognizer: TapGestureRecognizer()..onTap = () => context.read<VerifyEmailCubit>().resendCode(),
                  ),
                ],
              ),
            ),
            VerifyEmailResending() => SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator.adaptive(strokeWidth: 2),
            ),
            _ => const SizedBox.shrink(),
          },
        ),
      ],
    );
  }
}
