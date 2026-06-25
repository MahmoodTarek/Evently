import 'package:evently/app_launch_service.dart';
import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isFirstLaunch = await AppLaunchService.isFirstLaunch();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final userProvider = UserProvider();

  final firebaseUser = FirebaseAuth.instance.currentUser;
  final isLoggedIn = firebaseUser != null;

  if (isLoggedIn) {
    final user = await FirebaseUtils.getUserFromFirebase(
      firebaseUser!.uid,
    );

    userProvider.setCurrentUser(user: user!);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider.value(value: userProvider),
      ],
      child: EventlyApp(
        isFirstLaunch: isFirstLaunch,
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}