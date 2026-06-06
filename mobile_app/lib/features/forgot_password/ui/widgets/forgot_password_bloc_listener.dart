import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../cubit/forgot_password_cubit.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  final Widget child;

  const ForgotPasswordBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) => switch (state) {
        ForgotPasswordSuccess() => _onSuccess(context),
        ForgotPasswordError(:final message) => showErrorSnackbar(context, message),
        _ => null,
      },
      child: child,
    );
  }

  void _onSuccess(BuildContext context) {
    showSuccessSnackbar(context, 'Reset link sent — check your inbox.');
    context.pop();
  }
}
