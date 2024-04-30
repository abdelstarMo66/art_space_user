import 'package:art_space_user/core/routing/app_router.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtSpaceApp extends StatelessWidget {
  final AppRouter appRouter;

  const ArtSpaceApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Art-Space',
        initialRoute: Routes.arPreview,
        theme: ThemeManager.getLightTheme(),
        darkTheme: ThemeManager.getDarkTheme(),
        themeMode: ThemeMode.light,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
