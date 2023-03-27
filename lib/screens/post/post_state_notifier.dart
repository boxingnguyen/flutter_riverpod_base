import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/api/api_endpoints.dart';
import 'package:provider_base/api/network_state/network_state.dart';
import 'package:provider_base/models/post_model/post.dart';
import 'package:provider_base/screens/post/post_state.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:state_notifier/state_notifier.dart';

// WAY 1
final postProvider = StateNotifierProvider<PostStateNotifier, PostState>((ref) {
  PostStateNotifier(ref).fetchData();
  return PostStateNotifier(ref);
});
// WAY 2, use Future Provider

final postRepository =
    Provider<PostStateNotifier>((ref) => PostStateNotifier(ref));

final futureProvider = FutureProvider<List<Post?>>((ref) {
  return ref.watch(postRepository).fetchData();
});

class PostStateNotifier extends StateNotifier<PostState>
    with LocatorMixin, Utils {
  PostStateNotifier(this.ref) : super(PostState());
  Ref ref;

  Future<List<Post?>> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 5), () {});
    final postsResponse = await apiClient(ref).getRequest(ApiEndpoints.post);

    var posts = <Post>[];
    // print(postsResponse);
    if (postsResponse is List) {
      posts = postsResponse.map((e) => Post.fromJson(e)).toList();
      state = state.copyWith(posts: NetworkState(posts));
      log(posts.length.toString());
    } else {
      state = state.copyWith(posts: const NetworkState.error('Error'));
    }

    return posts;
  }
}
