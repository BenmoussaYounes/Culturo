import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/category_accuracy_model.dart';
import 'category_accuracy_bar.dart';

class CategoryAccuracySection extends StatelessWidget {
  final List<CategoryAccuracyModel> items;

  const CategoryAccuracySection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('PRÉCISION PAR CATÉGORIE', style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        verticalSpace(12),
        for (int i = 0; i < items.length; i++) ...[
          CategoryAccuracyBar(item: items[i]),
          if (i < items.length - 1) verticalSpace(10),
        ],
      ],
    );
  }
}
