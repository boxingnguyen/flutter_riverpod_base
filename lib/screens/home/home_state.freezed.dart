// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {int counter = 0,
      int random = 17,
      bool showLoadingIndicator = false,
      bool updatePhone = false}) {
    return _HomeState(
      counter: counter,
      random: random,
      showLoadingIndicator: showLoadingIndicator,
      updatePhone: updatePhone,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  int get counter => throw _privateConstructorUsedError;
  int get random => throw _privateConstructorUsedError;
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  bool get updatePhone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {int counter, int random, bool showLoadingIndicator, bool updatePhone});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? counter = freezed,
    Object? random = freezed,
    Object? showLoadingIndicator = freezed,
    Object? updatePhone = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      random: random == freezed
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      updatePhone: updatePhone == freezed
          ? _value.updatePhone
          : updatePhone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int counter, int random, bool showLoadingIndicator, bool updatePhone});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? counter = freezed,
    Object? random = freezed,
    Object? showLoadingIndicator = freezed,
    Object? updatePhone = freezed,
  }) {
    return _then(_HomeState(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      random: random == freezed
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      updatePhone: updatePhone == freezed
          ? _value.updatePhone
          : updatePhone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {this.counter = 0,
      this.random = 17,
      this.showLoadingIndicator = false,
      this.updatePhone = false});

  @JsonKey()
  @override
  final int counter;
  @JsonKey()
  @override
  final int random;
  @JsonKey()
  @override
  final bool showLoadingIndicator;
  @JsonKey()
  @override
  final bool updatePhone;

  @override
  String toString() {
    return 'HomeState(counter: $counter, random: $random, showLoadingIndicator: $showLoadingIndicator, updatePhone: $updatePhone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.counter, counter) &&
            const DeepCollectionEquality().equals(other.random, random) &&
            const DeepCollectionEquality()
                .equals(other.showLoadingIndicator, showLoadingIndicator) &&
            const DeepCollectionEquality()
                .equals(other.updatePhone, updatePhone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(counter),
      const DeepCollectionEquality().hash(random),
      const DeepCollectionEquality().hash(showLoadingIndicator),
      const DeepCollectionEquality().hash(updatePhone));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {int counter,
      int random,
      bool showLoadingIndicator,
      bool updatePhone}) = _$_HomeState;

  @override
  int get counter;
  @override
  int get random;
  @override
  bool get showLoadingIndicator;
  @override
  bool get updatePhone;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
