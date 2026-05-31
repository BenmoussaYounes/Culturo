import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/sign_up_repository.dart';
import '../../../../core/states/action_state.dart';

class SignUpCubit extends Cubit<ActionState> {
  final SignUpRepository _repository;

  SignUpCubit(this._repository) : super(Idle());

  Future<void> sendVerificationCode({required String email, required String password}) async {
    emit(Processing());

    final result = await _repository.resendCode(email);

    result.when(success: (_) => emit(Success((email, password))), failure: (error) => emit(Failure(error.message)));
  }
}
