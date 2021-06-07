import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    // videoPlayerController
    //   ..initialize().then((value) {
    //     setState(() {
    //       videoPlayerController..play();
    //     });
    //   });
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
                    ),
          // child: Image.network(
          //   // child: CupertinoActivityIndicator(),
          //   widget?.videoThumbnail,
          // ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(
          //       widget.videoThumbnail,
          //       scale: 0.5,
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // child: Stack(
          //   children: [
          //     Align(
          //       alignment: Alignment.center,
          //       child: Container(
          //         width: width * .15,
          //         height: width * .15,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //         ),
          //         child: Center(
          //           child: Icon(
          //             Icons.play_arrow,
          //             size: width * .08,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
          //aspectRatio: 16 / 9,
          autoInitialize: true,
          autoPlay: true,
          looping: false,
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
