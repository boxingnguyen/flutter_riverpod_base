// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {UserDetail? userDetail,
      bool isSignUp = false,
      bool forgotPasswordSuccess = false,
      bool showLoadingIndicator = false,
      int numberShowCaptcha = 0,
      bool isCaptcha = false}) {
    return _LoginState(
      userDetail: userDetail,
      isSignUp: isSignUp,
      forgotPasswordSuccess: forgotPasswordSuccess,
      showLoadingIndicator: showLoadingIndicator,
      numberShowCaptcha: numberShowCaptcha,
      isCaptcha: isCaptcha,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  UserDetail? get userDetail => throw _privateConstructorUsedError;
  bool get isSignUp => throw _privateConstructorUsedError;
  bool get forgotPasswordSuccess => throw _privateConstructorUsedError;
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  int get numberShowCaptcha => throw _privateConstructorUsedError;
  bool get isCaptcha => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {UserDetail? userDetail,
      bool isSignUp,
      bool forgotPasswordSuccess,
      bool showLoadingIndicator,
      int numberShowCaptcha,
      bool isCaptcha});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? userDetail = freezed,
    Object? isSignUp = freezed,
    Object? forgotPasswordSuccess = freezed,
    Object? showLoadingIndicator = freezed,
    Object? numberShowCaptcha = freezed,
    Object? isCaptcha = freezed,
  }) {
    return _then(_value.copyWith(
      userDetail: userDetail == freezed
          ? _value.userDetail
          : userDetail // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      isSignUp: isSignUp == freezed
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordSuccess: forgotPasswordSuccess == freezed
          ? _value.forgotPasswordSuccess
          : forgotPasswordSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      numberShowCaptcha: numberShowCaptcha == freezed
          ? _value.numberShowCaptcha
          : numberShowCaptcha // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptcha: isCaptcha == freezed
          ? _value.isCaptcha
          : isCaptcha // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserDetail? userDetail,
      bool isSignUp,
      bool forgotPasswordSuccess,
      bool showLoadingIndicator,
      int numberShowCaptcha,
      bool isCaptcha});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? userDetail = freezed,
    Object? isSignUp = freezed,
    Object? forgotPasswordSuccess = freezed,
    Object? showLoadingIndicator = freezed,
    Object? numberShowCaptcha = freezed,
    Object? isCaptcha = freezed,
  }) {
    return _then(_LoginState(
      userDetail: userDetail == freezed
          ? _value.userDetail
          : userDetail // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      isSignUp: isSignUp == freezed
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordSuccess: forgotPasswordSuccess == freezed
          ? _value.forgotPasswordSuccess
          : forgotPasswordSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      numberShowCaptcha: numberShowCaptcha == freezed
          ? _value.numberShowCaptcha
          : numberShowCaptcha // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptcha: isCaptcha == freezed
          ? _value.isCaptcha
          : isCaptcha // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  _$_LoginState(
      {this.userDetail,
      this.isSignUp = false,
      this.forgotPasswordSuccess = false,
      this.showLoadingIndicator = false,
      this.numberShowCaptcha = 0,
      this.isCaptcha = false});

  @override
  final UserDetail? userDetail;
  @JsonKey()
  @override
  final bool isSignUp;
  @JsonKey()
  @override
  final bool forgotPasswordSuccess;
  @JsonKey()
  @override
  final bool showLoadingIndicator;
  @JsonKey()
  @override
  final int numberShowCaptcha;
  @JsonKey()
  @override
  final bool isCaptcha;

  @override
  String toString() {
    return 'LoginState(userDetail: $userDetail, isSignUp: $isSignUp, forgotPasswordSuccess: $forgotPasswordSuccess, showLoadingIndicator: $showLoadingIndicator, numberShowCaptcha: $numberShowCaptcha, isCaptcha: $isCaptcha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality()
                .equals(other.userDetail, userDetail) &&
            const DeepCollectionEquality().equals(other.isSignUp, isSignUp) &&
            const DeepCollectionEquality()
                .equals(other.forgotPasswordSuccess, forgotPasswordSuccess) &&
            const DeepCollectionEquality()
                .equals(other.showLoadingIndicator, showLoadingIndicator) &&
            const DeepCollectionEquality()
                .equals(other.numberShowCaptcha, numberShowCaptcha) &&
            const DeepCollectionEquality().equals(other.isCaptcha, isCaptcha));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userDetail),
      const DeepCollectionEquality().hash(isSignUp),
      const DeepCollectionEquality().hash(forgotPasswordSuccess),
      const DeepCollectionEquality().hash(showLoadingIndicator),
      const DeepCollectionEquality().hash(numberShowCaptcha),
      const DeepCollectionEquality().hash(isCaptcha));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {UserDetail? userDetail,
      bool isSignUp,
      bool forgotPasswordSuccess,
      bool showLoadingIndicator,
      int numberShowCaptcha,
      bool isCaptcha}) = _$_LoginState;

  @override
  UserDetail? get userDetail;
  @override
  bool get isSignUp;
  @override
  bool get forgotPasswordSuccess;
  @override
  bool get showLoadingIndicator;
  @override
  int get numberShowCaptcha;
  @override
  bool get isCaptcha;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
