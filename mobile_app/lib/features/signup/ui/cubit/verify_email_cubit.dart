import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/sign_up_repository.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final SignUpRepository _repository;
  Timer? _resendTimer;
  String _email = '';
  int _countdown = _resendCooldown;

  static const int _resendCooldown = 42;

  VerifyEmailCubit(this._repository) : super(const VerifyEmailReady(_resendCooldown));

  void init(String email) {
    _email = email;
    _startResendTimer();
  }

  Future<void> verify({required String code}) async {
    _resendTimer?.cancel();
    emit(VerifyEmailLoading());
    final result = await _repository.verifyEmail(email: _email, code: code);
    result.when(
      success: (_) => emit(VerifyEmailSuccess()),
      failure: (error) {
        emit(VerifyEmailError(error.message));
        if (_countdown > 0) _startResendTimer();
        emit(VerifyEmailReady(_countdown));
      },
    );
  }

  Future<void> resendCode() async {
    _resendTimer?.cancel();
    emit(VerifyEmailResending());
    final result = await _repository.resendCode(_email);
    result.when(
      success: (_) {
        emit(VerifyEmailResendSuccess());
        _countdown = _resendCooldown;
        emit(const VerifyEmailReady(_resendCooldown));
        _startResendTimer();
      },
      failure: (error) {
        emit(VerifyEmailResendError(error.message));
        emit(VerifyEmailReady(_countdown));
      },
    );
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      _countdown--;
      emit(VerifyEmailReady(_countdown));
      if (_countdown <= 0) timer.cancel();
    });
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}
