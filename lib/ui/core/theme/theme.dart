import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF4B0082);
  static const Color secondaryColor = Color(0xFF800080);
  static const Color backgroundColor = Color(0xFF131418);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFFF4040);

  static ThemeData get themeData => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: _createMaterialColor(primaryColor),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: textColor, fontSize: 16),
          labelLarge: TextStyle(color: textColor, fontSize: 14),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: backgroundColor.withOpacity(0.2),
          labelStyle: const TextStyle(color: textColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: textColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
        ),
      );

  // Função auxiliar para criar MaterialColor a partir de uma cor
  static MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
