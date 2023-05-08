// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {UserDetail? userDetail,
      bool isSignUp,
      bool forgotPasswordSuccess,
      bool showLoadingIndicator,
      int numberShowCaptcha,
      bool isCaptcha});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetail = freezed,
    Object? isSignUp = null,
    Object? forgotPasswordSuccess = null,
    Object? showLoadingIndicator = null,
    Object? numberShowCaptcha = null,
    Object? isCaptcha = null,
  }) {
    return _then(_value.copyWith(
      userDetail: freezed == userDetail
          ? _value.userDetail
          : userDetail // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      isSignUp: null == isSignUp
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordSuccess: null == forgotPasswordSuccess
          ? _value.forgotPasswordSuccess
          : forgotPasswordSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      numberShowCaptcha: null == numberShowCaptcha
          ? _value.numberShowCaptcha
          : numberShowCaptcha // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptcha: null == isCaptcha
          ? _value.isCaptcha
          : isCaptcha // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserDetail? userDetail,
      bool isSignUp,
      bool forgotPasswordSuccess,
      bool showLoadingIndicator,
      int numberShowCaptcha,
      bool isCaptcha});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetail = freezed,
    Object? isSignUp = null,
    Object? forgotPasswordSuccess = null,
    Object? showLoadingIndicator = null,
    Object? numberShowCaptcha = null,
    Object? isCaptcha = null,
  }) {
    return _then(_$_LoginState(
      userDetail: freezed == userDetail
          ? _value.userDetail
          : userDetail // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      isSignUp: null == isSignUp
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordSuccess: null == forgotPasswordSuccess
          ? _value.forgotPasswordSuccess
          : forgotPasswordSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      numberShowCaptcha: null == numberShowCaptcha
          ? _value.numberShowCaptcha
          : numberShowCaptcha // ignore: cast_nullable_to_non_nullable
              as int,
      isCaptcha: null == isCaptcha
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
  @override
  @JsonKey()
  final bool isSignUp;
  @override
  @JsonKey()
  final bool forgotPasswordSuccess;
  @override
  @JsonKey()
  final bool showLoadingIndicator;
  @override
  @JsonKey()
  final int numberShowCaptcha;
  @override
  @JsonKey()
  final bool isCaptcha;

  @override
  String toString() {
    return 'LoginState(userDetail: $userDetail, isSignUp: $isSignUp, forgotPasswordSuccess: $forgotPasswordSuccess, showLoadingIndicator: $showLoadingIndicator, numberShowCaptcha: $numberShowCaptcha, isCaptcha: $isCaptcha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.userDetail, userDetail) ||
                other.userDetail == userDetail) &&
            (identical(other.isSignUp, isSignUp) ||
                other.isSignUp == isSignUp) &&
            (identical(other.forgotPasswordSuccess, forgotPasswordSuccess) ||
                other.forgotPasswordSuccess == forgotPasswordSuccess) &&
            (identical(other.showLoadingIndicator, showLoadingIndicator) ||
                other.showLoadingIndicator == showLoadingIndicator) &&
            (identical(other.numberShowCaptcha, numberShowCaptcha) ||
                other.numberShowCaptcha == numberShowCaptcha) &&
            (identical(other.isCaptcha, isCaptcha) ||
                other.isCaptcha == isCaptcha));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userDetail,
      isSignUp,
      forgotPasswordSuccess,
      showLoadingIndicator,
      numberShowCaptcha,
      isCaptcha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final UserDetail? userDetail,
      final bool isSignUp,
      final bool forgotPasswordSuccess,
      final bool showLoadingIndicator,
      final int numberShowCaptcha,
      final bool isCaptcha}) = _$_LoginState;

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
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
