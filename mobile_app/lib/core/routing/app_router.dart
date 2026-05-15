import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/signin/ui/cubit/sign_in_cubit.dart';
import '../../features/signin/ui/screens/sign_in_screen.dart';
import '../../features/app_scaffold.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (_) => getIt<OnboardingCubit>(), child: const OnboardingScreen()),
        );

      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (_) => getIt<SignInCubit>(), child: const SignInScreen()),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const AppScaffold());

      default:
        return null;
    }
  }
}
