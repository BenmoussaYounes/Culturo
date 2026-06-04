import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/models/leaderboard_player_model.dart';
import '../services/ranking_api_service.dart';

class RankingRepository {
  final RankingApiService _api;

  const RankingRepository(this._api);

  Future<ApiResult<List<LeaderboardPlayerModel>>> getLeaderboard() async {
    try {
      final dto = await _api.getLeaderboard();
      return ApiSuccess(dto.topByXP.map((e) => e.toDomain()).toList());
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }
}
