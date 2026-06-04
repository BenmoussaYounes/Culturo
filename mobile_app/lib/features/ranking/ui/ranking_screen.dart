import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/inter_font_style.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/ranking_cubit.dart';
import 'widgets/widgets.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<RankingCubit, RankingState>(
        builder: (context, state) => switch (state) {
          RankingInitial() => const AppCircularProgressIndicator(),
          RankingError(:final message) => _RankingErrorView(
            message: message,
            onRetry: () => context.read<RankingCubit>().loadRanking(),
          ),
          RankingLoaded() => SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, top: 12.h, right: 18.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  RankingHeader(scopePrefix: state.scopePrefix, totalPlayersLabel: state.totalPlayersLabel),
                  verticalSpace(16),
                  TopEntryCard(entry: state.topEntry),
                  verticalSpace(12),
                  SizedBox(
                    height: 532.h,
                    child: ListView.separated(
                      itemBuilder: (context, index) => RankingRow(entry: state.entries[index]),
                      separatorBuilder: (context, index) => verticalSpace(8),
                      itemCount: state.entries.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}

class _RankingErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _RankingErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(message, style: InterFontStyle.font14W500Ink, textAlign: .center),
              verticalSpace(20),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesertColors.ink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Text('Réessayer', style: InterFontStyle.font16W600White),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
