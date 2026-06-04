import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/inter_font_style.dart';
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
          ProfileError(:final message) => _ProfileErrorView(
            message: message,
            onRetry: () => context.read<ProfileCubit>().loadProfile(),
          ),
          ProfileLoaded() => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ProfileHeader(profile: state.profile),
                  verticalSpace(20),
                  ProfileStatsRow(profile: state.profile),
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

class _ProfileErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ProfileErrorView({required this.message, required this.onRetry});

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
