import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/ranking_entry_model.dart';

class TopEntryCard extends StatelessWidget {
  final RankingEntryModel entry;

  const TopEntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: DesertColors.ink.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                decoration: BoxDecoration(color: DesertColors.accent, borderRadius: BorderRadius.circular(16.r)),
                alignment: Alignment.center,
                child: Text(entry.initial, style: InstrumentSerifFontStyle.font22W700WhiteItalic),
              ),
              horizontalSpace(14),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    '✦ #1 MONDIAL',
                    style: JetBrainsMonoFontStyle.font10W500Vanilla.copyWith(
                      color: ColorsManager.vanilla.withValues(alpha: 0.6),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: entry.username, style: InstrumentSerifFontStyle.font24W400ItalicVanilla),
                        WidgetSpan(child: horizontalSpace(6)),
                        TextSpan(text: entry.countryCode, style: InterFontStyle.font12W500Vanilla),
                      ],
                    ),
                  ),
                  Text(
                    '${entry.ptsFormatted} pts cette saison',
                    style: InterFontStyle.font12W500Vanilla.copyWith(
                      color: ColorsManager.vanilla.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Text(
            '★',
            style: TextStyle(color: DesertColors.gold, fontSize: 32.sp, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
