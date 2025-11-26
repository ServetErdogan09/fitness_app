import 'package:flutter/material.dart';

class AppColors {
  // Ana renk
  static const Color primary = Color(0xFF13EC49); // HTML: #13ec49

  // Arka planlar
  static const Color backgroundLight = Color(0xFFF6F8F6); // HTML: #f6f8f6
  static const Color backgroundDark = Color(0xFF102215); // HTML: #102215

  static const Color red400 = Color(0xFFD32F2F);

  // Kartlar
  static const Color cardLight = Color(0xFFFFFFFF); // HTML: #FFFFFF
  static const Color cardDark = Color(0xFF2C2C44);

  // Metin renkleri
  static const Color textLight = Color(0xFF000000); // Siyah metin
  static const Color textDark = Color(0xFFFFFFFF); // Beyaz metin
  static const Color textSecondaryLight = Color(0xFF666666); // HTML: #666666
  static const Color textSecondaryDark = Color(0xFFA0A0B4); // HTML: #A0A0B4

  // Accent renkler
  static const Color accentGreen = Color(0xFF7ED321); // HTML: #7ED321
  static const Color accentRed = Color(0xFFF5A623); // HTML: #F5A623

  // Opak beyazlar
  static const Color white70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color white60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.1);

  // Koyu container
  static const Color darkContainer = Color(0xFF102215); // HTML: #102215
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
