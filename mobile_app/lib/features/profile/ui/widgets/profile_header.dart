import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../domain/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      children: [
        CircleAvatar(
          radius: 32.r,
          backgroundColor: profile.avatarBgColor,
          child: Text(profile.initial, style: InstrumentSerifFontStyle.font30W400WhiteItalic),
        ),
        horizontalSpace(14),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(profile.username, style: InstrumentSerifFontStyle.font22W400Ink),
              Text(profile.email, style: InterFontStyle.font12W500MediumGrey),
              if (profile.memberSinceLabel.isNotEmpty)
                Text(profile.memberSinceLabel, style: InterFontStyle.font12W500MediumGrey),
            ],
          ),
        ),
      ],
    );
  }
}
