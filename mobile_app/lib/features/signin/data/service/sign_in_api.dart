import 'package:culturo/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

import '../models/sigin_in_response.dart';
import '../models/sign_in_request_body.dart';

class SignInApi {
  final Dio _dio;
  SignInApi(this._dio);

  Future<SiginInResponse> signIn(SignInRequestBody requestBody) async {
    Response response = await _dio.post(ApiConstants.siginIn, data: requestBody.toJson());
    return SiginInResponse.fromJson(response.data);
  }
}
