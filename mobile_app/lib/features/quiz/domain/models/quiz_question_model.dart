class QuizQuestionModel {
  final String quizId;
  final String questionText;
  final List<String> options;
  final String? categoryName;

  const QuizQuestionModel({required this.quizId, required this.questionText, required this.options, this.categoryName});
}
