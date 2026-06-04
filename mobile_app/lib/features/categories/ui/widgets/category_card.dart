import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';
import '../../../../core/theming/jet_brains_mono_font_style.dart';
import '../../../../core/widgets/app_cached_network_image.dart';
import '../../domain/models/category_domain_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryDomainModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 8.h),
      decoration: BoxDecoration(
        color: DesertColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: DesertColors.primarySoft),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
            decoration: BoxDecoration(color: category.theme.bgColor, borderRadius: BorderRadius.circular(10.r)),
            child: AppCachedNetworkImage(imageUrl: category.iconUrl, width: 48.w, height: 48.h),
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                category.name,
                style: InstrumentSerifFontStyle.font15W400ItalicInk,
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Text(category.subtitle, style: InterFontStyle.font11W500LightGrey, maxLines: 2, overflow: .ellipsis),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('${category.quizCount} Q', style: JetBrainsMonoFontStyle.font11W500MediumGrey),
              if (category.isPremium)
                Icon(Icons.diamond_outlined, size: 14.sp, color: DesertColors.gold)
              else
                Icon(Icons.arrow_forward, size: 14.sp, color: ColorsManager.greyGreen),
            ],
          ),
        ],
      ),
    );
  }
}
