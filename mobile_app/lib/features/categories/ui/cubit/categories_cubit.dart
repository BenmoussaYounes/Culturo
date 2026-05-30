import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_state.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repositories/categories_repository.dart';
import '../../domain/models/category_domain_model.dart';

export '../../../../core/base_state.dart';

class CategoriesCubit extends Cubit<BaseState<List<CategoryDomainModel>>> {
  final CategoriesRepository categoryRepository;
  CategoriesCubit(this.categoryRepository) : super(Initial());

  void loadCategories() async {
    final result = await categoryRepository.getCategories();

    result.when(success: (categories) => emit(Loaded(categories)), failure: (error) => emit(Failure(error.message)));
  }
}
