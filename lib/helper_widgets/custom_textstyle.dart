import 'package:flutter/material.dart';
import 'package:final_site/theme/app_theme.dart';

class CustomTextStyle {
  static const String fontFamily = 'GoogleSans';

  static TextStyle headlineblack({
    Color color = AppColors.black,
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle headlinewhite({
    Color color = AppColors.white,
    double fontSize = 42,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle bodyTextBlack({
    Color color = AppColors.black,
    double fontSize = 30,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle bodyTextWhite({
    Color color = AppColors.white,
    double fontSize = 30,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle buttonTextWhite({
    Color color = AppColors.white,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
  static TextStyle buttonTextBlack({
    Color color = AppColors.black,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
  static TextStyle appBarTextWhite({
    Color color = AppColors.white,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  
}
