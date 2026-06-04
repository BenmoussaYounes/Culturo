import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/models/user_profile_model.dart';
import '../services/profile_api_service.dart';

class ProfileRepository {
  final ProfileApiService _api;

  const ProfileRepository(this._api);

  Future<ApiResult<UserProfileModel>> getProfile() async {
    try {
      final dto = await _api.getProfile();
      return ApiSuccess(dto.toDomain());
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }
}
