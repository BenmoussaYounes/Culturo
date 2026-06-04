import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/instrument_serif_font_style.dart';
import '../../../core/theming/inter_font_style.dart';
import '../../../core/theming/jet_brains_mono_font_style.dart';
import 'cubit/quiz_cubit.dart';
import 'widgets/widgets.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizCompleted result;

  const QuizResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              _TopBar(result: result),
              verticalSpace(24),
              Text(result.headlineLabel, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
              verticalSpace(4),
              _ScoreDisplay(score: result.score, total: result.total),
              verticalSpace(6),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '${result.beatPercentLabel} ', style: InterFontStyle.font13W400Ink),
                    TextSpan(text: result.encouragementLabel, style: InstrumentSerifFontStyle.font13W500AccentItalic),
                  ],
                ),
              ),
              if (result.xpEarned > 0) ...[verticalSpace(12), _XpBadge(xpEarned: result.xpEarned, level: result.level)],
              verticalSpace(20),
              QuizResultShareCard(result: result),
              if (result.categoryResults.isNotEmpty) ...[
                verticalSpace(26),
                Row(
                  mainAxisAlignment: .start,
                  children: [Text('PAR CATÉGORIE', style: JetBrainsMonoFontStyle.font10W500MediumGrey)],
                ),
                verticalSpace(12),
                for (int i = 0; i < result.categoryResults.length; i++) ...[
                  QuizResultCategoryRow(category: result.categoryResults[i]),
                  if (i < result.categoryResults.length - 1) verticalSpace(10),
                ],
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Column(
          mainAxisSize: .min,
          children: [
            _WhatsAppButton(),
            verticalSpace(12),
            _ReviewButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final QuizCompleted result;

  const _TopBar({required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, size: 12.sp, color: ColorsManager.greyBlue),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.beige),
          ),
          child: Text(result.dateLabel, style: JetBrainsMonoFontStyle.font10W500MediumGrey),
        ),
      ],
    );
  }
}

class _ScoreDisplay extends StatelessWidget {
  final int score;
  final int total;

  const _ScoreDisplay({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$score', style: InstrumentSerifFontStyle.font96W400ItalicMediumGrey),
          TextSpan(text: '/$total', style: InstrumentSerifFontStyle.font56W400ItalicMediumGrey),
        ],
      ),
    );
  }
}

class _XpBadge extends StatelessWidget {
  final int xpEarned;
  final int level;

  const _XpBadge({required this.xpEarned, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: DesertColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: DesertColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(Icons.bolt_rounded, size: 16.sp, color: DesertColors.primary),
          SizedBox(width: 4.w),
          Text(
            '+$xpEarned XP  ·  Niveau $level',
            style: InterFontStyle.font13W400Ink.copyWith(color: DesertColors.primary),
          ),
        ],
      ),
    );
  }
}

class _WhatsAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF25D366),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.chat_rounded, color: const Color(0xFFFFFFFF), size: 18.sp),
            SizedBox(width: 8.w),
            Text(
              'Partager sur WhatsApp',
              style: InterFontStyle.font15W700PrimaryGreen.copyWith(color: const Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ReviewButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: ColorsManager.beige),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Text('Revoir les réponses', style: InterFontStyle.font14W500Ink),
      ),
    );
  }
}
