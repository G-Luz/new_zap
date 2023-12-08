import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';

class AppTheme {
  static ColorScheme colorSchemeDark = const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.lime,
    secondary: Colors.teal,
    surface: Colors.black,
    background: AppColors.secondBlue,
    error: Colors.teal,
    onBackground: Colors.teal,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.blue,
  );

  static ColorScheme colorSchemeLight = const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.lime,
    secondary: Colors.teal,
    surface: Colors.pink,
    background: AppColors.darkWhite,
    error: Colors.green,
    onBackground: Colors.lightGreenAccent,
    onError: Colors.white,
    onPrimary: Colors.lightBlueAccent,
    onSecondary: Colors.cyan,
    onSurface: Colors.blue,
  );

  static ThemeData darkThemeData = ThemeData(
    colorScheme: colorSchemeDark,
    scaffoldBackgroundColor: AppColors.darkBlue,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.green),
      bodyLarge: TextStyle(color: Colors.purple),
      bodyMedium: TextStyle(
        color: Colors.lime,
        fontSize: 25,
      ),
    ),
  );

  static final ThemeData lightThemeData = ThemeData(
    colorScheme: colorSchemeLight,
    scaffoldBackgroundColor: AppColors.darkBlue,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.green),
      bodyLarge: TextStyle(color: Colors.purple),
      bodyMedium: TextStyle(
        color: Colors.lime,
        fontSize: 25,
      ),
    ),
  );
}
