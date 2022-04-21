import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/screens/locale/change_language_screen.dart';
import 'package:provider_base/screens/locale/locale_state.dart';

final localeProvider = StateNotifierProvider<LocaleStateNotifier, LocaleState>(
    (_) => LocaleStateNotifier());

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  LocaleStateNotifier() : super(const LocaleState());

  Future<void> setLocale(LanguageValue languageValue) async {
    state = state.copyWith(locale: localeWithLanguageCode(languageValue));
  }

  Locale localeWithLanguageCode(LanguageValue languageValue) {
    switch (languageValue) {
      case LanguageValue.ja:
        return Locale(LanguageValue.ja.name);
      case LanguageValue.vi:
        return Locale(LanguageValue.vi.name);
      default:
        return Locale(LanguageValue.en.name);
    }
  }
}
