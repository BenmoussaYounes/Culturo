import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors_manager.dart' show DesertColors;

class CulturoApp extends StatelessWidget {
  final AppRouter appRouter;
  const CulturoApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Culturo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: DesertColors.primary,
            dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          ),
          scaffoldBackgroundColor: DesertColors.bg,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        debugShowCheckedModeBanner: true,
        initialRoute: Routes.onboarding,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
