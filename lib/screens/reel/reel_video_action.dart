import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_color.dart';
import 'package:provider_base/models/reel_model/reel.dart';
import 'package:provider_base/models/reel_model/reel_state_notifier.dart';
import 'package:provider_base/screens/reel/like_action.dart';
import 'package:provider_base/screens/reel/loading_animation.dart';
import 'package:video_player/video_player.dart';

class ReelVideoAction extends StatefulHookConsumerWidget {
  const ReelVideoAction({Key? key, required this.reel}) : super(key: key);
  final Reel reel;
  @override
  ConsumerState<ReelVideoAction> createState() => _ReelVideoActionState();
}

class _ReelVideoActionState extends ConsumerState<ReelVideoAction> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    _videoPlayerController =
        VideoPlayerController.network('${widget.reel.sources}')
          ..initialize().then((value) {
            _videoPlayerController.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reelState = ref.watch(reelProvider);
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: Stack(
          children: [
            _videoPlayerController.value.isInitialized
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _videoPlayerController.value.isPlaying
                              ? _videoPlayerController.pause()
                              : _videoPlayerController.play();
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: Stack(
                          children: [
                            VideoPlayer(
                              _videoPlayerController,
                            ),
                            _videoPlayerController.value.isPlaying
                                ? Container()
                                : Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 80,
                                      color:
                                          AppColor.whileColor.withOpacity(0.4),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
                : const LoadingAnimation(),
            (reelState.isTap == true)
                ? const Center(child: LikeAction())
                : const SizedBox.shrink(),
          ],
        ));
  }
}
