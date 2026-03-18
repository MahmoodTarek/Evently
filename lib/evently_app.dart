import 'package:evently/provider/language_provider.dart';
import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).currentLanguage),
      routes: {AppRoutes.home: (context) => const Home()},
    );
  }
}
