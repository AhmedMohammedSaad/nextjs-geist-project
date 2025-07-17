import 'package:flutter/material.dart';

class PRTECTheme {
  static const Color primaryColor = Color.fromARGB(255, 20, 0, 41);
  static const Color accentColor = Color(0xFF8B5CF6);
  static const Color neonBlue = Color(0xFF00D4FF);
  static const Color lightViolet = Color(0xFFA855F7);
  static const Color textColor = Colors.white;
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color cardColor = Color.fromARGB(255, 30, 0, 61);
  static const Color surfaceColor = Color.fromARGB(255, 25, 0, 51);

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        colorScheme: const ColorScheme.dark(
          primary: accentColor,
          secondary: neonBlue,
          surface: surfaceColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: textColor,
            letterSpacing: -1,
          ),
          displayMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: textColor,
            letterSpacing: -0.5,
          ),
          headlineLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: textSecondary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            shadowColor: accentColor.withOpacity(0.5),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: neonBlue, width: 2),
            foregroundColor: neonBlue,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: cardColor,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: accentColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: accentColor.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: neonBlue, width: 2),
          ),
        ),
      );
}
