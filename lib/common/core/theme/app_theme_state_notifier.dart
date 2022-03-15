import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/data/local_storage.dart';
import 'package:provider_base/common/core/theme/app_theme.dart';
import 'package:provider_base/common/core/theme/app_theme_state.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeStateNotifier, AppThemeState>(
        (_) => AppThemeStateNotifier());

class AppThemeStateNotifier extends StateNotifier<AppThemeState> {
  AppThemeStateNotifier() : super(AppThemeState(appTheme: AppTheme.lightTheme));

  void toggleAppTheme() {
    state = state.onDarkMode == true
        ? state.copyWith(onDarkMode: false, appTheme: AppTheme.lightTheme)
        : state.copyWith(onDarkMode: true, appTheme: AppTheme.darkTheme);
    LocalStorage.setOnDarkMode(state.onDarkMode);
  }
}
