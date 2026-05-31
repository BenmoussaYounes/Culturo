part of 'enter_email_otp_cubit.dart';

sealed class EnterEmailOtpState {
  const EnterEmailOtpState();

  R maybeWhen<R>({
    R Function()? idle,
    R Function(int countdown)? emailOtpReady,
    R Function()? emailOtpResending,
    R Function()? emailOtpResendSuccess,
    R Function(String message)? emailOtpResendError,
    R Function()? signUpProcessing,
    R Function(String email)? signUpSuccess,
    R Function(String message)? signUpFailure,
    required R Function() orElse,
  }) {
    return switch (this) {
      EmailOtpReady(:final countdown) => emailOtpReady?.call(countdown) ?? orElse(),
      EmailOtpResending() => emailOtpResending?.call() ?? orElse(),
      EmailOtpResendSuccess() => emailOtpResendSuccess?.call() ?? orElse(),
      EmailOtpResendError(:final message) => emailOtpResendError?.call(message) ?? orElse(),
      SignUpProcessing() => signUpProcessing?.call() ?? orElse(),
      SignUpSuccess(:final email) => signUpSuccess?.call(email) ?? orElse(),
      SignUpFailure(:final message) => signUpFailure?.call(message) ?? orElse(),
    };
  }
}

final class EmailOtpReady extends EnterEmailOtpState {
  final int countdown;
  const EmailOtpReady(this.countdown);
}

final class EmailOtpResending extends EnterEmailOtpState {}

final class EmailOtpResendSuccess extends EnterEmailOtpState {}

final class EmailOtpResendError extends EnterEmailOtpState {
  final String message;
  const EmailOtpResendError(this.message);
}

final class SignUpProcessing extends EnterEmailOtpState {}

final class SignUpSuccess extends EnterEmailOtpState {
  final String email;
  const SignUpSuccess(this.email);
}

final class SignUpFailure extends EnterEmailOtpState {
  final String message;
  const SignUpFailure(this.message);
}
