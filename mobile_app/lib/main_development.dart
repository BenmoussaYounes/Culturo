import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/auth_helpers.dart';
import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'culturo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  await checkIfLoggedInUser();

  runApp(CulturoApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? token = await AuthHelpers.getTokenFromLocalStorage();

  if (token.isNotEmpty) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
