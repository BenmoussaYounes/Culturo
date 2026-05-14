import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/dependency_injection.dart';
import '../core/theming/colors_manager.dart';
import '../core/theming/inter_font_style.dart';
import 'home/ui/cubit/home_cubit.dart';
import 'home/ui/home_screen.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          BlocProvider(create: (_) => getIt<HomeCubit>()..loadHome(), child: const HomeScreen()),
          const _PlaceholderTab(label: 'Catégories'),
          const _PlaceholderTab(label: 'Battle'),
          const _PlaceholderTab(label: 'Classement'),
          const _PlaceholderTab(label: 'Moi'),
        ],
      ),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
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
          icon: Icon(Icons.diversity_3_outlined),
          activeIcon: Icon(Icons.diversity_3),
          label: 'Battle',
        ),
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

class _PlaceholderTab extends StatelessWidget {
  final String label;

  const _PlaceholderTab({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(label, style: InterFontStyle.font15W500Ink)),
    );
  }
}
