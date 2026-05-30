import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/models/category_domain_model.dart';
import '../services/categories_api_service.dart';

class CategoriesRepository {
  final CategoriesApiService _api;

  CategoriesRepository(this._api);

  Future<ApiResult<List<CategoryDomainModel>>> getCategories() async {
    try {
      final categories = await _api.getCategories();

      final List<CategoryDomainModel> categoriesDomainModels = [];
      for (var category in categories) {
        categoriesDomainModels.add(CategoryDomainModel.fromResponseModel(category));
      }

      return ApiSuccess(categoriesDomainModels);
    } catch (error) {
      return ApiFailure(ApiErrorHandler.handle(error));
    }
  }
}
