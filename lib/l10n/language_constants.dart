import 'dart:ui';

class LanguageValue {
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
