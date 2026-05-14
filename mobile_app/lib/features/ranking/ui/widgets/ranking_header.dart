import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';

class RankingHeader extends StatelessWidget {
  final String scopePrefix;
  final String totalPlayersLabel;

  const RankingHeader({super.key, required this.scopePrefix, required this.totalPlayersLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Classement', style: InstrumentSerifFontStyle.font26W500ItalicInk),
        verticalSpace(4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '$scopePrefix · ', style: InterFontStyle.font12W400GreyGreen),
              TextSpan(text: totalPlayersLabel, style: InterFontStyle.font13W700Ink),
              TextSpan(text: ' classés', style: InterFontStyle.font12W400GreyGreen),
            ],
          ),
        ),
      ],
    );
  }
}
