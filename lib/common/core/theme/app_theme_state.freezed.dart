// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppThemeStateTearOff {
  const _$AppThemeStateTearOff();

  _AppThemeState call({bool onDarkMode = false, ThemeData? appTheme}) {
    return _AppThemeState(
      onDarkMode: onDarkMode,
      appTheme: appTheme,
    );
  }
}

/// @nodoc
const $AppThemeState = _$AppThemeStateTearOff();

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
      _$AppThemeStateCopyWithImpl<$Res>;
  $Res call({bool onDarkMode, ThemeData? appTheme});
}

/// @nodoc
class _$AppThemeStateCopyWithImpl<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  _$AppThemeStateCopyWithImpl(this._value, this._then);

  final AppThemeState _value;
  // ignore: unused_field
  final $Res Function(AppThemeState) _then;

  @override
  $Res call({
    Object? onDarkMode = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_value.copyWith(
      onDarkMode: onDarkMode == freezed
          ? _value.onDarkMode
          : onDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: appTheme == freezed
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc
abstract class _$AppThemeStateCopyWith<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  factory _$AppThemeStateCopyWith(
          _AppThemeState value, $Res Function(_AppThemeState) then) =
      __$AppThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool onDarkMode, ThemeData? appTheme});
}

/// @nodoc
class __$AppThemeStateCopyWithImpl<$Res>
    extends _$AppThemeStateCopyWithImpl<$Res>
    implements _$AppThemeStateCopyWith<$Res> {
  __$AppThemeStateCopyWithImpl(
      _AppThemeState _value, $Res Function(_AppThemeState) _then)
      : super(_value, (v) => _then(v as _AppThemeState));

  @override
  _AppThemeState get _value => super._value as _AppThemeState;

  @override
  $Res call({
    Object? onDarkMode = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_AppThemeState(
      onDarkMode: onDarkMode == freezed
          ? _value.onDarkMode
          : onDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: appTheme == freezed
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc

class _$_AppThemeState implements _AppThemeState {
  _$_AppThemeState({this.onDarkMode = false, this.appTheme});

  @JsonKey()
  @override
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
            other is _AppThemeState &&
            const DeepCollectionEquality()
                .equals(other.onDarkMode, onDarkMode) &&
            const DeepCollectionEquality().equals(other.appTheme, appTheme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(onDarkMode),
      const DeepCollectionEquality().hash(appTheme));

  @JsonKey(ignore: true)
  @override
  _$AppThemeStateCopyWith<_AppThemeState> get copyWith =>
      __$AppThemeStateCopyWithImpl<_AppThemeState>(this, _$identity);
}

abstract class _AppThemeState implements AppThemeState {
  factory _AppThemeState({bool onDarkMode, ThemeData? appTheme}) =
      _$_AppThemeState;

  @override
  bool get onDarkMode;
  @override
  ThemeData? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$AppThemeStateCopyWith<_AppThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
