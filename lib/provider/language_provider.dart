import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  void changeLanguage({required String newLanguage}) {
    if (newLanguage == currentLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}