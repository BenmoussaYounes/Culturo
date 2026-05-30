import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/sign_up_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _repository;

  SignUpCubit(this._repository) : super(SignUpInitial());

  Future<void> sendVerificationCode({required String email, required String password}) async {
    emit(SignUpLoading());
    final result = await _repository.signUp(email: email, password: password);
    emit(SignUpCodeSent('test@example.com'));

    result.when(success: (_) => emit(SignUpCodeSent(email)), failure: (error) => emit(SignUpError(error.message)));
  }
}
