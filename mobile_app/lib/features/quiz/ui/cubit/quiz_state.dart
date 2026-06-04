part of 'quiz_cubit.dart';

sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizLoadError extends QuizState {
  final String message;

  QuizLoadError(this.message);
}

final class QuizSubmitError extends QuizState {
  final String message;

  QuizSubmitError(this.message);
}

final class QuizInProgress extends QuizState {
  final String sessionId;
  final QuizQuestionModel currentQuestion;
  final int currentIndex;
  final int totalQuestions;
  final int timerSecondsLeft;
  final int? selectedOptionIndex;
  final bool isSubmitting;
  final bool validated;
  final bool? isCorrect;
  final String? correctAnswer;
  final int score;
  final QuizQuestionModel? nextQuestion;
  final List<bool> answerRecord;
  final int totalElapsedSeconds;
  final String difficulty;

  QuizInProgress({
    required this.sessionId,
    required this.currentQuestion,
    required this.currentIndex,
    required this.totalQuestions,
    required this.timerSecondsLeft,
    required this.selectedOptionIndex,
    required this.isSubmitting,
    required this.validated,
    required this.isCorrect,
    required this.correctAnswer,
    required this.score,
    required this.nextQuestion,
    required this.answerRecord,
    required this.totalElapsedSeconds,
    required this.difficulty,
  });

  int? get correctAnswerIndex {
    if (correctAnswer == null) return null;
    final idx = currentQuestion.options.indexOf(correctAnswer!);
    return idx >= 0 ? idx : null;
  }

  bool get isLastQuestion => validated && nextQuestion == null;

  String get difficultyLabel => switch (difficulty.toLowerCase()) {
    'easy' => 'facile',
    'medium' => 'moyen',
    'hard' => 'difficile',
    _ => difficulty.toLowerCase(),
  };

  QuizInProgress copyWith({
    int? currentIndex,
    int? totalQuestions,
    int? timerSecondsLeft,
    int? selectedOptionIndex,
    bool? isSubmitting,
    bool? validated,
    bool? isCorrect,
    String? correctAnswer,
    int? score,
    QuizQuestionModel? nextQuestion,
    List<bool>? answerRecord,
    int? totalElapsedSeconds,
    bool clearSelectedOption = false,
  }) => QuizInProgress(
    sessionId: sessionId,
    currentQuestion: currentQuestion,
    currentIndex: currentIndex ?? this.currentIndex,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    timerSecondsLeft: timerSecondsLeft ?? this.timerSecondsLeft,
    selectedOptionIndex: clearSelectedOption ? null : (selectedOptionIndex ?? this.selectedOptionIndex),
    isSubmitting: isSubmitting ?? this.isSubmitting,
    validated: validated ?? this.validated,
    isCorrect: isCorrect ?? this.isCorrect,
    correctAnswer: correctAnswer ?? this.correctAnswer,
    score: score ?? this.score,
    nextQuestion: nextQuestion ?? this.nextQuestion,
    answerRecord: answerRecord ?? this.answerRecord,
    totalElapsedSeconds: totalElapsedSeconds ?? this.totalElapsedSeconds,
    difficulty: difficulty,
  );
}

final class QuizCompleted extends QuizState {
  final String dateLabel;
  final String tahaddiRef;
  final String headlineLabel;
  final int score;
  final int total;
  final int xpEarned;
  final int level;
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
    required this.xpEarned,
    required this.level,
    required this.durationLabel,
    required this.shareCardLabel,
    required this.shareUrl,
    required this.beatPercentLabel,
    required this.encouragementLabel,
    required this.answerResults,
    required this.categoryResults,
  });
}
