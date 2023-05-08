import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.freezed.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({@Default(Locale('en')) Locale locale}) =
      _LocaleState;
}
