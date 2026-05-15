import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class VerifyEmailInboxPreview extends StatelessWidget {
  const VerifyEmailInboxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_back, size: 12.sp, color: ColorsManager.greyGreen),
            horizontalSpace(4),
            Text('FROM YOUR INBOX', style: InterFontStyle.font10W600GreyGreen),
          ],
        ),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: ColorsManager.primaryBlack.withValues(alpha: 0.08)),
          ),
          child: Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(color: DesertColors.primary, borderRadius: BorderRadius.circular(8.r)),
                alignment: .center,
                child: Text('T', style: InterFontStyle.font16W600White),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Text('Tahaddi', style: InterFontStyle.font13W600Ink),
                        const Spacer(),
                        Text('now', style: InterFontStyle.font12W400GreyGreen),
                      ],
                    ),
                    verticalSpace(2),
                    Text.rich(
                      TextSpan(
                        text: 'Your code: ',
                        style: InterFontStyle.font13W400Ink,
                        children: [TextSpan(text: '— — — — — —', style: InterFontStyle.font13W600Ink)],
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      "Expires in 10 minutes. Don't share this code with anyone.",
                      style: InterFontStyle.font12W400GreyGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
