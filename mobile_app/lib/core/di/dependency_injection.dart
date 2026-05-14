import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/service/auth_api.dart';
import '../../features/auth/ui/cubit/sign_in_cubit.dart';
import '../../features/categories/ui/cubit/categories_cubit.dart';
import '../../features/home/ui/cubit/home_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerLazySingleton<AuthApi>(() => AuthApi(dio));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit());
}
