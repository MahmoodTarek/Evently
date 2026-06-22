import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

final class AppValidator {
  AppValidator._();

  static final RegExp _emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');

  static String? validateEmail(String? value, BuildContext context) {
    final email = value?.trim();
    final appLocalizations = AppLocalizations.of(context)!;

    if (email == null || email.isEmpty) {
      return appLocalizations.email_required;
    }

    if (!_emailRegex.hasMatch(email)) {
      return appLocalizations.email_invalid;
    }

    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final password = value?.trim();

    if (password == null || password.isEmpty) {
      return appLocalizations.password_required;
    }

    if (password.length < 8) {
      return appLocalizations.password_too_short;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
    BuildContext context,
  ) {
    final appLocalizations = AppLocalizations.of(context)!;

    final confirmPassword = value?.trim();

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return appLocalizations.confirm_password_required;
    }

    if (confirmPassword != password.trim()) {
      return appLocalizations.passwords_do_not_match;
    }

    return null;
  }

  static String? validateName(String? value, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final name = value?.trim();

    if (name == null || name.isEmpty) {
      return appLocalizations.name_required;
    }

    if (name.length < 3) {
      return appLocalizations.name_too_short;
    }

    if (name.length > 20) {
      return appLocalizations.name_too_long;
    }

    if (name.contains(RegExp(r'[0-9]'))) {
      return appLocalizations.name_contains_numbers;
    }

    if (name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return appLocalizations.name_contains_special_characters;
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
