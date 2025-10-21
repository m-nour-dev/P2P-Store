import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: TextStyle(color: AppColors.text, fontSize: 20),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.text),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondry,
      tertiary: Colors.black,
      onTertiary: Colors.white,
      onPrimaryContainer: AppColors.myPrimaryContainer,
      error: AppColors.error,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkModeBackground,
      titleTextStyle: TextStyle(color: AppColors.darkModeText, fontSize: 20),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.darkModeText),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondry,
      tertiary: Colors.white,
      onTertiary: AppColors.myDarkPrimaryContainer,
      onPrimaryContainer: AppColors.myDarkPrimaryContainer,
      error: AppColors.error,
    ),
  );
}
