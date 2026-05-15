import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/profile_cubit.dart';
import 'widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => switch (state) {
          ProfileInitial() => const AppCircularProgressIndicator(),
          ProfileLoaded() => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ProfileHeader(profile: state.profile),
                  verticalSpace(20),
                  ProfileStatsRow(profile: state.profile),
                  verticalSpace(24),
                  ActivityHeatmap(activityGrid: state.profile.activityGrid),
                  verticalSpace(24),
                  CategoryAccuracySection(items: state.profile.categoryAccuracies),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}
