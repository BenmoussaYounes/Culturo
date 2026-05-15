import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/battle_models.dart';

class BattleRecentOpponents extends StatelessWidget {
  final List<BattleRecentOpponentModel> opponents;

  const BattleRecentOpponents({super.key, required this.opponents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'ADVERSAIRES RÉCENTS',
              style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.0),
            ),
            Text('Demander revanche', style: InterFontStyle.font13W600Ink.copyWith(color: DesertColors.primary)),
          ],
        ),
        verticalSpace(10),
        ...opponents.map((o) => _OpponentRow(model: o)),
      ],
    );
  }
}

class _OpponentRow extends StatelessWidget {
  final BattleRecentOpponentModel model;

  const _OpponentRow({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(color: DesertColors.surface, borderRadius: BorderRadius.circular(14.r)),
      child: Row(
        children: [
          _OpponentAvatar(initial: model.initial, bg: model.avatarBg, isOnline: model.isOnline),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(model.username, style: InterFontStyle.font14W600Ink),
                    if (model.isOnline) ...[
                      horizontalSpace(6),
                      Container(
                        width: 7.w,
                        height: 7.w,
                        decoration: const BoxDecoration(color: SemanticColors.success, shape: .circle),
                      ),
                    ],
                  ],
                ),
                verticalSpace(2),
                Text(
                  '${model.location} · ELO ${model.elo} · ${model.timeLabel}',
                  style: InterFontStyle.font12W400GreyGreen,
                ),
              ],
            ),
          ),
          const _RevengeButton(),
        ],
      ),
    );
  }
}

class _OpponentAvatar extends StatelessWidget {
  final String initial;
  final Color bg;
  final bool isOnline;

  const _OpponentAvatar({required this.initial, required this.bg, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(color: bg, shape: .circle),
          alignment: Alignment.center,
          child: Text(initial, style: InstrumentSerifFontStyle.font18W400White),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: SemanticColors.success,
                shape: .circle,
                border: Border.all(color: DesertColors.surface, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}

class _RevengeButton extends StatelessWidget {
  const _RevengeButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(color: DesertColors.ink, borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          mainAxisSize: .min,
          children: [
            Text(
              '⚔ ',
              style: TextStyle(fontSize: 12.sp, color: ColorsManager.vanilla),
            ),
            Text('Revanche', style: InterFontStyle.font12W600White),
          ],
        ),
      ),
    );
  }
}
