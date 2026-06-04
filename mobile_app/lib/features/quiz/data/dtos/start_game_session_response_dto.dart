import 'quiz_question_dto.dart';

class StartGameSessionResponseDto {
  final String sessionId;
  final int totalQuestions;
  final QuizQuestionDto question;

  const StartGameSessionResponseDto({required this.sessionId, required this.totalQuestions, required this.question});

  factory StartGameSessionResponseDto.fromJson(Map<String, dynamic> json) => StartGameSessionResponseDto(
    sessionId: json['sessionId'] as String,
    totalQuestions: json['totalQuestions'] as int,
    question: QuizQuestionDto.fromJson(json['firstQuestion'] as Map<String, dynamic>),
  );
}
