import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';

class CountryQuizGrid extends StatelessWidget {
  const CountryQuizGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.12,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 24.w),
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(color: DesertColors.surface, borderRadius: BorderRadius.circular(16)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: .min,
                children: [
                  _buildRow(['DZ', 'FR', 'TN', 'EG', 'LY', 'MA']),
                  verticalSpace(8),
                  _buildRow(['SA', 'JO', 'IT', 'BE', 'ES', 'DE']),
                ],
              ),

              Container(
                margin: EdgeInsets.only(right: 54.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFB94E2E),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text('✦ Culturo · QUIZ', style: JetBrainsMonoFontStyle.font12W400White),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<String> codes) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: codes.map((code) {
        return _CountryTile(code: code);
      }).toList(),
    );
  }
}

class _CountryTile extends StatelessWidget {
  final String code;
  const _CountryTile({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      alignment: .center,
      child: Text(code, style: JetBrainsMonoFontStyle.font16W400Ink),
    );
  }
}
