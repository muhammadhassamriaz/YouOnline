import 'package:video_player/video_player.dart';
import 'package:youonline/utils/color.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoURL;

  const VideoPlayerWidget({
    Key key,
    @required this.videoURL,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    if (widget.videoURL != null) {
      if (widget.videoURL.isNotEmpty) {
        flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.network(
            widget.videoURL,
          ),
          autoPlay: false,
        );
      }
    }
  }

  @override
  void dispose() {
    flickManager.flickControlManager.pause();
    flickManager.dispose();

    super.dispose();
    flickManager.flickControlManager.pause();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          controls: IconTheme(
            data: IconThemeData(color: Colors.white),
            child: FlickPortraitControls(
              progressBarSettings: FlickProgressBarSettings(
                bufferedColor: primaryColor.withOpacity(0.2),
                playedColor: primaryColor,
                handleColor: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
