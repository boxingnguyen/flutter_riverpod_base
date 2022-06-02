import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeViewer extends StatefulWidget {
  final String youtubeUrl;
  final VoidCallback? onTapVideo;
  const YoutubeViewer({Key? key, required this.youtubeUrl, this.onTapVideo})
      : super(key: key);

  @override
  State<YoutubeViewer> createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    String? videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        progressIndicatorColor: AppStyles.primaryColor,
        topActions: <Widget>[
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: AppStyles.textRegular.copyWith(
                color: AppStyles.white,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {},
        onEnded: (data) {},
      ),
      builder: (context, player) => player,
    );
  }
}
