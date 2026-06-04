import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../dtos/complete_session_response_dto.dart';
import '../dtos/start_game_session_response_dto.dart';
import '../dtos/submit_answer_response_dto.dart';

class QuizApiService {
  final Dio _dio;

  const QuizApiService(this._dio);

  Future<StartGameSessionResponseDto> startSession({
    required String countrySelection,
    required String difficulty,
  }) async {
    final response = await _dio.post(
      ApiConstants.gameSessionStart,
      data: {'countrySelection': countrySelection, 'difficulty': difficulty},
    );
    return StartGameSessionResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SubmitAnswerResponseDto> submitAnswer({
    required String sessionId,
    required String quizId,
    required String answer,
  }) async {
    final response = await _dio.post(
      ApiConstants.gameSessionAnswer,
      data: {'sessionId': sessionId, 'quizId': quizId, 'answer': answer},
    );
    return SubmitAnswerResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<CompleteSessionResponseDto> completeSession({required String sessionId}) async {
    final response = await _dio.post(ApiConstants.gameSessionComplete, data: {'sessionId': sessionId});
    return CompleteSessionResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}
