import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:culturo/core/helpers/spacing.dart';
import 'package:culturo/core/theming/theming.dart';
import '../cubit/sign_in_cubit.dart';

class SignInFooter extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onCreateAccount;

  const SignInFooter({super.key, required this.onSignIn, required this.onCreateAccount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            final isLoading = state is SignInLoading;
            return SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: isLoading ? null : onSignIn,
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
                    : Text('Sign in', style: InterFontStyle.font16W600White),
              ),
            );
          },
        ),
        verticalSpace(16),
        Text.rich(
          TextSpan(
            text: 'New here? ',
            style: InterFontStyle.font13W400GreyGreen,
            children: [
              TextSpan(
                text: 'Create an account',
                style: InterFontStyle.font13W700Accent,
                recognizer: TapGestureRecognizer()..onTap = onCreateAccount,
              ),
            ],
          ),
          textAlign: .center,
        ),
      ],
    );
  }
}
