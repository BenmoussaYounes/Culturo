import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;

  SignInCubit(this._authRepository) : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final result = await _authRepository.signIn(email: email, password: password);
    result.when(success: (_) => emit(CreateAccountState(email)), failure: (error) => emit(SignInError(error.message)));
  }

  void forgotPassword(String email) => emit(ForgotPasswordState(email));

  void createAccount(String email) => emit(CreateAccountState(email));
}
