import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import '../../quiz/ui/quiz_screen.dart';
import 'cubit/home_cubit.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => switch (state) {
          HomeInitial() => const AppCircularProgressIndicator(),
          HomeLoaded() => SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  HomeHeader(userInfo: state.userInfo),
                  verticalSpace(8),
                  DailyChallengeCard(
                    data: state.dailyChallenge,
                    onPlay: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
                  ),
                  verticalSpace(16),
                  StatsRow(stats: state.stats),
                  verticalSpace(24),
                  CategoriesSection(categories: state.categories),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}
