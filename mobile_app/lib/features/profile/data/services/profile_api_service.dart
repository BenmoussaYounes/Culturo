import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../dtos/user_profile_dto.dart';

class ProfileApiService {
  final Dio _dio;

  const ProfileApiService(this._dio);

  Future<UserProfileDto> getProfile() async {
    final response = await _dio.get(ApiConstants.usersGetMe);
    return UserProfileDto.fromJson(response.data as Map<String, dynamic>);
  }
}
