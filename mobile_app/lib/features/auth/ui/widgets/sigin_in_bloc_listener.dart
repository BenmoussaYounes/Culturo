import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
        SignInSuccess() => ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Signed in successfully!'))),
        SignInError(:final message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message))),
        ForgotPasswordState(:final email) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Password reset link sent to $email'))),
        CreateAccountState(:final email) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Account created successfully! Please check your email at $email'))),
        _ => null,
      },
      child: const SizedBox.shrink(),
    );
  }
}
