import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/inter_font_style.dart';

class BattleGameReactions extends StatelessWidget {
  const BattleGameReactions({super.key});

  static const _reactions = ['🍑', '🔥', '😻'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        ..._reactions.map((emoji) => _ReactionButton(label: emoji, isEmoji: true)),
        _ReactionButton(label: 'DZ', isEmoji: false),
      ],
    );
  }
}

class _ReactionButton extends StatelessWidget {
  final String label;
  final bool isEmoji;

  const _ReactionButton({required this.label, required this.isEmoji});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(color: DesertColors.surface, shape: .circle),
        alignment: Alignment.center,
        child: isEmoji
            ? Text(label, style: TextStyle(fontSize: 20.sp))
            : Text(label, style: InterFontStyle.font12W600GreyGreen),
      ),
    );
  }
}
