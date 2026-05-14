import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/helpers.dart';
import '../../domain/models/models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadHome() {
    emit(
      HomeLoaded(
        userInfo: UserInfoModel(name: 'Amine', initial: 'A', streakCount: 12, avatarBgColor: getRandomColor()),
        dailyChallenge: const DailyChallengeModel(
          date: '28 AVRIL',
          resetCountdown: '23:59:42',
          questionCount: 10,
          playsCountFormatted: '2 348',
        ),
        stats: const UserStatsModel(streakDays: 12, precisionPercent: 78, rank: 142, city: 'Alger'),
        categories: const [
          CategoryModel(
            name: 'Histoire',
            description: '1830 — 1962 · 240 questions',
            iconColor: Color(0xFFC8512B),
            iconBg: Color(0xFFF9E0D8),
          ),
          CategoryModel(
            name: 'Darja',
            description: 'slang & expressions · 312 questions',
            iconColor: Color(0xFF3A8B7C),
            iconBg: Color(0xFFD0ECE5),
          ),
          CategoryModel(
            name: 'Wilayas',
            description: 'géographie · 48 régions · 198 questions',
            isPremium: true,
            iconColor: Color(0xFF3A8B7C),
            iconBg: Color(0xFFD0ECE5),
          ),
          CategoryModel(
            name: 'Football',
            description: 'sport & culture · 156 questions',
            isPremium: true,
            iconColor: Color(0xFF3A7A8B),
            iconBg: Color(0xFFD0E5EC),
          ),
        ],
      ),
    );
  }
}
