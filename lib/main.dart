import 'package:evently/evently_app.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
      child: EventlyApp(),
    ),
  );
}
