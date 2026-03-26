import 'package:evently/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;

    if (brightness == Brightness.dark) {
      return DarkColors();
    } else {
      return LightColors();
    }
  }

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
