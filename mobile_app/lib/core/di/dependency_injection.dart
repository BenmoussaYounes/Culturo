import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/categories/data/repositories/categories_repository.dart';
import '../../features/categories/data/services/categories_api_service.dart';
import '../../features/signin/data/repositories/sign_in_repository.dart';
import '../../features/signin/data/service/sign_in_api.dart';
import '../../features/signin/ui/cubit/sign_in_cubit.dart';
import '../../features/signup/data/repositories/sign_up_repository.dart';
import '../../features/signup/data/services/sign_up_api.dart';
import '../../features/signup/ui/cubit/sign_up_cubit.dart';
import '../../features/signup/ui/cubit/verify_email_cubit.dart';
import '../../features/categories/ui/cubit/categories_cubit.dart';
import '../../features/profile/ui/cubit/profile_cubit.dart';
import '../../features/quiz/ui/cubit/quiz_cubit.dart';
import '../../features/ranking/ui/cubit/ranking_cubit.dart';
import '../../features/home/ui/cubit/home_cubit.dart';
import '../../features/battle/ui/cubit/battle_cubit.dart';
import '../../features/battle/ui/cubit/battle_game_cubit.dart';
import '../../features/battle/ui/cubit/battle_matchmaking_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerLazySingleton<SignInApi>(() => SignInApi(dio));
  getIt.registerLazySingleton<SignInRepository>(() => SignInRepository(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));

  getIt.registerLazySingleton<SignUpApi>(() => SignUpApi(dio));
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<VerifyEmailCubit>(() => VerifyEmailCubit(getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerFactory<CategoriesApiService>(() => CategoriesApiService(dio));
  getIt.registerFactory<CategoriesRepository>(() => CategoriesRepository(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  getIt.registerFactory<RankingCubit>(() => RankingCubit());

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  getIt.registerFactory<QuizCubit>(() => QuizCubit());

  getIt.registerFactory<BattleCubit>(() => BattleCubit());

  getIt.registerFactory<BattleMatchmakingCubit>(() => BattleMatchmakingCubit());

  getIt.registerFactory<BattleGameCubit>(() => BattleGameCubit());
}
