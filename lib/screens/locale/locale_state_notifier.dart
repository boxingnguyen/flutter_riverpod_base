import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/l10n/language_constants.dart';
import 'package:provider_base/screens/locale/locale_state.dart';

final localeProvider = StateNotifierProvider<LocaleStateNotifier, LocaleState>(
    (_) => LocaleStateNotifier());

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  LocaleStateNotifier() : super(const LocaleState());

  Future<void> setLocale(String languageCode) async {
    state = state.copyWith(locale: localeWithLanguageCode(languageCode));
  }
}
