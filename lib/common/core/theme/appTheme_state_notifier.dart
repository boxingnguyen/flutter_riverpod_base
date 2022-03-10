import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/common/core/theme/appTheme_state.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeStateNotifier, AppThemeState>(
        (_) => AppThemeStateNotifier());

class AppThemeStateNotifier extends StateNotifier<AppThemeState> {
  AppThemeStateNotifier() : super(AppThemeState());

  final _darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: AppColors.white),
  );

  final _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: AppColors.black),
  );

  void toggleAppTheme() {
    state = state.onDarkMode == true
        ? state.copyWith(onDarkMode: false, appTheme: _lightTheme)
        : state.copyWith(onDarkMode: true, appTheme: _darkTheme);
  }
}
