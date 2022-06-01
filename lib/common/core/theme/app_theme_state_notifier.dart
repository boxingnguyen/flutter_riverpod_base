import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/data/local_storage.dart';
import 'package:provider_base/common/core/theme/app_theme.dart';
import 'package:provider_base/common/core/theme/app_theme_state.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeStateNotifier, AppThemeState>(
        (ref) => AppThemeStateNotifier(ref));

class AppThemeStateNotifier extends StateNotifier<AppThemeState> {
  AppThemeStateNotifier(this.ref)
      : super(AppThemeState(
            appTheme:
                AppTheme(locale: ref.watch(localeProvider).locale).lightTheme));
  final Ref ref;

  void toggleAppTheme() {
    final appTheme = AppTheme(locale: ref.read(localeProvider).locale);

    state = state.onDarkMode == true
        ? state.copyWith(onDarkMode: false, appTheme: appTheme.lightTheme)
        : state.copyWith(onDarkMode: true, appTheme: appTheme.darkTheme);

    LocalStorage.setOnDarkMode(state.onDarkMode);
  }
}
