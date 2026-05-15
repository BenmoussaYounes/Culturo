import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/quiz_category_result.dart';
import '../../domain/models/quiz_question_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  Timer? _ticker;
  static const int _timePerQuestion = 20;

  static const _questions = <QuizQuestionModel>[
    QuizQuestionModel(
      textBefore: 'Quelle est la date de ',
      textHighlight: "l'indépendance de l'Algérie",
      textAfter: ' ?',
      options: ['1 novembre 1954', '5 juillet 1962', '19 mars 1962', '1 novembre 1962'],
      correctIndex: 1,
      category: 'Histoire',
    ),
    QuizQuestionModel(
      textBefore: 'Quelle ville est surnommée ',
      textHighlight: '« la cité des ponts suspendus »',
      textAfter: ' ?',
      options: ['Tlemcen', 'Constantine', 'Alger', 'Oran'],
      correctIndex: 1,
      category: 'Histoire',
    ),
    QuizQuestionModel(
      textBefore: 'Quel est le premier président de ',
      textHighlight: "l'Algérie indépendante",
      textAfter: ' ?',
      options: ['Houari Boumédiène', 'Ahmed Ben Bella', 'Chadli Bendjedid', 'Mohamed Boudiaf'],
      correctIndex: 1,
      category: 'Histoire',
    ),
    QuizQuestionModel(
      textBefore: 'Comment dit-on ',
      textHighlight: '« merci beaucoup »',
      textAfter: ' en darja algérienne ?',
      options: ['Barak Allah fik', 'Chokran jazilan', 'Yizhak lik', 'Saħħa'],
      correctIndex: 0,
      category: 'Darja',
    ),
    QuizQuestionModel(
      textBefore: 'Que signifie ',
      textHighlight: '« mliħ bezzaf »',
      textAfter: ' en darja ?',
      options: ['Très fatigué', 'Très bien', 'Beaucoup de monde', 'Trop tard'],
      correctIndex: 1,
      category: 'Darja',
    ),
    QuizQuestionModel(
      textBefore: 'Comment dit-on ',
      textHighlight: '« tu exagères »',
      textAfter: ' en darja ?',
      options: ['Nta zaʿam', 'Nta khouya', 'Nta bezzaf', 'Nta weld bladi'],
      correctIndex: 2,
      category: 'Darja',
    ),
    QuizQuestionModel(
      textBefore: 'Quelle est la plus grande ',
      textHighlight: 'wilaya d\'Algérie',
      textAfter: ' en superficie ?',
      options: ['Adrar', 'Tamanrasset', 'Illizi', 'Tindouf'],
      correctIndex: 1,
      category: 'Géographie',
    ),
    QuizQuestionModel(
      textBefore: 'Quel fleuve traverse ',
      textHighlight: 'Constantine',
      textAfter: ' ?',
      options: ['La Soummam', 'Le Chéliff', 'Le Rhumel', 'La Seybouse'],
      correctIndex: 2,
      category: 'Géographie',
    ),
    QuizQuestionModel(
      textBefore: 'Combien de fois l\'Algérie a-t-elle remporté ',
      textHighlight: 'la CAN',
      textAfter: ' ?',
      options: ['1 fois', '2 fois', '3 fois', '4 fois'],
      correctIndex: 1,
      category: 'Football',
    ),
    QuizQuestionModel(
      textBefore: 'Dans quel club ',
      textHighlight: 'Riyad Mahrez',
      textAfter: ' a-t-il été révélé au grand public ?',
      options: ['Arsenal', 'Leicester City', 'Manchester City', 'Nice'],
      correctIndex: 1,
      category: 'Football',
    ),
  ];

  void loadQuiz() {
    emit(
      QuizInProgress(
        questions: _questions,
        currentIndex: 0,
        timerSecondsLeft: _timePerQuestion,
        selectedOptionIndex: null,
        validated: false,
        answerRecord: List.filled(_questions.length, null),
        totalElapsedSeconds: 0,
      ),
    );
    _startTicker();
  }

  void selectOption(int index) {
    final s = state;
    if (s is! QuizInProgress || s.validated) return;
    emit(s.copyWith(selectedOptionIndex: index));
  }

  void validateAnswer() {
    final s = state;
    if (s is! QuizInProgress || s.validated) return;
    _ticker?.cancel();

    final isCorrect = s.selectedOptionIndex == s.currentQuestion.correctIndex;
    final newRecord = List<bool?>.from(s.answerRecord)..[s.currentIndex] = isCorrect;

    emit(s.copyWith(validated: true, answerRecord: newRecord));
  }

  void nextQuestion() {
    final s = state;
    if (s is! QuizInProgress || !s.validated) return;

    if (s.isLastQuestion) {
      _completeQuiz(s);
    } else {
      emit(
        s.copyWith(
          currentIndex: s.currentIndex + 1,
          timerSecondsLeft: _timePerQuestion,
          validated: false,
          clearSelectedOption: true,
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
    if (s is! QuizInProgress || s.validated) return;

    final newTimer = s.timerSecondsLeft - 1;
    final newElapsed = s.totalElapsedSeconds + 1;

    if (newTimer <= 0) {
      _ticker?.cancel();
      final newRecord = List<bool?>.from(s.answerRecord)..[s.currentIndex] = false;
      emit(s.copyWith(timerSecondsLeft: 0, totalElapsedSeconds: newElapsed, validated: true, answerRecord: newRecord));
    } else {
      emit(s.copyWith(timerSecondsLeft: newTimer, totalElapsedSeconds: newElapsed));
    }
  }

  void _completeQuiz(QuizInProgress s) {
    final answers = s.answerRecord.map((r) => r ?? false).toList();
    final score = answers.where((a) => a).length;
    final total = s.questions.length;
    final elapsed = s.totalElapsedSeconds;
    final mm = (elapsed ~/ 60).toString().padLeft(2, '0');
    final ss = (elapsed % 60).toString().padLeft(2, '0');

    final categoryMap = <String, ({int correct, int total})>{};
    for (int i = 0; i < s.questions.length; i++) {
      final cat = s.questions[i].category;
      final prev = categoryMap[cat] ?? (correct: 0, total: 0);
      categoryMap[cat] = (correct: prev.correct + (answers[i] ? 1 : 0), total: prev.total + 1);
    }
    final categoryResults = categoryMap.entries
        .map((e) => QuizCategoryResult(name: e.key, correct: e.value.correct, total: e.value.total))
        .toList();

    final ratio = score / total;
    final (headline, encouragement) = switch (ratio) {
      >= 0.8 => ('SĦIĦ YA KHOUYA — BIEN JOUÉ 🔥', 'Sħiħ bezzaf.'),
      >= 0.6 => ('SAHIT YA KHOUYA — BIEN JOUÉ', 'Mliħ bezzaf.'),
      >= 0.4 => ('MABROUK — BIEN ESSAYÉ', 'Continue comme ça.'),
      _ => ('MAKLACH YA KHOUYA — BONNE CHANCE', 'La prochaine fois !'),
    };
    final beatPercent = (ratio * 85 + 10).round().clamp(5, 99);

    emit(
      QuizCompleted(
        dateLabel: '28 AVRIL 2026 · #042',
        tahaddiRef: 'Tahaddi #042',
        headlineLabel: headline,
        score: score,
        total: total,
        durationLabel: '$mm:$ss',
        shareCardLabel: '$score/$total · $mm:$ss',
        shareUrl: 'TAHADDI.DZ/042',
        beatPercentLabel: 'Tu bats $beatPercent% des Algérois aujourd\'hui.',
        encouragementLabel: encouragement,
        answerResults: answers,
        categoryResults: categoryResults,
      ),
    );
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
