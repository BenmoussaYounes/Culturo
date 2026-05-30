import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';

class CategoriesHeader extends StatelessWidget {
  final int unlockedCount;
  final int totalCount;

  const CategoriesHeader({super.key, required this.unlockedCount, required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Catégories', style: InstrumentSerifFontStyle.font26W400ItalicInk),
        verticalSpace(4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Choisis ton terrain. ', style: InterFontStyle.font13W400GreyGreen),
              TextSpan(text: "Lequel je prends ?", style: InstrumentSerifFontStyle.font13W500AccentItalic),
            ],
          ),
        ),
      ],
    );
  }
}
