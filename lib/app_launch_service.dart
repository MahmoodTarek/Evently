import 'package:evently/utils/resources/app_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(AppPref.firstLaunch) ?? true;
  }

  static Future<void> setFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    await preference.setBool(AppPref.firstLaunch, false);
  }
}
