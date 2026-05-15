import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/instrument_serif_font_style.dart';

class BattleGameQuestion extends StatelessWidget {
  final String before;
  final String highlight;
  final String after;

  const BattleGameQuestion({super.key, required this.before, required this.highlight, required this.after});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: InstrumentSerifFontStyle.font26W400ItalicInk.copyWith(height: 1.3),
        children: [
          TextSpan(text: before),
          TextSpan(
            text: highlight,
            style: InstrumentSerifFontStyle.font26W400ItalicInk.copyWith(height: 1.3, color: DesertColors.primary),
          ),
          TextSpan(text: after),
        ],
      ),
    );
  }
}
