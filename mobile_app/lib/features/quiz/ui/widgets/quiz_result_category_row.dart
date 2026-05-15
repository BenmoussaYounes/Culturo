import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/quiz_category_result.dart';

class QuizResultCategoryRow extends StatelessWidget {
  final QuizCategoryResult category;

  const QuizResultCategoryRow({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final barColor = category.fraction >= 0.5 ? SemanticColors.success : SemanticColors.danger;

    return Row(
      children: [
        SizedBox(
          width: 82.w,
          child: Text(category.name, style: InterFontStyle.font13W400Ink),
        ),
        horizontalSpace(8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: category.fraction,
              minHeight: 6.h,
              backgroundColor: ColorsManager.beige,
              valueColor: AlwaysStoppedAnimation(barColor),
            ),
          ),
        ),
        horizontalSpace(8),
        SizedBox(
          width: 34.w,
          child: Text(
            '${category.correct}/${category.total}',
            style: JetBrainsMonoFontStyle.font12W600Ink,
            textAlign: .end,
          ),
        ),
      ],
    );
  }
}
