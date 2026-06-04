import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/models/answer_result_model.dart';
import '../../domain/models/game_session_model.dart';
import '../../domain/models/session_result_model.dart';
import '../services/quiz_api_service.dart';

class QuizRepository {
  final QuizApiService _api;

  const QuizRepository(this._api);

  Future<ApiResult<GameSessionModel>> startSession({
    required String countrySelection,
    required String difficulty,
  }) async {
    try {
      final dto = await _api.startSession(countrySelection: countrySelection, difficulty: difficulty);
      return ApiSuccess(
        GameSessionModel(
          sessionId: dto.sessionId,
          firstQuestion: dto.question.toDomain(),
          totalQuestions: dto.totalQuestions,
        ),
      );
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AnswerResultModel>> submitAnswer({
    required String sessionId,
    required String quizId,
    required String answer,
  }) async {
    try {
      final dto = await _api.submitAnswer(sessionId: sessionId, quizId: quizId, answer: answer);
      return ApiSuccess(
        AnswerResultModel(
          isCorrect: dto.isCorrect,
          correctAnswer: dto.correctAnswer,
          score: dto.score,
          nextQuestion: dto.nextQuestion?.toDomain(),
        ),
      );
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SessionResultModel>> completeSession({required String sessionId}) async {
    try {
      final dto = await _api.completeSession(sessionId: sessionId);
      return ApiSuccess(
        SessionResultModel(
          finalScore: dto.finalScore,
          earnedXp: dto.earnedXp,
          totalXp: dto.totalXp,
          level: dto.level,
          isBattleUnlocked: dto.isBattleUnlocked,
        ),
      );
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }
}
