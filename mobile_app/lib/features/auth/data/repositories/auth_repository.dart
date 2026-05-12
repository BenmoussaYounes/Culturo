import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_factory.dart';
import '../models/sigin_in_response.dart';
import '../models/sign_in_request_body.dart';
import '../service/auth_api.dart';

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

      DioFactory.setTokenIntoHeaderAfterLogin(response.accessToken);

      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}
