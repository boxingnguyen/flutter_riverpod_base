import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/models/post_model/post.dart';
import 'package:provider_base/screens/post/post_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class PostScreen extends HookConsumerWidget with Utils {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(futureProvider);

    return Scaffold(
      appBar: getAppBar(context: context, title: Constants.listPost),
      body: Center(
        // way2
        child: postState.map(
          data: (data) {
            final posts = data.value;

            if (posts.isEmpty) {
              return const CommonEmptyIndicator();
            }

            return SingleChildScrollView(child: _listPost(posts));
          },
          error: (_) => const CommonErrorIndicator(),
          loading: (_) => const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _listPost(List<Post?>? posts) {
    if (posts == null) return const CommonErrorIndicator();
    if (posts.isEmpty) return const CommonEmptyIndicator();

    return Column(
      children: posts
          .map((e) => ListTile(
                leading: const Icon(Icons.ac_unit),
                title: Text(e?.title ?? ''),
                subtitle: Text('#${e?.id ?? ''}'),
              ))
          .toList(),
    );
  }
}
