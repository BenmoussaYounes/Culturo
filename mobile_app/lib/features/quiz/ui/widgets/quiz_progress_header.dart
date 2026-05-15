import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../cubit/quiz_cubit.dart';

class QuizProgressHeader extends StatelessWidget {
  final QuizInProgress state;

  const QuizProgressHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, size: 12.sp, color: ColorsManager.greyBlue),
        ),
        horizontalSpace(12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: (state.currentIndex + (state.validated ? 1 : 0)) / state.totalQuestions,
              minHeight: 6.h,
              backgroundColor: ColorsManager.beige,
              valueColor: AlwaysStoppedAnimation(DesertColors.primary),
            ),
          ),
        ),
        horizontalSpace(10),
        Text(
          '${(state.currentIndex + 1).toString().padLeft(2, '0')} / ${state.totalQuestions}',
          style: JetBrainsMonoFontStyle.font11W600GreyBlue,
        ),
      ],
    );
  }
}
