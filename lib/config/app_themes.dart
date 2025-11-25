import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF13EC5B);
  static const Color backgroundLight = Color(0xFFF6F8F6);
  static const Color backgroundDark = Color(0xFF102216);
  static const Color white70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color white60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color green400 = Color(0xFF22C55E);
  static const Color red400 = Color(0xFFEF4444);
  static const Color darkContainer = Color(0xFF102216);
}

class AppFonts {
  static const String display = 'LexendExa';
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    fontFamily: AppFonts.display, // tüm Text widget'larının default'u
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(color: Colors.black87),
      titleSmall: TextStyle(color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.backgroundLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    fontFamily: AppFonts.display,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: AppColors.white70),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(color: AppColors.white70),
      titleSmall: TextStyle(color: AppColors.white70),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      background: AppColors.backgroundDark,
    ),
  );
}
