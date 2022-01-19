// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'env_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EnvStateTearOff {
  const _$EnvStateTearOff();

  _EnvState call(
      {required String baseUrlApi,
      required String baseUrlS3,
      required String termsOfServiceUrl,
      required String paymentToken}) {
    return _EnvState(
      baseUrlApi: baseUrlApi,
      baseUrlS3: baseUrlS3,
      termsOfServiceUrl: termsOfServiceUrl,
      paymentToken: paymentToken,
    );
  }
}

/// @nodoc
const $EnvState = _$EnvStateTearOff();

/// @nodoc
mixin _$EnvState {
  String get baseUrlApi => throw _privateConstructorUsedError;
  String get baseUrlS3 => throw _privateConstructorUsedError;
  String get termsOfServiceUrl => throw _privateConstructorUsedError;
  String get paymentToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvStateCopyWith<EnvState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvStateCopyWith<$Res> {
  factory $EnvStateCopyWith(EnvState value, $Res Function(EnvState) then) =
      _$EnvStateCopyWithImpl<$Res>;
  $Res call(
      {String baseUrlApi,
      String baseUrlS3,
      String termsOfServiceUrl,
      String paymentToken});
}

/// @nodoc
class _$EnvStateCopyWithImpl<$Res> implements $EnvStateCopyWith<$Res> {
  _$EnvStateCopyWithImpl(this._value, this._then);

  final EnvState _value;
  // ignore: unused_field
  final $Res Function(EnvState) _then;

  @override
  $Res call({
    Object? baseUrlApi = freezed,
    Object? baseUrlS3 = freezed,
    Object? termsOfServiceUrl = freezed,
    Object? paymentToken = freezed,
  }) {
    return _then(_value.copyWith(
      baseUrlApi: baseUrlApi == freezed
          ? _value.baseUrlApi
          : baseUrlApi // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrlS3: baseUrlS3 == freezed
          ? _value.baseUrlS3
          : baseUrlS3 // ignore: cast_nullable_to_non_nullable
              as String,
      termsOfServiceUrl: termsOfServiceUrl == freezed
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentToken: paymentToken == freezed
          ? _value.paymentToken
          : paymentToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EnvStateCopyWith<$Res> implements $EnvStateCopyWith<$Res> {
  factory _$EnvStateCopyWith(_EnvState value, $Res Function(_EnvState) then) =
      __$EnvStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String baseUrlApi,
      String baseUrlS3,
      String termsOfServiceUrl,
      String paymentToken});
}

/// @nodoc
class __$EnvStateCopyWithImpl<$Res> extends _$EnvStateCopyWithImpl<$Res>
    implements _$EnvStateCopyWith<$Res> {
  __$EnvStateCopyWithImpl(_EnvState _value, $Res Function(_EnvState) _then)
      : super(_value, (v) => _then(v as _EnvState));

  @override
  _EnvState get _value => super._value as _EnvState;

  @override
  $Res call({
    Object? baseUrlApi = freezed,
    Object? baseUrlS3 = freezed,
    Object? termsOfServiceUrl = freezed,
    Object? paymentToken = freezed,
  }) {
    return _then(_EnvState(
      baseUrlApi: baseUrlApi == freezed
          ? _value.baseUrlApi
          : baseUrlApi // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrlS3: baseUrlS3 == freezed
          ? _value.baseUrlS3
          : baseUrlS3 // ignore: cast_nullable_to_non_nullable
              as String,
      termsOfServiceUrl: termsOfServiceUrl == freezed
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentToken: paymentToken == freezed
          ? _value.paymentToken
          : paymentToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EnvState extends _EnvState {
  const _$_EnvState(
      {required this.baseUrlApi,
      required this.baseUrlS3,
      required this.termsOfServiceUrl,
      required this.paymentToken})
      : super._();

  @override
  final String baseUrlApi;
  @override
  final String baseUrlS3;
  @override
  final String termsOfServiceUrl;
  @override
  final String paymentToken;

  @override
  String toString() {
    return 'EnvState(baseUrlApi: $baseUrlApi, baseUrlS3: $baseUrlS3, termsOfServiceUrl: $termsOfServiceUrl, paymentToken: $paymentToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnvState &&
            const DeepCollectionEquality()
                .equals(other.baseUrlApi, baseUrlApi) &&
            const DeepCollectionEquality().equals(other.baseUrlS3, baseUrlS3) &&
            const DeepCollectionEquality()
                .equals(other.termsOfServiceUrl, termsOfServiceUrl) &&
            const DeepCollectionEquality()
                .equals(other.paymentToken, paymentToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(baseUrlApi),
      const DeepCollectionEquality().hash(baseUrlS3),
      const DeepCollectionEquality().hash(termsOfServiceUrl),
      const DeepCollectionEquality().hash(paymentToken));

  @JsonKey(ignore: true)
  @override
  _$EnvStateCopyWith<_EnvState> get copyWith =>
      __$EnvStateCopyWithImpl<_EnvState>(this, _$identity);
}

abstract class _EnvState extends EnvState {
  const factory _EnvState(
      {required String baseUrlApi,
      required String baseUrlS3,
      required String termsOfServiceUrl,
      required String paymentToken}) = _$_EnvState;
  const _EnvState._() : super._();

  @override
  String get baseUrlApi;
  @override
  String get baseUrlS3;
  @override
  String get termsOfServiceUrl;
  @override
  String get paymentToken;
  @override
  @JsonKey(ignore: true)
  _$EnvStateCopyWith<_EnvState> get copyWith =>
      throw _privateConstructorUsedError;
}
