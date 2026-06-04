import 'quiz_question_model.dart';

class GameSessionModel {
  final String sessionId;
  final QuizQuestionModel firstQuestion;
  final int totalQuestions;

  const GameSessionModel({required this.sessionId, required this.firstQuestion, required this.totalQuestions});
}
