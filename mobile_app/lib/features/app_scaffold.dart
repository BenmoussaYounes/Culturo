import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/dependency_injection.dart';
import '../core/theming/colors_manager.dart';
import '../core/theming/inter_font_style.dart';
import 'categories/ui/categories_screen.dart';
import 'categories/ui/cubit/categories_cubit.dart';
import 'profile/ui/cubit/profile_cubit.dart';
import 'profile/ui/profile_screen.dart';
import 'ranking/ui/cubit/ranking_cubit.dart';
import 'ranking/ui/ranking_screen.dart';
import 'home/ui/cubit/home_cubit.dart';
import 'home/ui/home_screen.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;
  final _visitedTabs = <int>{0};

  late final _homeCubit = getIt<HomeCubit>()..loadHome();
  late final _categoriesCubit = getIt<CategoriesCubit>();
  late final _rankingCubit = getIt<RankingCubit>();
  late final _profileCubit = getIt<ProfileCubit>();

  @override
  void dispose() {
    _homeCubit.close();
    _categoriesCubit.close();
    _rankingCubit.close();
    _profileCubit.close();
    super.dispose();
  }

  void _onTabTap(int index) {
    if (!_visitedTabs.contains(index)) {
      _visitedTabs.add(index);
      switch (index) {
        case 1:
          _categoriesCubit.loadCategories();
        case 2:
          _rankingCubit.loadRanking();
        case 3:
          _profileCubit.loadProfile();
      }
    }
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _homeCubit),
        BlocProvider.value(value: _categoriesCubit),
        BlocProvider.value(value: _rankingCubit),
        BlocProvider.value(value: _profileCubit),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [HomeScreen(), CategoriesScreen(), RankingScreen(), ProfileScreen()],
        ),
        bottomNavigationBar: _BottomNav(currentIndex: _currentIndex, onTap: _onTabTap),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: DesertColors.surface,
      selectedItemColor: DesertColors.primary,
      unselectedItemColor: ColorsManager.greyGreen,
      selectedLabelStyle: InterFontStyle.font10W600Primary,
      unselectedLabelStyle: InterFontStyle.font10W600Primary.copyWith(color: ColorsManager.greyGreen),
      elevation: 8,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.diamond_outlined), activeIcon: Icon(Icons.diamond), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.apps_outlined), activeIcon: Icon(Icons.apps), label: 'Catégories'),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          activeIcon: Icon(Icons.star),
          label: 'Classement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: 'Moi',
        ),
      ],
    );
  }
}
