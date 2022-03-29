import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = _themeData();
  static final darkTheme = _themeData(isLightMode: false);

  static ThemeData _themeData({bool isLightMode = true}) {
    return ThemeData(
      brightness: isLightMode ? Brightness.light : Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor:
          isLightMode ? AppStyles.bgLightModeColor : AppStyles.bgDarkModeColor,
      primaryColor: AppStyles.primaryColor,
      colorScheme:
          isLightMode ? const ColorScheme.light() : const ColorScheme.dark(),
      iconTheme: IconThemeData(
        color: isLightMode
            ? AppStyles.iconLightModeColor
            : AppStyles.iconDarkModeColor,
      ),
      cardColor: isLightMode
          ? AppStyles.cardLightModeColor
          : AppStyles.cardDarkModeColor,
      shadowColor: isLightMode
          ? AppStyles.shadowLightModeColor
          : AppStyles.shadowDarkModeColor,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isLightMode ? AppStyles.primaryColor : AppStyles.secondaryColor,
        titleTextStyle: AppStyles.textBold.copyWith(
          fontSize: AppStyles.fontSizeH,
        ),
      ),
    );
  }
}
