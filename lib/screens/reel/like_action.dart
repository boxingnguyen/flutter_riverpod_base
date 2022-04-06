import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_color.dart';
import 'package:provider_base/models/reel_model/reel_state_notifier.dart';


class LikeAction extends HookConsumerWidget {
  const LikeAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reelState = ref.watch(reelProvider);
    return reelState.isLike == true
        ? likeBuilder()
        : const SizedBox.shrink();
  }

  Widget likeBuilder() {
    return FutureBuilder(
      future: tempFuture(),
      builder: (context, snapshot) =>
          snapshot.connectionState != ConnectionState.done
              ? const Icon(Icons.favorite, color: AppColor.redColor, size: 110)
              : const SizedBox.shrink(),
    );
  }

  Future<int> tempFuture() async {
    return Future.delayed(const Duration(milliseconds: 1500));
  }
}
