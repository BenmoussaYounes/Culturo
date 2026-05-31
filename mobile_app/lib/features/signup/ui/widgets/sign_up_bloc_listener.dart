import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/states/action_state.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, ActionState>(
      listenWhen: (_, current) => current is Success || current is Failure,
      listener: (context, state) => state.maybeWhen(
        success: (credentialsRecord) {
          final (email, password) = credentialsRecord;
          context.pushNamed(Routes.verifyEmail, arguments: <String, String>{'email': email, 'password': password});
        },
        failure: (message) => showErrorSnackbar(context, message),
        orElse: () {},
      ),

      child: const SizedBox.shrink(),
    );
  }
}
