import '../../../../core/helpers/auth_helpers.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_factory.dart';
import '../models/sigin_in_response.dart';
import '../models/sign_in_request_body.dart';
import '../service/sign_in_api.dart';

class SignInRepository {
  final SignInApi _api;

  SignInRepository(this._api);

  Future<ApiResult<SiginInResponse>> signIn({required String email, required String password}) async {
    try {
      final response = await _api.signIn(SignInRequestBody(email: email, password: password));

      saveAndSetTokenIntoDioAuthHeader(response.accessToken);

      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}

void saveAndSetTokenIntoDioAuthHeader(String token) {
  DioFactory.setTokenIntoHeaderAfterLogin(token);

  AuthHelpers.saveTokenToLocalStorage(token);
}
