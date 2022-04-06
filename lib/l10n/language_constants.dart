import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageValue {
  static const String languageCode = 'languageCode';
  static const String english = 'en';
  static const String vietnam = 'vi';
  static const String japan = 'ja';
}

Locale localeWithLanguageCode(String languageCode) {
  switch (languageCode) {
    case LanguageValue.japan:
      return const Locale(LanguageValue.japan);
    case LanguageValue.vietnam:
      return const Locale(LanguageValue.vietnam);
    default:
      return const Locale(LanguageValue.english);
  }
}

Future<Locale?> saveLocale(String languageCode) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(LanguageValue.languageCode, languageCode);
  return localeWithLanguageCode(languageCode);
}

Future<String?> getLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString(LanguageValue.languageCode);
  if (languageCode != null) {
    return languageCode;
  }
  final myLocale = window.locale;
  final localeSupport = localeWithLanguageCode(_convertLanguageCode(myLocale)!);
  if (localeSupport.countryCode != null) {
    return '${localeSupport.languageCode}_${localeSupport.countryCode}';
  }
  return localeSupport.languageCode;
}

String? _convertLanguageCode(Locale locale) {
  return locale.languageCode;
}
