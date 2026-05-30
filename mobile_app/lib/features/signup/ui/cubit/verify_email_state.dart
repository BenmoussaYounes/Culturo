part of 'verify_email_cubit.dart';

sealed class VerifyEmailState {
  const VerifyEmailState();
}

final class VerifyEmailReady extends VerifyEmailState {
  final int countdown;
  const VerifyEmailReady(this.countdown);
}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailSuccess extends VerifyEmailState {}

final class VerifyEmailError extends VerifyEmailState {
  final String message;
  const VerifyEmailError(this.message);
}

final class VerifyEmailResending extends VerifyEmailState {}

final class VerifyEmailResendSuccess extends VerifyEmailState {}

final class VerifyEmailResendError extends VerifyEmailState {
  final String message;
  const VerifyEmailResendError(this.message);
}
