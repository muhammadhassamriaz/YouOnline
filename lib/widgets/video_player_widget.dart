import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:loading_indicator/loading_indicator.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoURL;
  final String videoThumbnail;

  const VideoPlayerWidget({
    Key key,
    @required this.videoURL,
    @required this.videoThumbnail,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Future _future;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoURL);
    _future = initVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(widget.videoThumbnail);
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Center(
          child: videoPlayerController.value.isInitialized
              ? Container(
                  height: height * .4,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: chewieController.aspectRatio,
                    child: Chewie(
                      controller: chewieController,
                    ),
                  ),
                )
              : widget.videoThumbnail != null
                  ? Container(
                      height: height * .4,
                      width: width,
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.videoThumbnail,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: height * .4,
                      width: width,
                      color: searchContainerColor,
                      child: Center(
                        child: SizedBox(
                          width: width * .1,
                          height: width * .1,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballGridPulse,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
        );
      },
    );
  }

  Future initVideoPlayer() async {
    await videoPlayerController.initialize();
    setState(
      () {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoInitialize: true,
          autoPlay: true,
          looping: true,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(errorMessage),
            );
          },
        );
        videoPlayerController..setVolume(0);
        chewieController..setVolume(0);
      },
    );
  }
}
