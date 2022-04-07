import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/api/network_state/network_state.dart';
import 'package:provider_base/models/post_model/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  factory PostState({
    @Default(NetworkState.loading()) NetworkState<List<Post?>> posts,
  }) = _PostState;
}
