import 'package:flutter/material.dart';

class ApplicationTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.deepPurple,
    ),
    inputDecorationTheme: _generateInputDecorationTheme(),
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.deepPurple,
    ),
    inputDecorationTheme: _generateInputDecorationTheme(),
    useMaterial3: true,
  );

  static InputDecorationTheme _generateInputDecorationTheme() {
    return const InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide.none),
      filled: true,
    );
  }
}
