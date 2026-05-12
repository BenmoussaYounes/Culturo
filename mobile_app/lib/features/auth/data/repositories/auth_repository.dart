import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../api/auth_api.dart';
import '../models/sigin_in_response.dart';
import '../models/sign_in_request_body.dart';

class AuthRepository {
  final AuthApi _api;

  AuthRepository(this._api);

  Future<ApiResult<void>> createAccount({required String email, required String password}) async {
    try {
      //await _api.createAccount(SignInRequestBody(email: email, password: password));
      return const ApiSuccess(null);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> forgotPassword(String email) async {
    try {
      //await _api.forgotPassword(email);
      return const ApiSuccess(null);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SiginInResponse>> signIn({required String email, required String password}) async {
    try {
      final response = await _api.signIn(SignInRequestBody(email: email, password: password));
      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}
