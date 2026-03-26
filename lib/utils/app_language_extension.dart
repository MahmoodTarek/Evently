import 'package:evently/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppLanguageExtension on BuildContext {
  LanguageProvider get lang => read<LanguageProvider>();

  bool get isArabic => lang.isArabic();

  void toggleLanguage() =>
      lang.changeLanguage(lang.isArabic() ? Language.en : Language.ar);
}
