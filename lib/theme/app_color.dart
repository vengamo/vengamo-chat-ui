import 'package:flutter/material.dart';

class AppColors {
  /// App primary color, Green
  static const primarycolor = Color(0xFF2BCA72);
  /// App color that will be aplied in dark theme
  static const darkModeBackgroundColor = Color(0xFF1D1B2E);
  /// App color that will be aplied in light theme
  static const darkLightBackgroundColor = Color(0xFF343142);
  /// White color
  static const white = Color(0xFFFFFFFF);
  /// App secondary green color
  static const softGreenColor = Color(0xFFDBF8C6);
  /// App color that will be aplied in chat background
  static const backgroundColor = Color(0xFFECE5DD);
  /// App icon colors
  static const iconColor = Color(0xFF6A6E71);
  /// App secondary black Color
  static const softBlackcolor = Color(0x99000000);

  static Color getbGColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkModeBackgroundColor
        : white;
  }
}
