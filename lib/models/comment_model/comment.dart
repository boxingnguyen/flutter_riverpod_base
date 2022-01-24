import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    String? name,
    String? email,
    String? body,
  }) = _Comment;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
