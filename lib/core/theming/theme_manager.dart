import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    scaffoldBackgroundColor: ColorManager.originalWhite,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: ColorManager.transparent,
    ),
  );

  static ThemeData getDarkTheme() => ThemeData(
    scaffoldBackgroundColor: DarkColorManager.scaffold,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: ColorManager.transparent,
    ),
  );
}
