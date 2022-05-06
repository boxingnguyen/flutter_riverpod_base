import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider_base/screens/locale/locale_state.dart';

final localeProvider = StateNotifierProvider<LocaleStateNotifier, LocaleState>(
    (_) => LocaleStateNotifier());

enum SupportLanguageType { en, ja, vi }

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  LocaleStateNotifier() : super(const LocaleState());

  void setLocale(SupportLanguageType languageType) {
    state = state.copyWith(locale: getLocale(languageType));
  }

  Locale getLocale(SupportLanguageType languageType) {
    return Locale(languageType.name);
  }

  void changeLocale(BuildContext context, SupportLanguageType languageType) {
    final currentLanguageType =
        SupportLanguageType.values.byName(Intl.getCurrentLocale());

    if (currentLanguageType == languageType) {
      return;
    }
    state = state.copyWith(locale: getLocale(languageType));
    Navigator.of(context).pop();
  }
}
