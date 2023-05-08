// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QrCodeState {
  String get dataQrCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrCodeStateCopyWith<QrCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodeStateCopyWith<$Res> {
  factory $QrCodeStateCopyWith(
          QrCodeState value, $Res Function(QrCodeState) then) =
      _$QrCodeStateCopyWithImpl<$Res, QrCodeState>;
  @useResult
  $Res call({String dataQrCode});
}

/// @nodoc
class _$QrCodeStateCopyWithImpl<$Res, $Val extends QrCodeState>
    implements $QrCodeStateCopyWith<$Res> {
  _$QrCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataQrCode = null,
  }) {
    return _then(_value.copyWith(
      dataQrCode: null == dataQrCode
          ? _value.dataQrCode
          : dataQrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QrCodeStateCopyWith<$Res>
    implements $QrCodeStateCopyWith<$Res> {
  factory _$$_QrCodeStateCopyWith(
          _$_QrCodeState value, $Res Function(_$_QrCodeState) then) =
      __$$_QrCodeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dataQrCode});
}

/// @nodoc
class __$$_QrCodeStateCopyWithImpl<$Res>
    extends _$QrCodeStateCopyWithImpl<$Res, _$_QrCodeState>
    implements _$$_QrCodeStateCopyWith<$Res> {
  __$$_QrCodeStateCopyWithImpl(
      _$_QrCodeState _value, $Res Function(_$_QrCodeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataQrCode = null,
  }) {
    return _then(_$_QrCodeState(
      dataQrCode: null == dataQrCode
          ? _value.dataQrCode
          : dataQrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QrCodeState implements _QrCodeState {
  _$_QrCodeState({this.dataQrCode = ''});

  @override
  @JsonKey()
  final String dataQrCode;

  @override
  String toString() {
    return 'QrCodeState(dataQrCode: $dataQrCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrCodeState &&
            (identical(other.dataQrCode, dataQrCode) ||
                other.dataQrCode == dataQrCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataQrCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QrCodeStateCopyWith<_$_QrCodeState> get copyWith =>
      __$$_QrCodeStateCopyWithImpl<_$_QrCodeState>(this, _$identity);
}

abstract class _QrCodeState implements QrCodeState {
  factory _QrCodeState({final String dataQrCode}) = _$_QrCodeState;

  @override
  String get dataQrCode;
  @override
  @JsonKey(ignore: true)
  _$$_QrCodeStateCopyWith<_$_QrCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
