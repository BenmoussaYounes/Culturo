import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../../core/theming/inter_font_style.dart';

import '../../domain/models/category_model.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Catégories', style: InstrumentSerifFontStyle.font22W400Ink.copyWith(fontStyle: FontStyle.italic)),
            GestureDetector(
              onTap: () {},
              child: Text('Tout voir', style: InterFontStyle.font12W600Accent.copyWith(fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        verticalSpace(4),
        SizedBox(
          height: 294.h,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: CategoryItem(category: categories[index]),
            ),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
