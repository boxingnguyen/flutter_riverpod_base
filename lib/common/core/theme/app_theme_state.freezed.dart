// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppThemeState {
  bool get onDarkMode => throw _privateConstructorUsedError;
  ThemeData? get appTheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppThemeStateCopyWith<AppThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeStateCopyWith<$Res> {
  factory $AppThemeStateCopyWith(
          AppThemeState value, $Res Function(AppThemeState) then) =
      _$AppThemeStateCopyWithImpl<$Res, AppThemeState>;
  @useResult
  $Res call({bool onDarkMode, ThemeData? appTheme});
}

/// @nodoc
class _$AppThemeStateCopyWithImpl<$Res, $Val extends AppThemeState>
    implements $AppThemeStateCopyWith<$Res> {
  _$AppThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onDarkMode = null,
    Object? appTheme = freezed,
  }) {
    return _then(_value.copyWith(
      onDarkMode: null == onDarkMode
          ? _value.onDarkMode
          : onDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppThemeStateCopyWith<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  factory _$$_AppThemeStateCopyWith(
          _$_AppThemeState value, $Res Function(_$_AppThemeState) then) =
      __$$_AppThemeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool onDarkMode, ThemeData? appTheme});
}

/// @nodoc
class __$$_AppThemeStateCopyWithImpl<$Res>
    extends _$AppThemeStateCopyWithImpl<$Res, _$_AppThemeState>
    implements _$$_AppThemeStateCopyWith<$Res> {
  __$$_AppThemeStateCopyWithImpl(
      _$_AppThemeState _value, $Res Function(_$_AppThemeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onDarkMode = null,
    Object? appTheme = freezed,
  }) {
    return _then(_$_AppThemeState(
      onDarkMode: null == onDarkMode
          ? _value.onDarkMode
          : onDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc

class _$_AppThemeState implements _AppThemeState {
  _$_AppThemeState({this.onDarkMode = false, this.appTheme});

  @override
  @JsonKey()
  final bool onDarkMode;
  @override
  final ThemeData? appTheme;

  @override
  String toString() {
    return 'AppThemeState(onDarkMode: $onDarkMode, appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppThemeState &&
            (identical(other.onDarkMode, onDarkMode) ||
                other.onDarkMode == onDarkMode) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onDarkMode, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppThemeStateCopyWith<_$_AppThemeState> get copyWith =>
      __$$_AppThemeStateCopyWithImpl<_$_AppThemeState>(this, _$identity);
}

abstract class _AppThemeState implements AppThemeState {
  factory _AppThemeState({final bool onDarkMode, final ThemeData? appTheme}) =
      _$_AppThemeState;

  @override
  bool get onDarkMode;
  @override
  ThemeData? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$_AppThemeStateCopyWith<_$_AppThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
