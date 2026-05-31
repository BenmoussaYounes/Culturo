import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/enter_email_otp_cubit.dart';

class EnterOtpFooter extends StatelessWidget {
  final bool isOtpComplete;
  final VoidCallback onOtpValidation;

  const EnterOtpFooter({super.key, required this.isOtpComplete, required this.onOtpValidation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        BlocBuilder<EnterEmailOtpCubit, EnterEmailOtpState>(
          builder: (context, state) => state.maybeWhen(
            signUpProcessing: () => SizedBox(
              width: double.infinity,
              height: 52.h,
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            orElse: () => SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: isOtpComplete ? onOtpValidation : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryBlack,
                  disabledBackgroundColor: ColorsManager.greyGreen.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Text('Enter the 6 digits', style: InterFontStyle.font16W600White),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        BlocBuilder<EnterEmailOtpCubit, EnterEmailOtpState>(
          builder: (context, state) => state.maybeWhen(
            emailOtpReady: (countdown) => Text.rich(
              TextSpan(
                text: "Didn't get the code? ",
                style: InterFontStyle.font13W400GreyGreen,
                children: [
                  if (countdown > 0)
                    TextSpan(
                      text: 'Resend in 0:${countdown.toString().padLeft(2, '0')}',
                      style: InterFontStyle.font13W700Accent,
                    )
                  else
                    TextSpan(
                      text: 'Resend',
                      style: InterFontStyle.font13W700Accent,
                      recognizer: TapGestureRecognizer()..onTap = () => context.read<EnterEmailOtpCubit>().resendCode(),
                    ),
                ],
              ),
            ),
            emailOtpResending: () =>
                SizedBox(height: 20.h, width: 20.h, child: const CircularProgressIndicator.adaptive(strokeWidth: 2)),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
