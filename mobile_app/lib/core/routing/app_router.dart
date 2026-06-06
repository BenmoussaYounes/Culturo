import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/forgot_password/ui/forgot_password_screen.dart';
import '../../features/signin/ui/cubit/sign_in_cubit.dart';
import '../../features/signin/ui/screens/sign_in_screen.dart';
import '../../features/signup/ui/cubit/sign_up_cubit.dart';
import '../../features/signup/ui/cubit/enter_email_otp_cubit.dart';
import '../../features/signup/ui/screens/sign_up_screen.dart';
import '../../features/signup/ui/screens/enter_email_otp_screen.dart';
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

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (_) => getIt<SignUpCubit>(), child: const SignUpScreen()),
        );

      case Routes.verifyEmail:
        final args = settings.arguments as Map<String, String>;
        final email = args['email'] ?? '';
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<EnterEmailOtpCubit>()..init(email),
            child: EnterEmailOtpScreen(email: email, password: args['password'] ?? ''),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const AppScaffold());

      case Routes.forgotPassword:
        final email = (settings.arguments as String?) ?? '';
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen(initialEmail: email));

      default:
        return null;
    }
  }
}
