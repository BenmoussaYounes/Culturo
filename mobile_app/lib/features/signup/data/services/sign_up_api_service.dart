import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/sign_up_request_body.dart';

class SignUpApiService {
  final Dio _dio;
  SignUpApiService(this._dio);

  Future<void> signUp(SignUpRequestBody requestBody) async {
    await _dio.post(ApiConstants.signup, data: requestBody.toJson());
  }

  Future<void> resendCode(String email) async {
    await _dio.post(ApiConstants.signUpOtp, data: {'email': email});
  }
}
