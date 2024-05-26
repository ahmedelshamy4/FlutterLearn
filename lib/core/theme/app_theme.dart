import 'package:flutter/material.dart';
import 'package:flutter_learn/core/theme/colors.dart';

class AppTheme {
  final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
    ),
  );
}
