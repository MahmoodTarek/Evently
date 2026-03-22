import 'package:evently/evently_app.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: EventlyApp(),
    ),
  );
}
