import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/widgets/app_cached_network_image.dart';
import '../../../categories/domain/models/category_domain_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryDomainModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: DesertColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: DesertColors.primarySoft),
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(color: category.theme.bgColor, borderRadius: BorderRadius.circular(10.r)),
            alignment: Alignment.center,
            child: AppCachedNetworkImage(imageUrl: category.iconUrl, width: 20.sp, height: 20.sp),
          ),
          horizontalSpace(14),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(category.name, style: InterFontStyle.font13W600Ink),
                verticalSpace(2),
                Text(category.subtitle, style: InterFontStyle.font11W500LightGrey),
              ],
            ),
          ),
          horizontalSpace(8),
          if (category.isPremium)
            _PremiumBadge()
          else
            Icon(Icons.arrow_forward, size: 16.sp, color: ColorsManager.greyGreen),
        ],
      ),
    );
  }
}

class _PremiumBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        Icon(Icons.star, size: 10.sp, color: DesertColors.gold),
        horizontalSpace(3),
        Text(
          'PREMIUM',
          style: InterFontStyle.font9W800Gold.copyWith(fontSize: 9.sp, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
