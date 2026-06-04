import '../../domain/models/quiz_question_model.dart';

class QuizQuestionDto {
  final String quizId;
  final String questionText;
  final List<String> options;
  final String? categoryName;

  const QuizQuestionDto({required this.quizId, required this.questionText, required this.options, this.categoryName});

  factory QuizQuestionDto.fromJson(Map<String, dynamic> json) {
    final suggestedAnswer = json['suggestedAnswer'] as Map<String, dynamic>?;
    final rawOptions = suggestedAnswer?['options'] as List? ?? [];
    final category = json['category'] as Map<String, dynamic>?;

    return QuizQuestionDto(
      quizId: json['id'] as String,
      questionText: json['question'] as String,
      options: rawOptions.map((e) => e.toString()).toList(),
      categoryName: category?['name'] as String?,
    );
  }

  QuizQuestionModel toDomain() =>
      QuizQuestionModel(quizId: quizId, questionText: questionText, options: options, categoryName: categoryName);
}
