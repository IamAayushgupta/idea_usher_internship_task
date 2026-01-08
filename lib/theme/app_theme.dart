import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.orange,
      surface: Colors.white,
    ),
    useMaterial3: true,
    fontFamily: 'Roboto', // Default flutter font, can be changed
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.orange,
      surface: Color(0xFF1E1E1E), // Dark grey for cards
    ),
    useMaterial3: true,
    fontFamily: 'Roboto',
  );
}
