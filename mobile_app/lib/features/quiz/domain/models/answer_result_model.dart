import 'quiz_question_model.dart';

class AnswerResultModel {
  final bool isCorrect;
  final String? correctAnswer;
  final int score;
  final QuizQuestionModel? nextQuestion;

  const AnswerResultModel({required this.isCorrect, this.correctAnswer, required this.score, this.nextQuestion});
}
