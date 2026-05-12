part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInError extends SignInState {
  final String message;
  SignInError(this.message);
}

final class ForgotPasswordState extends SignInState {
  final String email;
  ForgotPasswordState(this.email);
}

final class CreateAccountState extends SignInState {
  final String email;
  CreateAccountState(this.email);
}
