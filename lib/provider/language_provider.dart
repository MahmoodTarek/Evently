import 'package:flutter/cupertino.dart';

enum Language { en, ar }

class LanguageProvider extends ChangeNotifier {
  Language currentLanguage = Language.en;

  bool isArabic() => currentLanguage == Language.ar;

  void changeLanguage(Language newLanguage) {
    if (newLanguage == currentLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
