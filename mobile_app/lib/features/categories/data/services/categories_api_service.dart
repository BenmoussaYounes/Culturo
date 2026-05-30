import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/categories_response_model.dart';

class CategoriesApiService {
  final Dio _dio;
  CategoriesApiService(this._dio);

  Future<List<CategoriesResponseModel>> getCategories() async {
    final response = await _dio.get(ApiConstants.category);

    List<CategoriesResponseModel> categories = [];

    for (var category in response.data) {
      categories.add(CategoriesResponseModel.fromJson(category));
    }

    return categories;
  }
}
