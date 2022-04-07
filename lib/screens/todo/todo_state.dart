import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/models/todo_model/todo.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    @Default(<Todo>[]) List<Todo> listTodo,
    @Default(false) bool showLoadingIndicator,
    @Default(false) bool showErrorIndicator,
    @Default(0) int index,
  }) = _TodoState;
}
