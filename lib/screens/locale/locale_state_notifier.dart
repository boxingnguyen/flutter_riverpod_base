import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/l10n/language_constants.dart';
import 'package:provider_base/screens/locale/locale_state.dart';

final localeProvider = StateNotifierProvider<LocaleStateNotifier, LocaleState>(
    (_) => LocaleStateNotifier());

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  LocaleStateNotifier() : super(const LocaleState());

  @override
  void initState() {
    _getCurrentLocale();
  }

  Future<void> setLocale(String languageCode) async {
    final locale = await saveLocale(languageCode);
    state = state.copyWith(
        locale: locale ?? localeWithLanguageCode(LanguageValue.english));
  }

  Future<void> _getCurrentLocale() async {
    final currentLocale = await getLocale();
    state = state.copyWith(
        locale: localeWithLanguageCode(currentLocale ?? LanguageValue.english));
  }
}
