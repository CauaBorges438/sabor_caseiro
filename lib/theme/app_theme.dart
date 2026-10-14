import 'package:flutter/material.dart';

class AppTheme {
  static const laranja = Color(0xFFE4572E);
  static const creme = Color(0xFFFBF3E9);

  static ThemeData get tema => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: laranja),
        scaffoldBackgroundColor: creme,
        appBarTheme: const AppBarTheme(
          backgroundColor: laranja,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: laranja,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      );
}
