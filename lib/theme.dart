import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 24.0),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffDF6B92),
    onPrimary: Color(0xff2D3142),
    secondary: Color(0xff70C1B3),
    onSecondary: Color(0xff353535),
    error: Colors.red,
    onError: Colors.white70,
    background: Color(0xffEADEDA),
    onBackground: Colors.black87,
    surface: Color(0xffc5c5c5),
    onSurface: Color(0xff2D3142),
  ),
  fontFamily: 'Open Sans',
  iconTheme: const IconThemeData(size: 18.0),
  appBarTheme: const AppBarTheme(
// backgroundColor: Colors.pink.shade300,
    backgroundColor: Color(0xFFF06292),
    titleTextStyle: TextStyle(
      fontFamily: 'Caveat',
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: Colors.white70,
    ),
  ),
);
