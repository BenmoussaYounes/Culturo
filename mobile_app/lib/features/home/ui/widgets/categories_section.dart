import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/instrument_serif_font_style.dart';
import '../../../categories/domain/models/category_domain_model.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryDomainModel> categories;

  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Catégories', style: InstrumentSerifFontStyle.font22W400Ink.copyWith(fontStyle: FontStyle.italic)),
        verticalSpace(8),
        SizedBox(
          height: 292.h,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: CategoryItem(category: categories[index]),
            ),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
