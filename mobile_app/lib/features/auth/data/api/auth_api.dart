import '../models/sigin_in_response.dart';
import '../models/sign_in_request_body.dart';

class AuthApi {
  Future<SiginInResponse> signIn(SignInRequestBody requestBody) async {
    await Future.delayed(const Duration(seconds: 1));
    // FromJson would be used here in a real implementation
    return SiginInResponse(accessToken: "sample_access_token");
  }
}
