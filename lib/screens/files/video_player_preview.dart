import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:video_player/video_player.dart';

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
  ChewieController? _chewieController;

  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  // Init video player
  Future<void> initializeVideoPlayer() async {
    if (Uri.parse(widget.path).isAbsolute) {
      _videoPlayerController = VideoPlayerController.network(widget.path);
    } else {
      _videoPlayerController = VideoPlayerController.file(File(widget.path));
    }

    await _videoPlayerController.initialize();

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

    setState(() {});

    _chewieController?.addListener(() {
      if (!_chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return const CommonErrorIndicator(
        message: 'Load video failed!',
      );
    }

    final _isInitialized =
        _chewieController!.videoPlayerController.value.isInitialized;

    return Padding(
        padding: const EdgeInsets.all(8),
        child: _isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : const LoadingIndicator());
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
