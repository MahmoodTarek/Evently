import 'package:flutter/material.dart';

class CustomDialog {
  static void showLoading({
    required BuildContext context,
    required String message,
    TextStyle? textStyle,
    Color? indicatorColor,
    Color? backgroundColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: indicatorColor,
                  backgroundColor: backgroundColor,
                ),
                const SizedBox(height: 16),
                Text(message, style: textStyle),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
