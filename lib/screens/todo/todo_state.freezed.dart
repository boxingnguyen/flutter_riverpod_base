// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {List<Todo> listTodo,
      bool showLoadingIndicator,
      bool showErrorIndicator,
      int index});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listTodo = null,
    Object? showLoadingIndicator = null,
    Object? showErrorIndicator = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      listTodo: null == listTodo
          ? _value.listTodo
          : listTodo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: null == showErrorIndicator
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$$_TodoStateCopyWith(
          _$_TodoState value, $Res Function(_$_TodoState) then) =
      __$$_TodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Todo> listTodo,
      bool showLoadingIndicator,
      bool showErrorIndicator,
      int index});
}

/// @nodoc
class __$$_TodoStateCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoState>
    implements _$$_TodoStateCopyWith<$Res> {
  __$$_TodoStateCopyWithImpl(
      _$_TodoState _value, $Res Function(_$_TodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listTodo = null,
    Object? showLoadingIndicator = null,
    Object? showErrorIndicator = null,
    Object? index = null,
  }) {
    return _then(_$_TodoState(
      listTodo: null == listTodo
          ? _value._listTodo
          : listTodo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      showLoadingIndicator: null == showLoadingIndicator
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorIndicator: null == showErrorIndicator
          ? _value.showErrorIndicator
          : showErrorIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TodoState implements _TodoState {
  _$_TodoState(
      {final List<Todo> listTodo = const <Todo>[],
      this.showLoadingIndicator = false,
      this.showErrorIndicator = false,
      this.index = 0})
      : _listTodo = listTodo;

  final List<Todo> _listTodo;
  @override
  @JsonKey()
  List<Todo> get listTodo {
    if (_listTodo is EqualUnmodifiableListView) return _listTodo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTodo);
  }

  @override
  @JsonKey()
  final bool showLoadingIndicator;
  @override
  @JsonKey()
  final bool showErrorIndicator;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'TodoState(listTodo: $listTodo, showLoadingIndicator: $showLoadingIndicator, showErrorIndicator: $showErrorIndicator, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoState &&
            const DeepCollectionEquality().equals(other._listTodo, _listTodo) &&
            (identical(other.showLoadingIndicator, showLoadingIndicator) ||
                other.showLoadingIndicator == showLoadingIndicator) &&
            (identical(other.showErrorIndicator, showErrorIndicator) ||
                other.showErrorIndicator == showErrorIndicator) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listTodo),
      showLoadingIndicator,
      showErrorIndicator,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      __$$_TodoStateCopyWithImpl<_$_TodoState>(this, _$identity);
}

abstract class _TodoState implements TodoState {
  factory _TodoState(
      {final List<Todo> listTodo,
      final bool showLoadingIndicator,
      final bool showErrorIndicator,
      final int index}) = _$_TodoState;

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
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
