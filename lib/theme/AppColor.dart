// themes/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const primarycolor = Color(0xFF2BCA72);
  static const darkModeBackgroundColor = Color(0xFF1D1B2E);
  static const darkLightBackgroundColor = Color(0xFF343142);
  static const white = Color(0xFFFFFFFF);
  static const softGreenColor = Color(0xFFDBF8C6);
  static const backgroundColor = Color(0xFFECE5DD);
  static const iconColor = Color(0xFF6A6E71);

  static Color getbGColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkModeBackgroundColor
        : white;
  }
}
