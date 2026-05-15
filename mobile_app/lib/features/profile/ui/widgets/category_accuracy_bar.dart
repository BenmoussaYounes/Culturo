import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/category_accuracy_model.dart';

class CategoryAccuracyBar extends StatelessWidget {
  final CategoryAccuracyModel item;

  const CategoryAccuracyBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 82.w,
          child: Text(item.name, style: InterFontStyle.font13W400Ink),
        ),
        horizontalSpace(8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: item.percent / 100,
              minHeight: 6.h,
              backgroundColor: ColorsManager.beige,
              valueColor: AlwaysStoppedAnimation(item.barColor),
            ),
          ),
        ),
        horizontalSpace(8),
        SizedBox(
          width: 34.w,
          child: Text('${item.percent}%', style: JetBrainsMonoFontStyle.font12W600Ink, textAlign: .end),
        ),
      ],
    );
  }
}
