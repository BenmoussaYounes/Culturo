import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/signin/data/repositories/sign_in_repository.dart';
import '../../features/signin/data/service/sign_in_api.dart';
import '../../features/signin/ui/cubit/sign_in_cubit.dart';
import '../../features/categories/ui/cubit/categories_cubit.dart';
import '../../features/profile/ui/cubit/profile_cubit.dart';
import '../../features/quiz/ui/cubit/quiz_cubit.dart';
import '../../features/ranking/ui/cubit/ranking_cubit.dart';
import '../../features/home/ui/cubit/home_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerLazySingleton<SignInApi>(() => SignInApi(dio));
  getIt.registerLazySingleton<SignInRepository>(() => SignInRepository(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit());

  getIt.registerFactory<RankingCubit>(() => RankingCubit());

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  getIt.registerFactory<QuizCubit>(() => QuizCubit());
}
