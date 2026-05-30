import '../../../../core/enums/category_enum.dart';
import '../../data/models/categories_response_model.dart';

class CategoryDomainModel {
  final String iconUrl;
  final String name;
  final CategoryThemeEnum theme;
  final bool isPremium;

  const CategoryDomainModel({required this.iconUrl, required this.name, required this.theme, this.isPremium = false});

  factory CategoryDomainModel.fromResponseModel(CategoriesResponseModel response) {
    return CategoryDomainModel(
      iconUrl: response.icon,
      name: response.name,
      theme: CategoryThemeEnum.getThemeFromIndex(response.incid),
    );
  }
}
