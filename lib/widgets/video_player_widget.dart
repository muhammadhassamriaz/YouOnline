import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
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
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Future<VideoPlayerController> _future;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoURL);
    _future = initVideoPlayer();
    // if (widget.videoURL != null) {
    //   if (widget.videoURL.isNotEmpty) {
    //     videoPlayerController = VideoPlayerController.network(
    //       widget.videoURL,
    //     )
    //       ..initialize().then((value) {
    //         setState(() {
    //           videoPlayerController.seekTo(Duration(seconds: 3));
    //           videoPlayerController.play();
    //           videoPlayerController.setVolume(0);
    //         });
    //       })
    //       ..videoPlayerOptions;
    //     chewieController = ChewieController(
    //       autoInitialize: true,
    //       videoPlayerController: videoPlayerController,
    //       autoPlay: true,
    //       looping: false,
    //     );
    //   }
    // }
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VideoPlayerController>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Center(
            child: videoPlayerController.value.initialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: chewieController,
                    ),
                  )
                : CircularProgressIndicator());
      },
    );
  }

  Future<VideoPlayerController> initVideoPlayer() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: videoPlayerController.value.aspectRatio,
      //aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: false,

      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(child: Text(errorMessage));
      },
    );
    return videoPlayerController;
  }
}
