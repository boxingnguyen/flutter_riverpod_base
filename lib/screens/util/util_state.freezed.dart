// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'util_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UtilState {
  String get status => throw _privateConstructorUsedError;
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  bool get showErrorIndicator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UtilStateCopyWith<UtilState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilStateCopyWith<$Res> {
  factory $UtilStateCopyWith(UtilState value, $Res Function(UtilState) then) =
      _$UtilStateCopyWithImpl<$Res, UtilState>;
  @useResult
  $Res call(
      {String status, bool showLoadingIndicator, bool showErrorIndicator});
}

/// @nodoc
class _$UtilStateCopyWithImpl<$Res, $Val extends UtilState>
    implements $UtilStateCopyWith<$Res> {
  _$UtilStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? showLoadingIndicator = null,
    Object? showErrorIndicator = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: null == showErrorIndicator
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UtilStateCopyWith<$Res> implements $UtilStateCopyWith<$Res> {
  factory _$$_UtilStateCopyWith(
          _$_UtilState value, $Res Function(_$_UtilState) then) =
      __$$_UtilStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, bool showLoadingIndicator, bool showErrorIndicator});
}

/// @nodoc
class __$$_UtilStateCopyWithImpl<$Res>
    extends _$UtilStateCopyWithImpl<$Res, _$_UtilState>
    implements _$$_UtilStateCopyWith<$Res> {
  __$$_UtilStateCopyWithImpl(
      _$_UtilState _value, $Res Function(_$_UtilState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? showLoadingIndicator = null,
    Object? showErrorIndicator = null,
  }) {
    return _then(_$_UtilState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: null == showErrorIndicator
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UtilState implements _UtilState {
  _$_UtilState(
      {this.status = '',
      this.showLoadingIndicator = false,
      this.showErrorIndicator = false});

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool showLoadingIndicator;
  @override
  @JsonKey()
  final bool showErrorIndicator;

  @override
  String toString() {
    return 'UtilState(status: $status, showLoadingIndicator: $showLoadingIndicator, showErrorIndicator: $showErrorIndicator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UtilState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.showLoadingIndicator, showLoadingIndicator) ||
                other.showLoadingIndicator == showLoadingIndicator) &&
            (identical(other.showErrorIndicator, showErrorIndicator) ||
                other.showErrorIndicator == showErrorIndicator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, showLoadingIndicator, showErrorIndicator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UtilStateCopyWith<_$_UtilState> get copyWith =>
      __$$_UtilStateCopyWithImpl<_$_UtilState>(this, _$identity);
}

abstract class _UtilState implements UtilState {
  factory _UtilState(
      {final String status,
      final bool showLoadingIndicator,
      final bool showErrorIndicator}) = _$_UtilState;

  @override
  String get status;
  @override
  bool get showLoadingIndicator;
  @override
  bool get showErrorIndicator;
  @override
  @JsonKey(ignore: true)
  _$$_UtilStateCopyWith<_$_UtilState> get copyWith =>
      throw _privateConstructorUsedError;
}
