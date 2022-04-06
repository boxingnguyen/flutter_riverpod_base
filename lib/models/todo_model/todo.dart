import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required int id,
    required int userId,
    String? title,
    bool? completed,
  }) = _Todo;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Todo.fromJson(Map<String, dynamic> json) =>
      _$TodoFromJson(json);
}
