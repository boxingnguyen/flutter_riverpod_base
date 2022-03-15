import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/theme/theme.dart';
import 'package:provider_base/common/core/theme/appTheme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeStateNotifier, AppThemeState>(
        (_) => AppThemeStateNotifier());

class AppThemeStateNotifier extends StateNotifier<AppThemeState> {
  AppThemeStateNotifier()
      : super(AppThemeState(appTheme: AppThemes.lightTheme));

  Future<void> toggleAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    state = state.onDarkMode == true
        ? state.copyWith(onDarkMode: false, appTheme: AppThemes.lightTheme)
        : state.copyWith(onDarkMode: true, appTheme: AppThemes.darkTheme);
    prefs.setBool('onDarkMode', state.onDarkMode);
  }

  Future<bool?> getCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onDarkMode') ?? false;
  }
}
