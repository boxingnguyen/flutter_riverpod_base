import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final playerProvider = StateProvider<bool>((ref) => false);

class VideoPlayerPreview extends ConsumerStatefulWidget {
  const VideoPlayerPreview({
    required this.path,
    Key? key,
  }) : super(key: key);

  final String path;

  @override
  _VideoPlayerPreviewState createState() => _VideoPlayerPreviewState();
}

class _VideoPlayerPreviewState extends ConsumerState<VideoPlayerPreview> {
  late VideoPlayerController _videoPlayerController;
  // TODO(mintt): use late declare and try use hook if need
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final isPlayerInitialized = ref.watch(playerProvider) == true;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: isPlayerInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController!.dispose();
  }

  // Init video player
  Future<void> initializeVideoPlayer() async {
    if (Uri.parse(widget.path).isAbsolute) {
      _videoPlayerController = VideoPlayerController.network(widget.path);
    } else {
      _videoPlayerController = VideoPlayerController.file(File(widget.path));
    }

    await Future.wait([_videoPlayerController.initialize()]);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoInitialize: true,
      looping: false,
      fullScreenByDefault: false,
      autoPlay: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );

    // set state chewieController is initialized
    ref.read(playerProvider.notifier).update((state) => true);

    _chewieController!.addListener(() {
      if (!_chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }
}
