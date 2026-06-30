import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base_state.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import '../../../core/widgets/app_error_widget.dart';
import '../../quiz/ui/quiz_screen.dart';
import '../domain/models/user_profile_domain_model.dart';
import 'cubit/home_cubit.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<HomeCubit, BaseState<UserProfileDomainModel>>(
        builder: (context, state) => state.when(
          initial: () => SizedBox.shrink(),
          loading: () => const AppCircularProgressIndicator(),
          loaded: (userProfile) => SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(userInfo: userProfile.userInfo),
                  verticalSpace(8),
                  DailyChallengeCard(
                    data: userProfile.dailyChallenge!,
                    onPlay: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
                  ),
                  verticalSpace(16),
                  StatsRow(stats: userProfile.userStats),
                  verticalSpace(8),
                  CategoriesSection(categories: userProfile.categories),
                ],
              ),
            ),
          ),
          error: (message) => AppErrorWidget(message),
        ),
      ),
    );
  }
}
