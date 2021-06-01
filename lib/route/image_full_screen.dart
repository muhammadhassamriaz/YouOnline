import 'dart:io';

import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class ImageFullScreen extends StatefulWidget {
  final VoidCallback likedButtonOnPressed;
  final VoidCallback commentButtonCallback;
  final VoidCallback shareButtonCallback;
  String reaction;
  final List<Album> album;
  final String imageURL;
  final int reactionCount;
  final int commentCount;

  ImageFullScreen({
    Key key,
    @required this.likedButtonOnPressed,
    @required this.commentButtonCallback,
    @required this.shareButtonCallback,
    @required this.reaction,
    this.album,
    this.imageURL,
    @required this.commentCount,
    @required this.reactionCount,
  }) : super(key: key);

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;

    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .04,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          size: width * .06,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.download_rounded,
                        size: width * .06,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      Icon(
                        Icons.copy_outlined,
                        size: width * .06,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? height * .1
                      : height * .01,
                ),
                Container(
                  height: orientation == Orientation.portrait
                      ? height * .7
                      : height * .28,
                  width: double.infinity,
                  color: Colors.black,
                  child: widget.album != null
                      ? widget.album.length > 0
                          ? Swiper(
                              itemCount: widget.album.length,
                              // containerHeight:
                              //     orientation == Orientation.portrait
                              //         // ? height * .7
                              //         // : height * .28,
                              containerWidth: double.infinity,
                              loop: false,
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: orientation == Orientation.portrait
                                  //     ? height * .7
                                  //     : height * .2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: FadeInImage.memoryNetwork(
                                    image: widget.album[index].imageURL,
                                    placeholder: kTransparentImage,
                                  ),
                                );
                              },
                            )
                          : Swiper(
                              itemCount: 1,
                              // containerHeight:
                              //     orientation == Orientation.portrait
                              //         ? height * .7
                              //         : height * .28,
                              containerWidth: double.infinity,
                              loop: false,
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: orientation == Orientation.portrait
                                  //     ? height * .7
                                  //     : height * .28,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(widget.imageURL),
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            )
                      : Swiper(
                          itemCount: 1,
                          // containerHeight: orientation == Orientation.portrait
                          //     ? height * .7
                          //     : height * .28,
                          containerWidth: double.infinity,
                          loop: false,
                          itemBuilder: (context, index) {
                            return Container(
                              // height: orientation == Orientation.portrait
                              //     ? height * .7
                              //     : height * .28,
                              width: double.infinity,

                              child: widget.imageURL.contains("http")
                                  ? FadeInImage.memoryNetwork(
                                      image: widget.imageURL,
                                      placeholder: kTransparentImage,
                                      // fit: BoxFit.cover,
                                    )
                                  : Image.asset(widget.imageURL),
                              // fit: BoxFit.cover,
                            );
                          },
                        ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 02,
                  ),
                  child: InkWell(
                    onTap: () {
                      widget.commentButtonCallback();
                    },
                    child: Row(
                      children: [
                        if (widget.reactionCount != null)
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 05,
                            height: SizeConfig.kDefaultSize * 05,
                            child: Image.asset(
                              "assets/images/" + widget.reaction + ".gif",
                            ),
                          ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 01,
                        ),
                        if (widget.reactionCount != null)
                          Text(
                            widget.reactionCount.toString(),
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 03.6,
                              color: Colors.white,
                            ),
                            textScaleFactor: 1,
                          ),
                        Spacer(),
                        Text(
                          '${widget.commentCount ?? 0} Comments',
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 03.6,
                            color: Colors.white,
                          ),
                          textScaleFactor: 1,
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 02,
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 05,
                          height: SizeConfig.kDefaultSize * 05,
                          child: Image.asset(
                            Assets.PROFILE_AVATAR,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 01,
                ),
                Divider(
                  color: Colors.white,
                  height: SizeConfig.kDefaultSize * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 01,
                      ),
                      onPressed: () {
                        // _widgetProvider.changeReaction(likeGIF);
                      },
                      onLongPress: () {
                        widget.likedButtonOnPressed();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 04,
                            height: SizeConfig.kDefaultSize * 04,
                            child: Image.asset(
                              Assets.LIKE_BUTTON_ICON,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 02,
                          ),
                          Text(
                            'Like',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 04,
                              color: Colors.white,
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 01,
                      ),
                      onPressed: () {
                        widget.commentButtonCallback();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 05,
                            height: SizeConfig.kDefaultSize * 05,
                            child: Image.asset(
                              Assets.MESSAGE_ICON,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 02,
                          ),
                          Text(
                            'Comment',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 04,
                              color: Colors.white,
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 01,
                      ),
                      onPressed: () {
                        widget.shareButtonCallback();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 04,
                            height: SizeConfig.kDefaultSize * 04,
                            child: Image.asset(
                              Assets.SHARE_ICON,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 02,
                          ),
                          Text(
                            'Share',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 04,
                              color: Colors.white,
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
