import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppThemeExtension on BuildContext {
  ThemeProvider get themeProvider => watch<ThemeProvider>();

  AppColors get colors {
    if (themeProvider.currentTheme == ThemeMode.dark) {
      return DarkColors();
    } else {
      return LightColors();
    }
  }
}
