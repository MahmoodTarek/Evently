import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    String newLanguage = languageProvider.currentLanguage == 'en' ? 'ar' : 'en';
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.language)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              title: AppLocalizations.of(context)!.language,
              onPressed: () {
                languageProvider.changeLanguage(newLanguage: newLanguage);
              },
            ),

            buildButton(
              title: AppLocalizations.of(context)!.theme,
              onPressed: () {
                themeProvider.toggleTheme(
                  newThemeMode: themeProvider.currentTheme == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({required String title, required Function onPressed}) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
