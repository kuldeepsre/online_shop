import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  // Light mode colors
  static const Color lightPrimaryColor = Color(0xFF007bff);
  static const Color lightSecondaryColor = Color(0xFF6c757d);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightTextColor = Color(0xFF000000);
  static const Color lightAccentColor = Color(0xFFFFC107);

  // Dark mode colors
  static const Color darkPrimaryColor = Color(0xFF2196f3);
  static const Color darkSecondaryColor = Color(0xFF424242);
  static const Color darkBackgroundColor = Color(0xFF303030);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkAccentColor = Color(0xFFFFC107);

  // Define a function to get theme based on brightness
  static ThemeData getTheme({Brightness? brightness}) {
    return ThemeData(
      primaryColor: brightness == Brightness.light ? lightPrimaryColor : darkPrimaryColor,
      scaffoldBackgroundColor: brightness == Brightness.light ? lightBackgroundColor : darkBackgroundColor,
      brightness: brightness, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: brightness == Brightness.light ? lightAccentColor : darkAccentColor),
      // You can customize more theme properties here
      // For example: textTheme, appBarTheme, etc.
    );
  }
}