import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/model/user.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/widgets/custom_dialog.dart';
import 'package:evently/ui/widgets/toast_message.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showLoading(
        context: context,
        message: 'Loading',
      );

      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String userId = credential.user?.uid ?? '';

      final User user = User(
        id: userId,
        name: name,
        email: email,
      );

      await FirebaseUtils.addUserToFirebase(user: user);

      final userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );

      userProvider.setCurrentUser(user: user);

      return true;
    } on FirebaseAuthException {
      ToastMessage.show(
        context: context,
        message: 'Failed to create account',
      );
      return false;
    } catch (_) {
      ToastMessage.show(
        context: context,
        message: 'Something went wrong',
      );
      return false;
    } finally {
      CustomDialog.hideLoading(context);
    }
  }

  static Future<bool> loginEmailAndPw({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showLoading(
        context: context,
        message: 'Loading',
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String userId = userCredential.user!.uid;

      final User? user = await FirebaseUtils.getUserFromFirebase(
        userId,
      );

      if (user == null) {
        ToastMessage.show(
          context: context,
          message: 'User not found',
        );
        return false;
      }

      final userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );

      userProvider.setCurrentUser(user: user);

      return true;
    } on FirebaseAuthException {
      ToastMessage.show(
        context: context,
        message: 'Failed to login',
      );
      return false;
    } catch (_) {
      ToastMessage.show(
        context: context,
        message: 'Something went wrong',
      );
      return false;
    } finally {
      CustomDialog.hideLoading(context);
    }
  }
}