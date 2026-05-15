import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../domain/models/category_accuracy_model.dart';
import '../../domain/models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(
      ProfileLoaded(
        profile: ProfileModel(
          name: 'Amine B.',
          handle: '@amine.dz',
          initial: 'A',
          avatarBgColor: const Color(0xFF2D6A4F),
          isPro: true,
          subtitleLabel: 'Alger (16) · membre depuis fév. 2026',
          streakDays: 12,
          precisionPercent: 78,
          precisionSublabel: '% 1 240 Q',
          battlesLabel: '38/22',
          battleWinRatePercent: 63,
          activityGrid: const [
            [2, 4, 1, 3, 0],
            [1, 0, 3, 4, 2],
            [3, 2, 4, 1, 3],
            [0, 3, 2, 4, 1],
            [4, 2, 3, 1, 4],
            [4, 2, 3, 1, 4],
          ],
          categoryAccuracies: const [
            CategoryAccuracyModel(name: 'Histoire', percent: 86, barColor: SemanticColors.success),
            CategoryAccuracyModel(name: 'Darja', percent: 74, barColor: SemanticColors.success),
            CategoryAccuracyModel(name: 'Géographie', percent: 91, barColor: SemanticColors.success),
            CategoryAccuracyModel(name: 'Football', percent: 52, barColor: SemanticColors.danger),
            CategoryAccuracyModel(name: 'Musique', percent: 68, barColor: SemanticColors.success),
          ],
        ),
      ),
    );
  }
}
