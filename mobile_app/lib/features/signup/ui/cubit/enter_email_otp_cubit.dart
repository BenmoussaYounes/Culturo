import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_request_body.dart';
import '../../data/repositories/sign_up_repository.dart';

part 'enter_email_otp_state.dart';

class EnterEmailOtpCubit extends Cubit<EnterEmailOtpState> {
  final SignUpRepository _repository;
  Timer? _resendTimer;
  String _email = '';
  int _countdown = _resendCooldown;

  static const int _resendCooldown = 42;

  EnterEmailOtpCubit(this._repository) : super(const EmailOtpReady(_resendCooldown));

  void init(String email) {
    _email = email;
    _startResendTimer();
  }

  Future<void> resendCode() async {
    _resendTimer?.cancel();
    emit(EmailOtpResending());
    final result = await _repository.resendCode(_email);
    result.when(
      success: (_) {
        emit(EmailOtpResendSuccess());
        _countdown = _resendCooldown;
        emit(const EmailOtpReady(_resendCooldown));
        _startResendTimer();
      },
      failure: (error) {
        emit(EmailOtpResendError(error.message));
        emit(EmailOtpReady(_countdown));
      },
    );
  }

  Future<void> signUp({required String email, required String password, required String code}) async {
    emit(SignUpProcessing());
    final result = await _repository.signUp(SignUpRequestBody(email: email, password: password, code: code));
    result.when(success: (_) => emit(SignUpSuccess(email)), failure: (error) => emit(SignUpFailure(error.message)));
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      _countdown--;
      emit(EmailOtpReady(_countdown));
      if (_countdown <= 0) timer.cancel();
    });
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}
