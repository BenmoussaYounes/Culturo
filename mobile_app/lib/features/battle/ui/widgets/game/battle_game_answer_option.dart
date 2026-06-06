import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../../core/theming/inter_font_style.dart';
import '../../../domain/models/battle_game_models.dart';

class BattleGameAnswerOption extends StatelessWidget {
  final BattleAnswerModel answer;
  final VoidCallback? onTap;

  const BattleGameAnswerOption({super.key, required this.answer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final (cardColor, borderColor, labelBg, labelTextColor, textColor, trailing) = _resolveStyle(answer.state);

    return GestureDetector(
      onTap: answer.state == BattleAnswerState.unanswered ? onTap : null,
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
                answer.letter,
                style: InstrumentSerifFontStyle.font14W600InkItalic.copyWith(color: labelTextColor),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Text(answer.text, style: InterFontStyle.font14W600Ink.copyWith(color: textColor)),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }

  (Color, Color, Color, Color, Color, Widget?) _resolveStyle(BattleAnswerState state) => switch (state) {
    BattleAnswerState.unanswered => (
      DesertColors.surface,
      ColorsManager.beige,
      ColorsManager.vanilla,
      ColorsManager.mediumGrey,
      DesertColors.ink,
      null,
    ),
    BattleAnswerState.selectedWrong => (
      SemanticColors.danger.withValues(alpha: 0.08),
      SemanticColors.danger,
      SemanticColors.danger,
      Colors.white,
      SemanticColors.danger,
      Icon(Icons.cancel_outlined, color: SemanticColors.danger, size: 18.sp),
    ),
    BattleAnswerState.correct => (
      SemanticColors.success.withValues(alpha: 0.08),
      SemanticColors.success,
      SemanticColors.success,
      Colors.white,
      SemanticColors.success,
      _CorrectBadge(),
    ),
  };
}

class _CorrectBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(color: SemanticColors.success),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text('✓+1', style: InterFontStyle.font11W600PrimaryGreen),
    );
  }
}
