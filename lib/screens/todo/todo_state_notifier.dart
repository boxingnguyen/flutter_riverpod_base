import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/api/api_endpoints.dart';
import 'package:provider_base/models/todo_model/todo.dart';
import 'package:provider_base/screens/todo/todo_state.dart';
import 'package:provider_base/utils/utils.dart';

final todoNotifierProvider =
    StateNotifierProvider<TodoStateNotifier, TodoState>((ref) {
  return TodoStateNotifier(ref);
});

class TodoStateNotifier extends StateNotifier<TodoState> with Utils {
  TodoStateNotifier(this.ref) : super(TodoState()) {
    Future(() async => await refreshList());
  }

  Ref ref;

  static const initialItem = 15;

  Future<void> fetchDefaultData() async {
    await fetchData(limit: initialItem);
  }

  Future<List<Todo>> fetchData({int? limit}) async {
    state = state.copyWith(showLoadingIndicator: true);
    final index = state.index;
    var request = '?_start=$index';
    if (limit != null) {
      request += '&_limit=$limit';
    }

    final listTodoResponse =
        await apiClient(ref).getRequest(ApiEndpoints.todos + request);

    var listTodo = state.listTodo;
    if (listTodoResponse is List) {
      listTodo += listTodoResponse.map((e) => Todo.fromJson(e)).toList();
      state = state.copyWith(
          listTodo: listTodo,
          showLoadingIndicator: false,
          index: limit == null ? index : index + limit);
    } else {
      state =
          state.copyWith(showErrorIndicator: true, showLoadingIndicator: false);
    }
    return listTodo;
  }

  Future<void> refreshList() async {
    state = state.copyWith(listTodo: [], index: 0);
    await fetchDefaultData();
  }
}
