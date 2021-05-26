import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'comment_bottom_sheet.dart';

class ReviewPostWidget extends StatefulWidget {
  final String description;
  final String imageURL;
  final String profileAvatar;
  final String name;
  final String iframe;

  const ReviewPostWidget(
      {Key key,
      this.description,
      this.imageURL,
      this.profileAvatar,
      this.name,
      this.iframe})
      : super(key: key);
  @override
  _ReviewPostWidgetState createState() => _ReviewPostWidgetState();
}

class _ReviewPostWidgetState extends State<ReviewPostWidget> {
  // YoutubePlayerController _youtubePlayerController;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.iframe != null) {
  //     if (widget.iframe.isNotEmpty) {
  //       _youtubePlayerController = YoutubePlayerController(
  //         initialVideoId: widget.iframe,
  //         params: YoutubePlayerParams(
  //           showControls: true,
  //           autoPlay: true,
  //           showFullscreenButton: true,
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.kDefaultSize * 1,
        ),
        Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  SizeConfig.kDefaultSize * 03,
                ),
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.kDefaultSize * 15,
                      height: SizeConfig.kDefaultSize * 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          width: SizeConfig.kDefaultSize * 15,
                          height: SizeConfig.kDefaultSize * 15,
                          child: widget.profileAvatar != null
                              ? FadeInImage.assetNetwork(
                                  placeholder: Assets.PROFILE_AVATAR,
                                  image: widget.profileAvatar,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  Assets.PROFILE_AVATAR,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.name ?? 'YouOnline Prizes Egypt',
                                      style: labelTextStyle.copyWith(
                                        fontSize: SizeConfig.kDefaultSize * 4.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.kDefaultSize * 1,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.kDefaultSize * 04,
                                      height: SizeConfig.kDefaultSize * 04,
                                      child: Image.asset(
                                        Assets.VERIFIED_ICON,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showPostMenuBottomSheet(context);
                                },
                                child: SizedBox(
                                  width: SizeConfig.kDefaultSize * 04,
                                  height: SizeConfig.kDefaultSize * 04,
                                  child: Image.asset(
                                    Assets.OPTION_ICON,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '15 mins ago',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 3.8,
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.description != null)
                if (widget.description.isNotEmpty)
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 1.5,
                  ),
              if (widget.description != null)
                if (widget.description.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.description ?? '',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 3.2,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
              if (widget.description != null)
                if (widget.description.isNotEmpty)
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 01,
                  ),
              if (widget.imageURL != null)
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.kDefaultSize * 60,
                  child: FadeInImage.assetNetwork(
                    placeholder: Assets.POST_PICTURE_PLACEHOLDER,
                    image: widget.imageURL,
                    fit: BoxFit.cover,
                  ),
                )
              else if (widget.iframe != null)
                // if (widget.iframe.isNotEmpty)
                // if (_youtubePlayerController != null)
                //   SizedBox(
                //     width: double.infinity,
                //     height: SizeConfig.kDefaultSize * 60,
                //     child: YoutubePlayerControllerProvider(
                //       controller: _youtubePlayerController,
                //       child: YoutubePlayerIFrame(),
                //     ),
                //   )
                Container()
              // else
              //   SizedBox(
              //     width: double.infinity,
              //     height: SizeConfig.kDefaultSize * 60,
              //     child: Image.asset(
              //       Assets.POST_PICTURE_PLACEHOLDER,
              //     ),
              //   )
              // else
              //   SizedBox(
              //     width: double.infinity,
              //     height: SizeConfig.kDefaultSize * 60,
              //     child: Image.asset(
              //       Assets.POST_PICTURE_PLACEHOLDER,
              //     ),
              //   )
              else
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.kDefaultSize * 60,
                  child: Image.asset(
                    Assets.POST_PICTURE_PLACEHOLDER,
                  ),
                ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 02,
                ),
                child: InkWell(
                  onTap: () {
                    commentBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 05,
                        height: SizeConfig.kDefaultSize * 05,
                        child: Image.asset(
                          _widgetProvider.reaction,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 01,
                      ),
                      Text(
                        '43',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 03.6,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                      Spacer(),
                      Text(
                        '124 Comments',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 03.6,
                          color: hintTextColor,
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
                color: Colors.grey[300],
                height: SizeConfig.kDefaultSize * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 01,
                    ),
                    onPressed: () {},
                    onLongPress: () {
                      List<String> emojis = [
                        likeGIF,
                        loveGIF,
                        happyGIF,
                        sadGIF,
                        angryGIF,
                        wowGIF,
                      ];
                      showDialog(
                        context: context,
                        useSafeArea: false,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            actionsPadding: EdgeInsets.all(0),
                            buttonPadding: EdgeInsets.all(0),
                            insetPadding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.kDefaultSize * 18,
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            titlePadding: EdgeInsets.all(0),
                            content: Container(
                              height: SizeConfig.kDefaultSize * 20,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  emojis.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        _widgetProvider
                                            .changeReaction(emojis[index]);
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        width: SizeConfig.kDefaultSize * 10,
                                        height: SizeConfig.kDefaultSize * 10,
                                        child: Image.asset(
                                          emojis[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
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
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 02,
                        ),
                        Text(
                          'Like',
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 04,
                            color: hintTextColor,
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
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 05,
                          height: SizeConfig.kDefaultSize * 05,
                          child: Image.asset(
                            Assets.MESSAGE_ICON,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 02,
                        ),
                        Text(
                          'Comment',
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 04,
                            color: hintTextColor,
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
                      shareBottomSheet(context);
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
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 02,
                        ),
                        Text(
                          'Share',
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 04,
                            color: hintTextColor,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
                height: SizeConfig.kDefaultSize * .03,
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 02,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 8,
          ),
          child: Container(
            height: height * .06,
            child: YouOnlineButton(
              callback: () {},
              title: "Hide",
              textColor: Colors.black,
              color: searchContainerColor,
              textSize: width * .04,
            ),
          ),
        ),
        SizedBox(
          height: height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 8,
          ),
          child: Container(
            height: height * .06,
            child: YouOnlineButton(
              callback: () {},
              title: "Add to Profile",
              textSize: width * .04,
            ),
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
