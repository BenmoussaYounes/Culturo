part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profile;

  ProfileLoaded({required this.profile});
}
