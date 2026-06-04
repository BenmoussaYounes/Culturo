import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/quiz_repository.dart';
import '../../domain/models/answer_result_model.dart';
import '../../domain/models/game_session_model.dart';
import '../../domain/models/quiz_category_result.dart';
import '../../domain/models/quiz_question_model.dart';
import '../../domain/models/session_result_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRepository _repository;

  QuizCubit(this._repository) : super(QuizInitial());

  Timer? _ticker;
  static const int _timePerQuestion = 20;

  Future<void> loadQuiz({String countrySelection = 'all', String difficulty = 'Easy'}) async {
    emit(QuizInitial());

    final result = await _repository.startSession(countrySelection: countrySelection, difficulty: difficulty);

    result.when(
      success: (GameSessionModel session) {
        emit(
          QuizInProgress(
            sessionId: session.sessionId,
            currentQuestion: session.firstQuestion,
            currentIndex: 0,
            totalQuestions: session.totalQuestions,
            timerSecondsLeft: _timePerQuestion,
            selectedOptionIndex: null,
            isSubmitting: false,
            validated: false,
            isCorrect: null,
            correctAnswer: null,
            score: 0,
            nextQuestion: null,
            answerRecord: const [],
            totalElapsedSeconds: 0,
            difficulty: difficulty,
          ),
        );
        _startTicker();
      },
      failure: (error) => emit(QuizLoadError(error.message)),
    );
  }

  void selectOption(int index) {
    final s = state;
    if (s is! QuizInProgress || s.validated || s.isSubmitting) return;
    emit(s.copyWith(selectedOptionIndex: index));
  }

  Future<void> validateAnswer() async {
    final s = state;
    if (s is! QuizInProgress || s.validated || s.isSubmitting) return;
    _ticker?.cancel();

    final answer = s.selectedOptionIndex != null ? s.currentQuestion.options[s.selectedOptionIndex!] : '';

    emit(s.copyWith(isSubmitting: true));
    await _submitAnswer(answer);
  }

  Future<void> nextQuestion() async {
    final s = state;
    if (s is! QuizInProgress || !s.validated || s.isSubmitting) return;

    if (s.nextQuestion == null) {
      emit(s.copyWith(isSubmitting: true));
      final result = await _repository.completeSession(sessionId: s.sessionId);
      if (isClosed) return;
      result.when(
        success: (SessionResultModel data) => _buildCompletedState(s, data),
        failure: (error) {
          emit(QuizSubmitError(error.message));
          emit(s.copyWith(isSubmitting: false));
        },
      );
    } else {
      emit(
        QuizInProgress(
          sessionId: s.sessionId,
          currentQuestion: s.nextQuestion!,
          currentIndex: s.currentIndex + 1,
          totalQuestions: s.totalQuestions,
          timerSecondsLeft: _timePerQuestion,
          selectedOptionIndex: null,
          isSubmitting: false,
          validated: false,
          isCorrect: null,
          correctAnswer: null,
          score: s.score,
          nextQuestion: null,
          answerRecord: s.answerRecord,
          totalElapsedSeconds: s.totalElapsedSeconds,
          difficulty: s.difficulty,
        ),
      );
      _startTicker();
    }
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    final s = state;
    if (s is! QuizInProgress || s.validated || s.isSubmitting) return;

    final newTimer = s.timerSecondsLeft - 1;
    final newElapsed = s.totalElapsedSeconds + 1;

    if (newTimer <= 0) {
      _ticker?.cancel();
      emit(s.copyWith(timerSecondsLeft: 0, totalElapsedSeconds: newElapsed, isSubmitting: true));
      _submitAnswer('');
    } else {
      emit(s.copyWith(timerSecondsLeft: newTimer, totalElapsedSeconds: newElapsed));
    }
  }

  Future<void> _submitAnswer(String answer) async {
    final s = state;
    if (s is! QuizInProgress) return;

    final result = await _repository.submitAnswer(
      sessionId: s.sessionId,
      quizId: s.currentQuestion.quizId,
      answer: answer,
    );

    if (isClosed) return;

    result.when(
      success: (AnswerResultModel data) {
        // API doesn't always return correctAnswer — derive it from the selection when correct
        final resolvedCorrectAnswer =
            data.correctAnswer ??
            (data.isCorrect && s.selectedOptionIndex != null
                ? s.currentQuestion.options[s.selectedOptionIndex!]
                : null);

        emit(
          s.copyWith(
            isSubmitting: false,
            validated: true,
            isCorrect: data.isCorrect,
            correctAnswer: resolvedCorrectAnswer,
            score: data.score,
            nextQuestion: data.nextQuestion,
            answerRecord: [...s.answerRecord, data.isCorrect],
          ),
        );
      },
      failure: (error) {
        final restored = s.copyWith(isSubmitting: false);
        emit(QuizSubmitError(error.message));
        emit(restored);
      },
    );
  }

  void _buildCompletedState(QuizInProgress s, SessionResultModel data) {
    final elapsed = s.totalElapsedSeconds;
    final mm = (elapsed ~/ 60).toString().padLeft(2, '0');
    final ss = (elapsed % 60).toString().padLeft(2, '0');

    // correctAnswers and totalQuestions come from local tracking
    final correctAnswers = s.answerRecord.where((a) => a).length;
    final totalQuestions = s.answerRecord.length;

    const months = [
      'JANVIER',
      'FÉVRIER',
      'MARS',
      'AVRIL',
      'MAI',
      'JUIN',
      'JUILLET',
      'AOÛT',
      'SEPTEMBRE',
      'OCTOBRE',
      'NOVEMBRE',
      'DÉCEMBRE',
    ];
    final now = DateTime.now();
    final dateLabel = '${now.day} ${months[now.month - 1]} ${now.year}';

    final ratio = totalQuestions > 0 ? correctAnswers / totalQuestions : 0.0;
    final (headline, encouragement) = switch (ratio) {
      >= 0.8 => ('SĦIĦ YA KHOUYA — BIEN JOUÉ 🔥', 'Sħiħ bezzaf.'),
      >= 0.6 => ('SAHIT YA KHOUYA — BIEN JOUÉ', 'Mliħ bezzaf.'),
      >= 0.4 => ('MABROUK — BIEN ESSAYÉ', 'Continue comme ça.'),
      _ => ('MAKLACH YA KHOUYA — BONNE CHANCE', 'La prochaine fois !'),
    };
    final beatPercent = (ratio * 85 + 10).round().clamp(5, 99);

    emit(
      QuizCompleted(
        dateLabel: dateLabel,
        tahaddiRef: 'Culturo Quiz',
        headlineLabel: headline,
        score: correctAnswers,
        total: totalQuestions,
        xpEarned: data.earnedXp,
        level: data.level,
        durationLabel: '$mm:$ss',
        shareCardLabel: '$correctAnswers/$totalQuestions · $mm:$ss',
        shareUrl: 'CULTURO.DZ',
        beatPercentLabel: "Tu bats $beatPercent% des joueurs aujourd'hui.",
        encouragementLabel: encouragement,
        answerResults: s.answerRecord,
        categoryResults: const [],
      ),
    );
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
