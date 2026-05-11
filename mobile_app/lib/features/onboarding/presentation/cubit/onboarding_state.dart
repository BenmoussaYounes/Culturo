part of 'onboarding_cubit.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class NavigateToSignUpPageState extends OnboardingState {}

final class NavigateToSignInPageState extends OnboardingState {}
