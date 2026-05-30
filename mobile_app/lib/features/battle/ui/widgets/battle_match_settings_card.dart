import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../domain/models/battle_game_models.dart';

class BattleMatchSettingsCard extends StatelessWidget {
  final BattleMatchSettingsModel settings;

  const BattleMatchSettingsCard({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(color: DesertColors.surface, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('RÉGLAGES DU MATCH', style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.0)),
          verticalSpace(12),
          Row(
            children: [
              _SettingChip(label: 'MANCHES', value: '${settings.rounds}'),
              horizontalSpace(10),
              _SettingChip(label: 'TEMPS / Q', value: '${settings.secondsPerQuestion}s'),
            ],
          ),
          verticalSpace(12),
          _SettingRow(label: 'CATÉGORIE', value: settings.category),
          verticalSpace(8),
          _SettingRow(label: 'DIFFICULTÉ', value: settings.difficulty),
        ],
      ),
    );
  }
}

class _SettingChip extends StatelessWidget {
  final String label;
  final String value;

  const _SettingChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(color: DesertColors.primary, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(label, style: JetBrainsMonoFontStyle.font9W600White.copyWith(letterSpacing: 0.5)),
          verticalSpace(2),
          Text(value, style: InstrumentSerifFontStyle.font22W700WhiteItalic),
        ],
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final String label;
  final String value;

  const _SettingRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 0.8)),
        Text(value, style: InterFontStyle.font13W600Ink),
      ],
    );
  }
}
