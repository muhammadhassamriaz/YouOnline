import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String iframe;

  const YouTubeVideoPlayer({
    Key key,
    @required this.iframe,
  }) : super(key: key);

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.iframe != null) {
      if (widget.iframe.isNotEmpty) {
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: widget.iframe,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            hideControls: false,
            enableCaption: false,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _youtubePlayerController,
      showVideoProgressIndicator: false,
      bufferIndicator: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
