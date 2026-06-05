import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../../core/theming/inter_font_style.dart';

class BattleGameHeader extends StatelessWidget {
  final String player1Name;
  final String player1Initial;
  final Color player1AvatarBg;
  final bool player1Answered;
  final int player1Score;
  final String player2Name;
  final String player2Initial;
  final Color player2AvatarBg;
  final bool player2Thinking;
  final int player2Score;
  final int totalRounds;
  final double timerProgress;

  const BattleGameHeader({
    super.key,
    required this.player1Name,
    required this.player1Initial,
    required this.player1AvatarBg,
    required this.player1Answered,
    required this.player1Score,
    required this.player2Name,
    required this.player2Initial,
    required this.player2AvatarBg,
    required this.player2Thinking,
    required this.player2Score,
    required this.totalRounds,
    required this.timerProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            _PlayerPanel(
              name: player1Name,
              initial: player1Initial,
              avatarBg: player1AvatarBg,
              statusLabel: player1Answered ? '✓ répondu' : '_ réfléchit',
              statusColor: player1Answered ? DesertColors.primary : ColorsManager.mediumGrey,
              score: player1Score,
              scoreColor: DesertColors.primary,
              totalRounds: totalRounds,
              avatarOnLeft: true,
            ),
            _PlayerPanel(
              name: player2Name,
              initial: player2Initial,
              avatarBg: player2AvatarBg,
              statusLabel: player2Thinking ? '_ réfléchit' : '✓ répondu',
              statusColor: player2Thinking ? ColorsManager.mediumGrey : DesertColors.primary,
              score: player2Score,
              scoreColor: SemanticColors.danger.withValues(alpha: 0.7),
              totalRounds: totalRounds,
              avatarOnLeft: false,
            ),
          ],
        ),
        verticalSpace(10),
        _TimerBar(progress: timerProgress),
      ],
    );
  }
}

class _PlayerPanel extends StatelessWidget {
  final String name;
  final String initial;
  final Color avatarBg;
  final String statusLabel;
  final Color statusColor;
  final int score;
  final Color scoreColor;
  final int totalRounds;
  final bool avatarOnLeft;

  const _PlayerPanel({
    required this.name,
    required this.initial,
    required this.avatarBg,
    required this.statusLabel,
    required this.statusColor,
    required this.score,
    required this.scoreColor,
    required this.totalRounds,
    required this.avatarOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: 34.w,
      height: 34.w,
      decoration: BoxDecoration(color: avatarBg, shape: .circle),
      alignment: Alignment.center,
      child: Text(initial, style: InstrumentSerifFontStyle.font15W400ItalicInk.copyWith(color: Colors.white)),
    );

    final nameColumn = Column(
      crossAxisAlignment: avatarOnLeft ? .start : .end,
      children: [
        Text(name, style: InterFontStyle.font13W600Ink),
        Text(statusLabel, style: InterFontStyle.font11W500LightGrey.copyWith(color: statusColor)),
      ],
    );

    return Column(
      crossAxisAlignment: avatarOnLeft ? .start : .end,
      children: [
        Row(
          children: avatarOnLeft ? [avatar, horizontalSpace(8), nameColumn] : [nameColumn, horizontalSpace(8), avatar],
        ),
        verticalSpace(4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '$score', style: InstrumentSerifFontStyle.font38W400Italic(scoreColor)),
              TextSpan(text: '/$totalRounds', style: InterFontStyle.font13W400GreyGreen),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimerBar extends StatelessWidget {
  final double progress;

  const _TimerBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: ColorsManager.beige, borderRadius: BorderRadius.circular(2.r)),
          ),
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(color: DesertColors.accent, borderRadius: BorderRadius.circular(2.r)),
            ),
          ),
        ],
      ),
    );
  }
}
