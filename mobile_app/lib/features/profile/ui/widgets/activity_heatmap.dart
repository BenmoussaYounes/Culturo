import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';

class ActivityHeatmap extends StatelessWidget {
  final List<List<int>> activityGrid;

  const ActivityHeatmap({super.key, required this.activityGrid});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('ACTIVITÉ · 5 DERNIÈRES SEMAINES', style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        verticalSpace(12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int col = 0; col < activityGrid.length; col++) ...[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int row = 0; row < activityGrid[col].length; row++) ...[
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _cellColor(activityGrid[col][row]),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                    if (row < activityGrid[col].length - 1) verticalSpace(6),
                  ],
                ],
              ),
              if (col < activityGrid.length - 1) horizontalSpace(6),
            ],
          ],
        ),
      ],
    );
  }

  Color _cellColor(int intensity) => switch (intensity) {
    0 => DesertColors.primary.withValues(alpha: 0.1),
    1 => DesertColors.primary.withValues(alpha: 0.2),
    2 => DesertColors.primary.withValues(alpha: 0.5),
    3 => DesertColors.primary.withValues(alpha: 0.8),
    _ => DesertColors.primary,
  };
}
