import 'package:flutter/widgets.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../categories/domain/models/category_domain_model.dart';
import '../../data/models/get_user_profile_reponse_model.dart';
import 'daily_challenge_domain_model.dart';
import 'user_info_domain_model.dart';
import 'user_stats_domain_model.dart';

class UserProfileDomainModel {
  final UserInfoDomainModel userInfo;
  final UserStatsDomainModel userStats;
  final DailyChallengeDomainModel? dailyChallenge;
  List<CategoryDomainModel> categories;

  UserProfileDomainModel({
    required this.userInfo,
    required this.userStats,
    this.dailyChallenge,
    this.categories = const [],
  });

  factory UserProfileDomainModel.fromGetUserProfileResponseModel(GetUserProfileResponseModel response) {
    final Color avatarBgColor = Color(int.parse(response.color.replaceFirst("#", "0xFF")));

    return UserProfileDomainModel(
      userInfo: UserInfoDomainModel(
        name: response.username,
        initial: response.username.getInitial(),
        streakCount: response.userLevel.level,
        avatarBgColor: avatarBgColor,
      ),
      userStats: UserStatsDomainModel(xp: response.userLevel.xp, level: response.userLevel.level, rank: 0),
      dailyChallenge: DailyChallengeDomainModel(
        date: "2023-09-15",
        resetCountdown: "12:34:56",
        questionCount: 10,
        playsCountFormatted: "1.2K",
      ),
      categories: [],
    );
  }
}
