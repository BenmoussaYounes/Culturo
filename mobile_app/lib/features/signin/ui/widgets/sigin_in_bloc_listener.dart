import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/sign_in_cubit.dart';

class SiginInBlocListener extends StatelessWidget {
  const SiginInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is SignInSuccess ||
          current is SignInError ||
          current is ForgotPasswordState ||
          current is CreateAccountState,
      listener: (context, state) => switch (state) {
        SignInSuccess() => context.pushNamed(Routes.home),
        SignInError(:final message) => showErrorSnackbar(context, message),
        ForgotPasswordState(:final email) => context.pushNamed(Routes.forgotPassword, arguments: email),
        CreateAccountState(:final email) => showSuccessSnackbar(
          context,
          'Account created successfully! Please check your email at $email',
        ),
        _ => null,
      },
      child: const SizedBox.shrink(),
    );
  }
}
