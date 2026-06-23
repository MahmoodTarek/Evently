import 'package:evently/app_launch_service.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isFirstLaunch = await AppLaunchService.isFirstLaunch();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => EventsProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: EventlyApp(isFirstLaunch: isFirstLaunch),
    ),
  );
}
