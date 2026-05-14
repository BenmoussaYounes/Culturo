part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  final UserInfoModel userInfo;
  final DailyChallengeModel dailyChallenge;
  final UserStatsModel stats;
  final List<CategoryModel> categories;

  HomeLoaded({required this.userInfo, required this.dailyChallenge, required this.stats, required this.categories});
}
