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

  static TextStyle regular14() =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle medium16() =>
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle semiBold20() =>
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);


}
