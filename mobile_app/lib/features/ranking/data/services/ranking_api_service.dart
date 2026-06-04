import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../dtos/leaderboard_response_dto.dart';

class RankingApiService {
  final Dio _dio;

  const RankingApiService(this._dio);

  Future<LeaderboardResponseDto> getLeaderboard() async {
    final response = await _dio.get(ApiConstants.leaderboard);
    return LeaderboardResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}
