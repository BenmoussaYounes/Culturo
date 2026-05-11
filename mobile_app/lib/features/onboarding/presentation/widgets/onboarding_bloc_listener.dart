import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/onboarding_cubit.dart';

class OnboardingBlocListener extends StatelessWidget {
  const OnboardingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (_, current) => current is NavigateToSignUpPageState || current is NavigateToSignInPageState,
      listener: (context, state) => switch (state) {
        OnboardingInitial() => null,
        NavigateToSignUpPageState() => Navigator.pushNamed(context, '/sign-up'),
        NavigateToSignInPageState() => Navigator.pushNamed(context, '/sign-in'),
      },
      child: SizedBox.shrink(),
    );
  }
}
