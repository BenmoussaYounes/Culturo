import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/onboarding_cubit.dart';

class OnboardingBlocListner extends StatelessWidget {
  const OnboardingBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is NavigateToSignInPage) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Navigate To Sign In Page')));
        } else if (state is NavigateToSignUpPage) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Navigate To Sign Up Page')));
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
