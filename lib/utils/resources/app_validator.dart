import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

final class AppValidator {
  AppValidator._();

  static final RegExp _emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');

  static String? validateEmail(String? value) {
    final email = value?.trim();

    if (email == null || email.isEmpty) {
      return "";
    }

    if (!_emailRegex.hasMatch(email)) {
      return "";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final password = value?.trim();
    if (password == null || password.isEmpty) {
      return "";
    }

    if (password.length < 8) {
      return "";
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    final confirmPassword = value?.trim();

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "";
    }

    if (confirmPassword != password.trim()) {
      return "";
    }

    return null;
  }

  static String? validateName(String? value) {
    final name = value?.trim();
    if (name == null || name.isEmpty) {
      return "";
    } else if (name.length < 3) {
      return "";
    } else if (name.length > 20) {
      return "";
    } else if (name.contains(RegExp(r'[0-9]'))) {
      return "";
    } else if (name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    final phone = value?.trim();
    if (phone == null || phone.isEmpty) {
      return "";
    }
    if (!RegExp(r'^[0-9]{11}$').hasMatch(phone)) {
      return "";
    }
    return null;
  }

  static String? validateTitle({String? value, required BuildContext context}) {
    final localization = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return localization.event_title_required_error;
    }

    if (value.trim().length < 3) {
      return localization.event_title_length_error;
    }

    if (value.trim().length > 50) {
      return localization.event_title_max_length_error;
    }

    final specialCharacters = RegExp(
      r'[!@#\$%\^&\*\(\)_\+\=\[\]\{\}\\\|;:"<>\/~`]',
    );

    if (specialCharacters.hasMatch(value)) {
      return localization.event_title_special_char_error;
    }

    return null;
  }
}
