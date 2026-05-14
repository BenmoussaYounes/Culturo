import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/ranking_entry_model.dart';
import '../../../../core/widgets/app_avatar.dart';

class RankingRow extends StatelessWidget {
  final RankingEntryModel entry;

  const RankingRow({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 6.w, right: 12.w),
      decoration: BoxDecoration(color: DesertColors.surface, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            child: Text(
              '${entry.rank}',
              textAlign: TextAlign.center,
              style: InstrumentSerifFontStyle.font18W400Italic(
                entry.rank == 1 ? DesertColors.gold : ColorsManager.lightGrey,
              ),
            ),
          ),
          horizontalSpace(12),
          AppAvatar(entry.initial, entry.avatarBg),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(entry.username, style: InterFontStyle.font14W600Ink, overflow: .ellipsis),
                  if (entry.isVerified) ...[
                    horizontalSpace(4),
                    Icon(Icons.diamond, size: 10.sp, color: DesertColors.primary),
                  ],
                ],
              ),
              Text(entry.country, style: InterFontStyle.font11W500LightGrey),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(entry.scoreFormatted, style: InstrumentSerifFontStyle.font16W400Ink),
              Text(entry.deltaFormatted, style: JetBrainsMonoFontStyle.font11W600(entry.deltaColor)),
            ],
          ),
        ],
      ),
    );
  }
}
