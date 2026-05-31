import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/sign_up_request_body.dart';
import '../services/sign_up_api_service.dart';

class SignUpRepository {
  final SignUpApiService _api;

  SignUpRepository(this._api);

  Future<ApiResult<void>> signUp(SignUpRequestBody body) async {
    try {
      await _api.signUp(body);
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
