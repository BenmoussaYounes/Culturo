import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/get_user_profile_reponse_model.dart';

class HomeApiService {
  final Dio _dio;

  const HomeApiService(this._dio);

  Future<GetUserProfileResponseModel> getUserProfile() async {
    final response = await _dio.get(ApiConstants.usersGetMe);

    return GetUserProfileResponseModel.fromJson(response.data);
  }
}
