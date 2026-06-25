import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';

class AppPickers {
  static Future<DateTime?> onChooseDate({
    required BuildContext context,
    required DateTime? selectedDate,
  }) {
    final now = DateTime.now();

    final firstDate = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final initialDate =
    selectedDate != null && selectedDate.isBefore(firstDate)
        ? firstDate
        : selectedDate ?? firstDate;

    return showDatePicker(
      context: context,
      locale: Locale(
        Localizations
            .localeOf(context)
            .languageCode,
      ),
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: firstDate.add(
        const Duration(days: 365),
      ),
      builder: (context, child) {
        return pickersTheme(
          context: context,
          child: child!,
        );
      },
    );
  }


  static Future<TimeOfDay?> onChooseTime({
    required BuildContext context,
    required TimeOfDay? selectedTime,
  }) {
    return showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return pickersTheme(
          context: context,
          child: child!,
        );
      },
    );
  }

  static Widget pickersTheme({
    required BuildContext context,
    required Widget child,
  }) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: context.colors.mainColor,
          onPrimary: Colors.white,
          secondary: context.colors.mainColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: context.colors.background,
          onSurface: context.colors.mainText,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: context.colors.background,
        ),
      ),
      child: child,
    );
  }
}