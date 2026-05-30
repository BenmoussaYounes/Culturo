import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import '../domain/models/category_domain_model.dart';
import 'cubit/categories_cubit.dart';
import 'widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<CategoriesCubit, BaseState<List<CategoryDomainModel>>>(
        builder: (context, state) => state.maybeWhen(
          initial: () => const AppCircularProgressIndicator(),
          loaded: (categories) => SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, top: 12.h, right: 18.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CategoriesHeader(unlockedCount: 5, totalCount: 7),
                  verticalSpace(16),
                  SizedBox(
                    height: 626.h,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1.15.h,
                      ),
                      itemBuilder: (context, index) => CategoryCard(category: categories[index]),
                      itemCount: categories.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
