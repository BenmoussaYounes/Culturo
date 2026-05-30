import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/battle_models.dart';

class BattleCategorySection extends StatelessWidget {
  final List<BattleCategoryModel> categories;

  const BattleCategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('CATÉGORIE', style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.0)),
            Text('Modifier →', style: InterFontStyle.font13W600Ink.copyWith(color: DesertColors.primary)),
          ],
        ),
        verticalSpace(10),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: categories.map((c) => _CategoryChip(model: c)).toList(),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final BattleCategoryModel model;

  const _CategoryChip({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: model.isSelected ? DesertColors.ink : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: model.isSelected ? DesertColors.ink : ColorsManager.mediumGrey.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Text(
        model.label,
        style: model.isSelected
            ? InterFontStyle.font13W600Ink.copyWith(color: ColorsManager.vanilla)
            : InterFontStyle.font13W400Ink.copyWith(color: ColorsManager.greyGreen),
      ),
    );
  }
}
