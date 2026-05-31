import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/enter_email_otp_cubit.dart';

class EnterEmailOtpBlocListener extends StatelessWidget {
  const EnterEmailOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnterEmailOtpCubit, EnterEmailOtpState>(
      listenWhen: (_, current) =>
          current is SignUpSuccess ||
          current is SignUpFailure ||
          current is EmailOtpResendSuccess ||
          current is EmailOtpResendError,
      listener: (context, state) => state.maybeWhen(
        signUpSuccess: (email) => context.pushReplacementNamed(Routes.home),
        signUpFailure: (message) => showErrorSnackbar(context, message),
        emailOtpResendSuccess: () => showSuccessSnackbar(context, 'OTP resent successfully'),
        emailOtpResendError: (message) => showErrorSnackbar(context, message),
        orElse: () {},
      ),

      child: const SizedBox.shrink(),
    );
  }
}
