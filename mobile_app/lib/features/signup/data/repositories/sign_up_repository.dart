import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/sign_up_request_body.dart';
import '../models/verify_email_request_body.dart';
import '../services/sign_up_api.dart';

class SignUpRepository {
  final SignUpApi _api;

  SignUpRepository(this._api);

  Future<ApiResult<void>> signUp({required String email, required String password}) async {
    try {
      await _api.signUp(SignUpRequestBody(email: email, password: password));
      return const ApiSuccess(null);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> verifyEmail({required String email, required String code}) async {
    try {
      await _api.verifyEmail(VerifyEmailRequestBody(email: email, code: code));
      return const ApiSuccess(null);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> resendCode(String email) async {
    try {
      await _api.resendCode(email);
      return const ApiSuccess(null);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}
