import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/bottom_nav/bottom_nav.dart';
import 'package:evently/ui/screens/login/login.dart';
import 'package:evently/ui/screens/on_boarding/on_boarding.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Evently',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage.name),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
      initialRoute: AppRoutes.onBoarding,
      routes: {
        AppRoutes.bottomNav: (context) => const BottomNav(),
        AppRoutes.login: (context) => const Login(),
        AppRoutes.onBoarding: (context) => const OnBoarding(),
      },
    );
  }
}
