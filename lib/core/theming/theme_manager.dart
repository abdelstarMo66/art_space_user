import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    scaffoldBackgroundColor: ColorManager.originalWhite,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: ColorManager.originalWhite,
    ),
  );

  static ThemeData getDarkTheme() => ThemeData();
}
