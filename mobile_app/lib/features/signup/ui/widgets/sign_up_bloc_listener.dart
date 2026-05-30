import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (_, current) => current is SignUpCodeSent || current is SignUpError,
      listener: (context, state) => switch (state) {
        SignUpCodeSent(:final email) => context.pushNamed(Routes.verifyEmail, arguments: email),
        SignUpError(:final message) => showErrorSnackbar(context, message),
        _ => null,
      },
      child: const SizedBox.shrink(),
    );
  }
}
