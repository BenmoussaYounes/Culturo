import 'quiz_question_dto.dart';

class SubmitAnswerResponseDto {
  final bool isCorrect;
  final String? correctAnswer;
  final int score;
  final QuizQuestionDto? nextQuestion;

  const SubmitAnswerResponseDto({required this.isCorrect, this.correctAnswer, required this.score, this.nextQuestion});

  factory SubmitAnswerResponseDto.fromJson(Map<String, dynamic> json) => SubmitAnswerResponseDto(
    isCorrect: json['isCorrect'] as bool,
    correctAnswer: json['correctAnswer']?.toString(),
    score: (json['score'] as int?) ?? 0,
    nextQuestion: json['nextQuestion'] != null
        ? QuizQuestionDto.fromJson(json['nextQuestion'] as Map<String, dynamic>)
        : null,
  );
}
