import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';

class AppTheme {
  static ColorScheme colorSchemeDark = const ColorScheme(
    brightness: Brightness.dark,
    background: AppColors.secondBlue,
    primary: AppColors.darkBlue,
    secondary: Colors.teal,
    surface: Colors.black,
    error: Colors.teal,
    onBackground: Colors.teal,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.blue,
  );

  static ColorScheme colorSchemeLight = const ColorScheme(
    brightness: Brightness.light,
    background: AppColors.darkWhite,
    primary: AppColors.blue,
    secondary: Colors.teal,
    surface: Colors.pink,
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
      bodySmall: TextStyle(
        color: AppColors.darkWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkWhite,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkWhite,
        fontSize: 25,
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppColors.darkWhite.withOpacity(.6),
      labelColor: AppColors.darkWhite,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      indicatorColor: AppColors.darkWhite,
    ),
  );

  static final ThemeData lightThemeData = ThemeData(
    colorScheme: colorSchemeLight,
    scaffoldBackgroundColor: AppColors.darkBlue,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkWhite,
        fontSize: 25,
      ),
      labelLarge: TextStyle(color: Colors.purple),
      labelMedium: TextStyle(color: Colors.purple),
      labelSmall: TextStyle(color: Colors.purple),
      displayLarge: TextStyle(color: Colors.purple),
      displayMedium: TextStyle(color: Colors.purple),
      displaySmall: TextStyle(color: Colors.purple),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppColors.darkBlue.withOpacity(.6),
      labelColor: AppColors.darkBlue,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      indicatorColor: AppColors.darkWhite,
    ),
  );
}
