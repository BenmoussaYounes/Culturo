import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/categories_cubit.dart';
import 'widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) => switch (state) {
          CategoriesInitial() => const AppCircularProgressIndicator(),
          CategoriesLoaded() => SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, top: 12.h, right: 18.w),
              child: Column(
                children: [
                  CategoriesHeader(unlockedCount: state.unlockedCount, totalCount: state.totalCount),
                  verticalSpace(16),
                  SizedBox(
                    height: 626.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1.15.h,
                      ),
                      itemBuilder: (context, index) => CategoryCard(category: state.categories[index]),
                      itemCount: state.categories.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        },
      ),
    );
  }
}
