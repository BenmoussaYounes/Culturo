import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/api/auth_api.dart';
import '../../features/auth/ui/cubit/sign_in_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerLazySingleton<AuthApi>(() => AuthApi());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));
}
