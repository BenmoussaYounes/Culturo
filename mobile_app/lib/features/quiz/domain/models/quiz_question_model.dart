class QuizQuestionModel {
  final String textBefore;
  final String? textHighlight;
  final String textAfter;
  final List<String> options;
  final int correctIndex;
  final String category;

  const QuizQuestionModel({
    required this.textBefore,
    this.textHighlight,
    this.textAfter = '',
    required this.options,
    required this.correctIndex,
    required this.category,
  });
}
