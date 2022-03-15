import 'package:flutter/material.dart';
import 'package:provider_base/common/core/constants.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.blackBg,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: AppColors.white),
    cardColor: AppColors.blackCard,
    shadowColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackBg,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: AppColors.black),
    cardColor: AppColors.grey3,
    shadowColor: AppColors.grey6,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
      ),
    ),
  );
}
