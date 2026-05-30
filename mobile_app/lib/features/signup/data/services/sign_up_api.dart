import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/sign_up_request_body.dart';
import '../models/verify_email_request_body.dart';

class SignUpApi {
  final Dio _dio;
  SignUpApi(this._dio);

  Future<void> signUp(SignUpRequestBody requestBody) async {
    await _dio.post(ApiConstants.signup, data: requestBody.toJson());
  }

  Future<void> verifyEmail(VerifyEmailRequestBody requestBody) async {
    await _dio.post(ApiConstants.verifyEmail, data: requestBody.toJson());
  }

  Future<void> resendCode(String email) async {
    await _dio.post(ApiConstants.resendCode, data: {'email': email});
  }
}
