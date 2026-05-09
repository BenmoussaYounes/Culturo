import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/theming.dart';
import 'widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Culturo', style: InstrumentSerifFontStyle.font19W400Black),
                  Text('v1.0 · ✦', style: JetBrainsMonoFontStyle.font10W600Grey),
                ],
              ),
            ),
            verticalSpace(12),
            CountryQuizGrid(),
            verticalSpace(8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('✦ THE CULTURAL QUIZ', style: JetBrainsMonoFontStyle.font10W700Primary(DesertColors.primary)),
                  verticalSpace(8),
                  DoYouRellayNowText(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: ChoseYourCountryBottomButton(),
      ),
    );
  }
}
