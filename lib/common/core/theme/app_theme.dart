import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';

class AppTheme {
  Locale locale;
  get lightTheme => _themeData();
  get darkTheme => _themeData(isLightMode: false);

  AppTheme({required this.locale}) : super();

  ThemeData _themeData({bool isLightMode = true}) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: border,
        focusedBorder: border,
      ),
      textTheme: _getTextThemeByLocale(locale),
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
        titleTextStyle:
            AppStyles.textBold.copyWith(fontSize: AppStyles.fontSizeH),
      ),
    );
  }

  // for example change text theme whole app by locale
  TextTheme? _getTextThemeByLocale(Locale localeState) {
    final languageCode = locale.languageCode;

    switch (languageCode) {
      case Constants.jaLanguageJa:
        return GoogleFonts.notoSansTextTheme();
      case Constants.viLanguageCode:
        return GoogleFonts.ubuntuTextTheme();
      default:
        return GoogleFonts.robotoTextTheme();
    }
  }
}

final border = OutlineInputBorder(
  borderSide: const BorderSide(color: AppStyles.bgDarkModeColor),
  borderRadius: BorderRadius.circular(15),
);
