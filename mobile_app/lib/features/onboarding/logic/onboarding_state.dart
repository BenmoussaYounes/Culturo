part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;

  const factory OnboardingState.navigateToSignInPage() = NavigateToSignInPage;
  const factory OnboardingState.navigateToSignUpPage() = NavigateToSignUpPage;
}
