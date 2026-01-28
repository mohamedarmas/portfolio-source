import 'package:flutter/material.dart';

class CustomTextStyle {
  static const String fontFamily = 'GoogleSans';

  static TextStyle headlineblack({
    Color color = const Color(0xFF000000),
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
    Color color = const Color(0xFFFFFFFF),
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
    Color color = const Color(0xFF000000),
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
    Color color = const Color(0xFFFFFFFF),
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
    Color color = const Color(0xFFFFFFFF),
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
    Color color = const Color(0xFF000000),
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
    Color color = const Color(0xFFFFFFFF),
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
