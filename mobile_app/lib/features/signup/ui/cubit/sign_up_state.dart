part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpCodeSent extends SignUpState {
  final String email;
  SignUpCodeSent(this.email);
}

final class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}
