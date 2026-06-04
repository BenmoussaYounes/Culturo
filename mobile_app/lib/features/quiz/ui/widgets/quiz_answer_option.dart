import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class QuizAnswerOption extends StatelessWidget {
  final int index;
  final String text;
  final int? selectedOptionIndex;
  final bool validated;
  final int? correctIndex;
  final VoidCallback onTap;

  const QuizAnswerOption({
    super.key,
    required this.index,
    required this.text,
    required this.selectedOptionIndex,
    required this.validated,
    required this.correctIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedOptionIndex == index;
    final isCorrect = correctIndex != null && index == correctIndex;

    final (cardColor, borderColor, labelBg, labelTextColor, textColor, trailing) = _resolveStyle(
      isSelected: isSelected,
      isCorrect: isCorrect,
    );

    return GestureDetector(
      onTap: validated ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 34.w,
              height: 34.h,
              decoration: BoxDecoration(color: labelBg, borderRadius: BorderRadius.circular(8.r)),
              alignment: .center,
              child: Text(
                ['A', 'B', 'C', 'D'][index],
                style: InstrumentSerifFontStyle.font14W600InkItalic.copyWith(color: labelTextColor),
              ),
            ),
            horizontalSpace(12),
            Text(text, style: InterFontStyle.font14W600Ink.copyWith(color: textColor)),
            Spacer(),
            ?trailing,
          ],
        ),
      ),
    );
  }

  (Color, Color, Color, Color, Color, Widget?) _resolveStyle({required bool isSelected, required bool isCorrect}) {
    if (!validated) {
      if (isSelected) {
        return (
          DesertColors.primary,
          DesertColors.primary,
          const Color(0xFFFFFFFF).withValues(alpha: 0.2),
          const Color(0xFFFFFFFF),
          const Color(0xFFFFFFFF),
          Icon(Icons.check, color: const Color(0xFFFFFFFF), size: 18.sp),
        );
      }
      return (
        DesertColors.surface,
        ColorsManager.beige,
        ColorsManager.vanilla,
        ColorsManager.mediumGrey,
        DesertColors.ink,
        null,
      );
    }

    if (isCorrect) {
      return (
        SemanticColors.success.withValues(alpha: 0.1),
        SemanticColors.success,
        SemanticColors.success,
        const Color(0xFFFFFFFF),
        SemanticColors.success,
        Icon(Icons.check_circle_outline, color: SemanticColors.success, size: 18.sp),
      );
    }
    if (isSelected) {
      return (
        SemanticColors.danger.withValues(alpha: 0.08),
        SemanticColors.danger,
        SemanticColors.danger,
        const Color(0xFFFFFFFF),
        SemanticColors.danger,
        Icon(Icons.cancel_outlined, color: SemanticColors.danger, size: 18.sp),
      );
    }
    return (
      DesertColors.surface,
      ColorsManager.beige,
      ColorsManager.vanilla,
      ColorsManager.lightGrey,
      ColorsManager.ink,
      null,
    );
  }
}
