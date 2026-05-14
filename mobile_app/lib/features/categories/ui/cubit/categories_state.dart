part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  final int unlockedCount;
  final int totalCount;

  CategoriesLoaded({required this.categories, required this.unlockedCount, required this.totalCount});
}
