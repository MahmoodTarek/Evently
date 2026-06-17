import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static Future<void> show({
    required BuildContext context,
    required String message,
  }) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: context.colors.mainColor,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
