import 'package:evently/ui/widgets/custom_dialog.dart';
import 'package:evently/ui/widgets/toast_message.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    CustomDialog.showLoading(
      context: context,
      message: message,
      textStyle: AppStyles.semiBold14(context: context),
      indicatorColor: context.colors.mainColor,
      backgroundColor: context.colors.inputs,
    );
  }

  static Future<bool> createNewAccountEmailAndPw({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showLoading(context: context, message: 'Loading');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException {
      CustomDialog.hideLoading(context);
      ToastMessage.show(context: context, message: 'Failed to create account');
      return false;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> loginEmailAndPw({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showLoading(context: context, message: 'Loading');

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomDialog.hideLoading(context);
      return true;
    } on FirebaseAuthException {
      CustomDialog.hideLoading(context);
      ToastMessage.show(context: context, message: 'Failed to login');
      return false;
    } catch (_) {
      return false;
    }
  }
}
