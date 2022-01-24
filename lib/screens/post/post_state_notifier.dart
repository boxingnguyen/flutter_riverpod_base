import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/api/api_client.dart';
import 'package:provider_base/api/api_endpoints.dart';
import 'package:provider_base/api/network_state/network_state.dart';
import 'package:provider_base/models/post_model/post.dart';
import 'package:provider_base/screens/post/post_state.dart';
import 'package:state_notifier/state_notifier.dart';

// WAY 1
final postProvider = StateNotifierProvider<PostStateNotifier, PostState>((ref) {
  PostStateNotifier().fetchData();
  return PostStateNotifier();
});
// WAY 2, use Future Provider

final postRepository =
    Provider<PostStateNotifier>((ref) => PostStateNotifier());

final futureProvider = FutureProvider<List<Post?>>((ref) {
  return ref.watch(postRepository).fetchData();
});

class PostStateNotifier extends StateNotifier<PostState> with LocatorMixin {
  PostStateNotifier() : super(PostState());

  Future<List<Post?>> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 5), () {});
    final postsResponse = await ApiClient.getRequest(ApiEndpoints.post);

    var posts = <Post>[];
    // print(postsResponse);
    if (postsResponse is List) {
      posts = postsResponse.map((e) => Post.fromJson(e)).toList();
      state = state.copyWith(posts: NetworkState(posts));
      print(posts.length);
    } else {
      state = state.copyWith(posts: NetworkState.error('The deo nao'));
    }

    return posts;
  }
}
