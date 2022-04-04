import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_state.freezed.dart';

@freezed
class AppThemeState with _$AppThemeState {
  factory AppThemeState(
      {@Default(false) bool onDarkMode, ThemeData? appTheme}) = _AppThemeState;
}
