import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/onboarding/logic/onboarding_cubit.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => OnboardingCubit(), child: const OnboardingScreen()),
        );

      default:
        return null;
    }
  }
}
