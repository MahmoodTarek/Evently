import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle bottomNavigationBar(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: context.colors.disable,
    );
  }

  static TextStyle semiBold14({required BuildContext context}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: context.colors.mainColor,
      );

  static TextStyle regular14({required BuildContext context}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.colors.mainColor,
      );

  static TextStyle regular16({required BuildContext context}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: context.colors.secText,
      );

  static TextStyle medium16() =>
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle medium18MainColor({required BuildContext context}) =>
      GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: context.colors.mainColor,
      );

  static TextStyle medium20({required BuildContext context}) =>
      GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: context.colors.inputs,
      );

  static TextStyle semiBold20() =>
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);


}
