import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';

class BattleVsRow extends StatelessWidget {
  final String playerName;
  final String playerInitial;
  final Color playerAvatarBg;
  final String playerLocation;
  final String playerRank;

  const BattleVsRow({
    super.key,
    required this.playerName,
    required this.playerInitial,
    required this.playerAvatarBg,
    required this.playerLocation,
    required this.playerRank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      children: [
        _PlayerCard(
          name: playerName,
          initial: playerInitial,
          avatarBg: playerAvatarBg,
          location: playerLocation,
          rank: playerRank,
        ),
        Expanded(
          child: Center(child: Text('VS', style: InstrumentSerifFontStyle.font18W400GreyGreenItalic)),
        ),
        const _OpponentPlaceholder(),
      ],
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final String name;
  final String initial;
  final Color avatarBg;
  final String location;
  final String rank;

  const _PlayerCard({
    required this.name,
    required this.initial,
    required this.avatarBg,
    required this.location,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(color: avatarBg, shape: .circle),
          alignment: Alignment.center,
          child: Text(initial, style: InstrumentSerifFontStyle.font18W400White),
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Text(name, style: InterFontStyle.font14W600Ink),
                horizontalSpace(4),
                Text('(toi)', style: InterFontStyle.font12W400GreyGreen),
              ],
            ),
            Text('$location · $rank', style: JetBrainsMonoFontStyle.font10W500MediumGrey),
          ],
        ),
      ],
    );
  }
}

class _OpponentPlaceholder extends StatelessWidget {
  const _OpponentPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.beige.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.mediumGrey.withValues(alpha: 0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('recherche', style: InterFontStyle.font13W400Ink.copyWith(color: ColorsManager.mediumGrey)),
          Text('· #', style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ],
      ),
    );
  }
}
