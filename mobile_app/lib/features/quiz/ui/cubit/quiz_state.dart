part of 'quiz_cubit.dart';

sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizInProgress extends QuizState {
  final List<QuizQuestionModel> questions;
  final int currentIndex;
  final int timerSecondsLeft;
  final int? selectedOptionIndex;
  final bool validated;
  final List<bool?> answerRecord;
  final int totalElapsedSeconds;

  QuizInProgress({
    required this.questions,
    required this.currentIndex,
    required this.timerSecondsLeft,
    required this.selectedOptionIndex,
    required this.validated,
    required this.answerRecord,
    required this.totalElapsedSeconds,
  });

  QuizQuestionModel get currentQuestion => questions[currentIndex];
  int get totalQuestions => questions.length;
  bool get isLastQuestion => currentIndex >= questions.length - 1;

  QuizInProgress copyWith({
    int? currentIndex,
    int? timerSecondsLeft,
    int? selectedOptionIndex,
    bool? validated,
    List<bool?>? answerRecord,
    int? totalElapsedSeconds,
    bool clearSelectedOption = false,
  }) {
    return QuizInProgress(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      timerSecondsLeft: timerSecondsLeft ?? this.timerSecondsLeft,
      selectedOptionIndex: clearSelectedOption ? null : (selectedOptionIndex ?? this.selectedOptionIndex),
      validated: validated ?? this.validated,
      answerRecord: answerRecord ?? this.answerRecord,
      totalElapsedSeconds: totalElapsedSeconds ?? this.totalElapsedSeconds,
    );
  }
}

final class QuizCompleted extends QuizState {
  final String dateLabel;
  final String tahaddiRef;
  final String headlineLabel;
  final int score;
  final int total;
  final String durationLabel;
  final String shareCardLabel;
  final String shareUrl;
  final String beatPercentLabel;
  final String encouragementLabel;
  final List<bool> answerResults;
  final List<QuizCategoryResult> categoryResults;

  QuizCompleted({
    required this.dateLabel,
    required this.tahaddiRef,
    required this.headlineLabel,
    required this.score,
    required this.total,
    required this.durationLabel,
    required this.shareCardLabel,
    required this.shareUrl,
    required this.beatPercentLabel,
    required this.encouragementLabel,
    required this.answerResults,
    required this.categoryResults,
  });
}
