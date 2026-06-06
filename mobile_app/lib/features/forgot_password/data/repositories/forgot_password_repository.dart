import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../services/forgot_password_api_service.dart';

class ForgotPasswordRepository {
  final ForgotPasswordApiService _api;

  const ForgotPasswordRepository(this._api);

  Future<ApiResult<void>> forgotPassword(String email) async {
    try {
      await _api.forgotPassword(email);
      return const ApiSuccess(null);
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }
}
