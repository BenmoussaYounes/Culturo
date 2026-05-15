import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/verify_email_cubit.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listenWhen: (_, current) =>
          current is VerifyEmailSuccess ||
          current is VerifyEmailError ||
          current is VerifyEmailResendSuccess ||
          current is VerifyEmailResendError,
      listener: (context, state) => switch (state) {
        VerifyEmailSuccess() => context.pushNamedAndRemoveUntil(Routes.home, predicate: (_) => false),
        VerifyEmailError(:final message) => showErrorSnackbar(context, message),
        VerifyEmailResendSuccess() => showSuccessSnackbar(context, 'Verification code resent!'),
        VerifyEmailResendError(:final message) => showErrorSnackbar(context, message),
        _ => null,
      },
      child: const SizedBox.shrink(),
    );
  }
}
