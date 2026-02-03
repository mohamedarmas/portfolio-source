import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF0B0B0B);
  static const Color white = Color(0xFFFDFDFD);
  static const Color surface = Color(0xFFF7F7F7);
  static const Color border = Color(0xFFE1E1E1);
  static const Color muted = Color(0xFF9B9B9B);
  static const Color subtle = Color(0xFFBEBEBE);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color charcoal = Color(0xFF2C2C2C);
}

class AppMotion {
  static const Duration fast = Duration(milliseconds: 180);
  static const Duration medium = Duration(milliseconds: 360);
  static const Duration slow = Duration(milliseconds: 700);

  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve gentle = Curves.easeOut;
}

class AppSpacing {
  static const double sectionY = 96;
  static const double sectionYCompact = 64;
  static const double contentX = 24;
  static const double gap = 16;
  static const double radius = 16;
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'GoogleSans',
  );

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.light(
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.charcoal,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.ink,
      background: AppColors.white,
      onBackground: AppColors.ink,
      outline: AppColors.border,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: base.textTheme.copyWith(
      headlineLarge: base.textTheme.headlineLarge?.copyWith(
        fontSize: 44,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        letterSpacing: -0.5,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontSize: 18,
        height: 1.6,
        color: AppColors.subtle,
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        height: 1.6,
        color: AppColors.ink,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? AppColors.subtle
              : AppColors.white,
        ),
        foregroundColor: MaterialStateProperty.all(AppColors.black),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(
          AppColors.black.withOpacity(0.08),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        ),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        side: MaterialStateProperty.all(
          const BorderSide(color: AppColors.subtle),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        overlayColor: MaterialStateProperty.all(
          AppColors.white.withOpacity(0.08),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white.withOpacity(0.05),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: AppColors.subtle),
    ),
  );
}
