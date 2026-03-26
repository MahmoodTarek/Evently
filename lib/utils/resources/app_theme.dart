import 'package:evently/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightColors().background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColors().background,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColors().background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColors().background,
    ),
  );
}