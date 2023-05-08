import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/models/comment_model/comment.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Post({
    required int userId,
    required int id,
    String? title,
    String? body,
    Comment? comment,
  }) = _Post;

  /// Connect the generated [_$PostFromJson] function to the `fromJson`
  /// factory.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
