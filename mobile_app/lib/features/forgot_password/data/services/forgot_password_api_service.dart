import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';

class ForgotPasswordApiService {
  final Dio _dio;

  const ForgotPasswordApiService(this._dio);

  Future<void> forgotPassword(String email) async {
    await _dio.post(ApiConstants.forgotPassword, data: {'email': email});
  }
}
