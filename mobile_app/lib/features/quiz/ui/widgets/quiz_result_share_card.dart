import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../cubit/quiz_cubit.dart';

class QuizResultShareCard extends StatelessWidget {
  final QuizCompleted result;

  const QuizResultShareCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: DesertColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: DesertColors.primarySoft),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.grid_3x3_rounded, size: 14.sp, color: DesertColors.primary),
                  horizontalSpace(6),
                  Text(result.tahaddiRef, style: InterFontStyle.font13W600Ink),
                ],
              ),
              Text(result.shareCardLabel, style: JetBrainsMonoFontStyle.font12W600Ink),
            ],
          ),
          verticalSpace(12),
          Wrap(
            spacing: 3.w,
            runSpacing: 3.h,
            children: result.answerResults.map((correct) => _AnswerIndicator(correct: correct)).toList(),
          ),
          verticalSpace(12),
          Text(result.shareUrl, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ],
      ),
    );
  }
}

class _AnswerIndicator extends StatelessWidget {
  final bool correct;

  const _AnswerIndicator({required this.correct});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: correct ? SemanticColors.success : SemanticColors.danger,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Icon(correct ? Icons.check : Icons.close, color: const Color(0xFFFFFFFF), size: 14.sp),
    );
  }
}
