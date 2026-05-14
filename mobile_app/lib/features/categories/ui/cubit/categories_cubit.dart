import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void loadCategories() {
    const categories = [
      CategoryModel(
        name: 'Histoire',
        subtitle: '1830 — 1962',
        questionCount: 248,
        icon: Icons.history_edu_outlined,
        iconColor: Color(0xFF2A7D65),
        iconBg: Color(0xFFD0ECE5),
      ),
      CategoryModel(
        name: 'Darja',
        subtitle: 'argot · expressions',
        questionCount: 312,
        icon: Icons.record_voice_over_outlined,
        iconColor: Color(0xFFB54470),
        iconBg: Color(0xFFF5DDE5),
      ),
      CategoryModel(
        name: 'Wilayas',
        subtitle: '48 régions',
        questionCount: 198,
        isPremium: true,
        icon: Icons.map_outlined,
        iconColor: Color(0xFF2A7D65),
        iconBg: Color(0xFFD0ECE5),
      ),
      CategoryModel(
        name: 'Football',
        subtitle: 'Les Fennecs',
        questionCount: 156,
        isPremium: true,
        icon: Icons.sports_soccer,
        iconColor: Color(0xFF2A5A8B),
        iconBg: Color(0xFFD6E8F5),
      ),
      CategoryModel(
        name: 'Musique',
        subtitle: 'Raï · Chaabi · Kabyle',
        questionCount: 124,
        isPremium: true,
        icon: Icons.music_note_outlined,
        iconColor: Color(0xFF3A7A35),
        iconBg: Color(0xFFD8EDD5),
      ),
      CategoryModel(
        name: 'Ramadan',
        subtitle: 'Islam & traditions',
        questionCount: 88,
        isPremium: true,
        icon: Icons.nightlight_outlined,
        iconColor: Color(0xFFB54470),
        iconBg: Color(0xFFF5DDE5),
      ),
      CategoryModel(
        name: 'Cuisine',
        subtitle: 'plats & souks',
        questionCount: 102,
        isPremium: true,
        icon: Icons.restaurant_outlined,
        iconColor: Color(0xFF8B5E35),
        iconBg: Color(0xFFF0E2D0),
      ),
      CategoryModel(
        name: 'Cinéma',
        subtitle: 'films & séries DZ',
        questionCount: 64,
        isPremium: true,
        icon: Icons.movie_outlined,
        iconColor: Color(0xFF8B2A2A),
        iconBg: Color(0xFFEDD5D5),
      ),
    ];

    final unlockedCount = categories.where((c) => !c.isPremium).length;

    emit(CategoriesLoaded(categories: categories, unlockedCount: unlockedCount, totalCount: categories.length));
  }
}
