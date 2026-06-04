import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/instrument_serif_font_style.dart';
import '../../../core/theming/inter_font_style.dart';
import '../../../core/theming/jet_brains_mono_font_style.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/quiz_cubit.dart';
import 'widgets/widgets.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuizCubit>()..loadQuiz(),
      child: const QuizBlocListener(child: _QuizContent()),
    );
  }
}

class _QuizContent extends StatelessWidget {
  const _QuizContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<QuizCubit, QuizState>(
        buildWhen: (_, curr) => curr is! QuizSubmitError,
        builder: (context, state) => switch (state) {
          QuizInitial() => const AppCircularProgressIndicator(),
          QuizLoadError(:final message) => _QuizErrorView(
            message: message,
            onRetry: () => context.read<QuizCubit>().loadQuiz(),
          ),
          QuizCompleted() => const AppCircularProgressIndicator(),
          QuizSubmitError() => const AppCircularProgressIndicator(),
          QuizInProgress() => SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  QuizProgressHeader(state: state),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      _CategoryTag(
                        label: state.currentQuestion.categoryName != null
                            ? '${state.currentQuestion.categoryName} · ${state.difficultyLabel}'
                            : state.difficultyLabel,
                      ),
                      _TimerCircle(secondsLeft: state.timerSecondsLeft),
                    ],
                  ),
                  verticalSpace(26),
                  Text(
                    'QUESTION ${(state.currentIndex + 1).toString().padLeft(2, '0')}',
                    style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.5),
                  ),
                  verticalSpace(6),
                  _QuestionText(questionText: state.currentQuestion.questionText),
                  verticalSpace(24),
                  for (int i = 0; i < state.currentQuestion.options.length; i++) ...[
                    QuizAnswerOption(
                      index: i,
                      text: state.currentQuestion.options[i],
                      selectedOptionIndex: state.selectedOptionIndex,
                      validated: state.validated,
                      correctIndex: state.correctAnswerIndex,
                      onTap: () => context.read<QuizCubit>().selectOption(i),
                    ),
                    if (i < state.currentQuestion.options.length - 1) verticalSpace(10),
                  ],
                  const Spacer(),
                  _ActionButton(state: state),
                  verticalSpace(8),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}

class _QuestionText extends StatelessWidget {
  final String questionText;

  const _QuestionText({required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Text(questionText, style: InstrumentSerifFontStyle.font26W400ItalicInk.copyWith(height: 1.25));
  }
}

class _CategoryTag extends StatelessWidget {
  final String label;

  const _CategoryTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(color: const Color(0xFFd9e7de), borderRadius: BorderRadius.circular(16.r)),
      child: Text(label, style: InterFontStyle.font11W600PrimaryGreen),
    );
  }
}

class _TimerCircle extends StatelessWidget {
  final int secondsLeft;

  const _TimerCircle({required this.secondsLeft});

  @override
  Widget build(BuildContext context) {
    final isUrgent = secondsLeft <= 5;
    return SizedBox(
      width: 38.w,
      height: 38.w,
      child: Stack(
        alignment: .center,
        children: [
          CircularProgressIndicator(
            value: secondsLeft / 20,
            strokeWidth: 3,
            backgroundColor: ColorsManager.beige,
            valueColor: AlwaysStoppedAnimation(isUrgent ? DesertColors.accent : DesertColors.primary),
          ),
          Text(
            '$secondsLeft',
            style: JetBrainsMonoFontStyle.font12W600Ink.copyWith(
              color: isUrgent ? DesertColors.accent : ColorsManager.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final QuizInProgress state;

  const _ActionButton({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();

    if (!state.validated) {
      return SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: (!state.isSubmitting && state.selectedOptionIndex != null) ? cubit.validateAnswer : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: DesertColors.ink,
            disabledBackgroundColor: ColorsManager.mediumGrey.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
          child: state.isSubmitting
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : Text('Valider la réponse', style: InterFontStyle.font16W600White),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: state.isSubmitting ? null : cubit.nextQuestion,
        style: ElevatedButton.styleFrom(
          backgroundColor: DesertColors.primary,
          disabledBackgroundColor: ColorsManager.mediumGrey.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: state.isSubmitting
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Text(
                state.isLastQuestion ? 'Voir les résultats →' : 'Question suivante →',
                style: InterFontStyle.font16W600White,
              ),
      ),
    );
  }
}

class _QuizErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _QuizErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(message, style: InterFontStyle.font14W500Ink, textAlign: .center),
              verticalSpace(20),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesertColors.ink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Text('Réessayer', style: InterFontStyle.font16W600White),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
