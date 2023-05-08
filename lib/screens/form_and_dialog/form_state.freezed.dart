// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormState {
  bool get showPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormStateCopyWith<FormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStateCopyWith<$Res> {
  factory $FormStateCopyWith(FormState value, $Res Function(FormState) then) =
      _$FormStateCopyWithImpl<$Res, FormState>;
  @useResult
  $Res call({bool showPassword});
}

/// @nodoc
class _$FormStateCopyWithImpl<$Res, $Val extends FormState>
    implements $FormStateCopyWith<$Res> {
  _$FormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showPassword = null,
  }) {
    return _then(_value.copyWith(
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormStateCopyWith<$Res> implements $FormStateCopyWith<$Res> {
  factory _$$_FormStateCopyWith(
          _$_FormState value, $Res Function(_$_FormState) then) =
      __$$_FormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showPassword});
}

/// @nodoc
class __$$_FormStateCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$_FormState>
    implements _$$_FormStateCopyWith<$Res> {
  __$$_FormStateCopyWithImpl(
      _$_FormState _value, $Res Function(_$_FormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showPassword = null,
  }) {
    return _then(_$_FormState(
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormState implements _FormState {
  _$_FormState({this.showPassword = false});

  @override
  @JsonKey()
  final bool showPassword;

  @override
  String toString() {
    return 'FormState(showPassword: $showPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormState &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormStateCopyWith<_$_FormState> get copyWith =>
      __$$_FormStateCopyWithImpl<_$_FormState>(this, _$identity);
}

abstract class _FormState implements FormState {
  factory _FormState({final bool showPassword}) = _$_FormState;

  @override
  bool get showPassword;
  @override
  @JsonKey(ignore: true)
  _$$_FormStateCopyWith<_$_FormState> get copyWith =>
      throw _privateConstructorUsedError;
}
