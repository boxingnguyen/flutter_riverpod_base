// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoStateTearOff {
  const _$TodoStateTearOff();

  _TodoState call(
      {List<Todo> listTodo = const <Todo>[],
      bool showLoadingIndicator = false,
      bool showErrorIndicator = false,
      int index = 0}) {
    return _TodoState(
      listTodo: listTodo,
      showLoadingIndicator: showLoadingIndicator,
      showErrorIndicator: showErrorIndicator,
      index: index,
    );
  }
}

/// @nodoc
const $TodoState = _$TodoStateTearOff();

/// @nodoc
mixin _$TodoState {
  List<Todo> get listTodo => throw _privateConstructorUsedError;
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  bool get showErrorIndicator => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res>;
  $Res call(
      {List<Todo> listTodo,
      bool showLoadingIndicator,
      bool showErrorIndicator,
      int index});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res> implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  final TodoState _value;
  // ignore: unused_field
  final $Res Function(TodoState) _then;

  @override
  $Res call({
    Object? listTodo = freezed,
    Object? showLoadingIndicator = freezed,
    Object? showErrorIndicator = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      listTodo: listTodo == freezed
          ? _value.listTodo
          : listTodo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: showErrorIndicator == freezed
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$TodoStateCopyWith(
          _TodoState value, $Res Function(_TodoState) then) =
      __$TodoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Todo> listTodo,
      bool showLoadingIndicator,
      bool showErrorIndicator,
      int index});
}

/// @nodoc
class __$TodoStateCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateCopyWith<$Res> {
  __$TodoStateCopyWithImpl(_TodoState _value, $Res Function(_TodoState) _then)
      : super(_value, (v) => _then(v as _TodoState));

  @override
  _TodoState get _value => super._value as _TodoState;

  @override
  $Res call({
    Object? listTodo = freezed,
    Object? showLoadingIndicator = freezed,
    Object? showErrorIndicator = freezed,
    Object? index = freezed,
  }) {
    return _then(_TodoState(
      listTodo: listTodo == freezed
          ? _value.listTodo
          : listTodo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: showErrorIndicator == freezed
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TodoState implements _TodoState {
  _$_TodoState(
      {this.listTodo = const <Todo>[],
      this.showLoadingIndicator = false,
      this.showErrorIndicator = false,
      this.index = 0});

  @JsonKey()
  @override
  final List<Todo> listTodo;
  @JsonKey()
  @override
  final bool showLoadingIndicator;
  @JsonKey()
  @override
  final bool showErrorIndicator;
  @JsonKey()
  @override
  final int index;

  @override
  String toString() {
    return 'TodoState(listTodo: $listTodo, showLoadingIndicator: $showLoadingIndicator, showErrorIndicator: $showErrorIndicator, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoState &&
            const DeepCollectionEquality().equals(other.listTodo, listTodo) &&
            const DeepCollectionEquality()
                .equals(other.showLoadingIndicator, showLoadingIndicator) &&
            const DeepCollectionEquality()
                .equals(other.showErrorIndicator, showErrorIndicator) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(listTodo),
      const DeepCollectionEquality().hash(showLoadingIndicator),
      const DeepCollectionEquality().hash(showErrorIndicator),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$TodoStateCopyWith<_TodoState> get copyWith =>
      __$TodoStateCopyWithImpl<_TodoState>(this, _$identity);
}

abstract class _TodoState implements TodoState {
  factory _TodoState(
      {List<Todo> listTodo,
      bool showLoadingIndicator,
      bool showErrorIndicator,
      int index}) = _$_TodoState;

  @override
  List<Todo> get listTodo;
  @override
  bool get showLoadingIndicator;
  @override
  bool get showErrorIndicator;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$TodoStateCopyWith<_TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
