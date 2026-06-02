import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_state.dart';
import '../../../../core/networking/api_result.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../../categories/domain/models/category_domain_model.dart';
import '../../data/repositories/home_repository.dart';
import '../../domain/models/models.dart';
import '../../domain/models/user_profile_domain_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<BaseState<UserProfileDomainModel>> {
  final HomeRepository homeRepository;
  final CategoriesRepository categoriesRepository;
  HomeCubit(this.homeRepository, this.categoriesRepository) : super(Initial());

  void loadHome() async {
    emit(Loading());

    final result = await Future.wait([homeRepository.getUserProfile(), categoriesRepository.getCategories()]);

    final userProfileResult = result[0] as ApiResult<UserProfileDomainModel>;
    final categoriesResult = result[1] as ApiResult<List<CategoryDomainModel>>;

    userProfileResult.when(
      success: (userProfile) {
        categoriesResult.when(
          success: (categories) {
            userProfile.categories = categories;
            emit(Loaded(userProfile));
          },
          failure: (error) => emit(Failure("Failed to load categories: ${error.message}")),
        );
      },
      failure: (error) => emit(Failure("Failed to load user profile: ${error.message}")),
    );
  }
}
