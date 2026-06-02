part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  final UserInfoDomainModel userInfo;
  final DailyChallengeDomainModel dailyChallenge;
  final UserStatsDomainModel stats;
  final List<CategoryDomainModel> categories;

  HomeLoaded({required this.userInfo, required this.dailyChallenge, required this.stats, required this.categories});
}
