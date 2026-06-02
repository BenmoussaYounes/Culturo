import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/models/user_profile_domain_model.dart';
import '../services/home_api_service.dart';

class HomeRepository {
  final HomeApiService _api;

  const HomeRepository(this._api);

  Future<ApiResult<UserProfileDomainModel>> getUserProfile() async {
    try {
      final result = await _api.getUserProfile();

      UserProfileDomainModel userProfile = UserProfileDomainModel.fromGetUserProfileResponseModel(result);

      return ApiSuccess(userProfile);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}
