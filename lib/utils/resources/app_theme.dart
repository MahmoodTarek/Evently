import 'package:evently/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: LightColors().background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColors().background,
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: DarkColors().background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColors().background,
    ),
  );
}
