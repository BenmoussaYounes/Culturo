import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/forgot_password_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepository _repository;

  ForgotPasswordCubit(this._repository) : super(ForgotPasswordInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgotPasswordLoading());

    final result = await _repository.forgotPassword(email);

    result.when(
      success: (_) => emit(ForgotPasswordSuccess()),
      failure: (error) => emit(ForgotPasswordError(error.message)),
    );
  }
}
