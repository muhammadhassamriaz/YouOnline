import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:youonline/component/post_header.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/main_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

shareBottomSheet(
  BuildContext context, {
  @required String postID,
}) {
  TextEditingController _postTextEditingController = TextEditingController();

  SizeConfig().init(context);
  var _widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
  double height = SizeConfig.kDefaultSize * 100 * 2;
  double width = SizeConfig.kDefaultSize * 100;

  Provider.of<PostProvider>(context, listen: false).feelings = null;
  var _timelineProvider = Provider.of<TimelineProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.kDefaultSize * 4),
        topRight: Radius.circular(SizeConfig.kDefaultSize * 4),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SafeArea(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .04,
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height * .05,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            size: SizeConfig.kDefaultSize * 6,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 2,
                        ),
                        Text(
                          'Share',
                          style: headingTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 6,
                          ),
                          textScaleFactor: 1,
                        ),
                        Spacer(),
                        Container(
                          height: height * .06,
                          width: width * .25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              width * .08,
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: YouOnlineButton(
                            callback: () async {
                              BotToast.showLoading();
                              await _timelineProvider.sharePost(
                                context,
                                typeID: Provider.of<UserProvider>(context,
                                        listen: false)
                                    .user
                                    .userId
                                    .toString(),
                                type: "timeline",
                                postID: postID,
                                text: _postTextEditingController.text,
                              );
                              await Globals.playShareNowNotificationSound();

                              BotToast.showText(
                                text: "Post shared on your timeline.",
                                textStyle: labelTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                contentColor: Colors.white,
                              );
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MainScreen(
                                      isMainScreen: false,
                                    ),
                                  ),
                                  (route) => false);
                            },
                            title: "Share now",
                            textSize: width * .032,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 2,
                        ),
                      ],
                    ),
                    PostHeader(
                      isShared: true,
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 03,
                    ),
                    Container(
                      height: SizeConfig.kDefaultSize * 35,
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.kDefaultSize * 3,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: EdgeInsets.all(
                          SizeConfig.kDefaultSize * 03,
                        ),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1,
                          ),
                          child: TextField(
                            controller: _postTextEditingController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(
                                SizeConfig.kDefaultSize * 03,
                              ),
                              hintText: 'What\'s going on?',
                              hintStyle: labelTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 4,
                                color: _widgetProvider.selectedColorIndex == 5
                                    ? Colors.grey[500]
                                    : Colors.white60,
                              ),
                            ),
                            autocorrect: false,
                            cursorColor: _widgetProvider.selectedColorIndex == 5
                                ? Colors.black
                                : Colors.white,
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 4,
                              color: _widgetProvider.selectedColorIndex == 5
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    // Container(
                    //   height: height * .34,
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         SizedBox(
                    //           height: height * .01,
                    //         ),
                    //         MenuTile(
                    //           imageURL: addIcon,
                    //           title: "Share to Story",
                    //         ),
                    //         SizedBox(
                    //           height: height * .005,
                    //         ),
                    //         MenuTile(
                    //           imageURL: addIcon,
                    //           title: "Share to a Page's Story",
                    //         ),
                    //         SizedBox(
                    //           height: height * .005,
                    //         ),
                    //         MenuTile(
                    //           imageURL: messageIcon2,
                    //           title: "Send in Message",
                    //         ),
                    //         SizedBox(
                    //           height: height * .005,
                    //         ),
                    //         MenuTile(
                    //           imageURL: pageIcon3,
                    //           title: "Share to Page",
                    //         ),
                    //         SizedBox(
                    //           height: height * .005,
                    //         ),
                    //         MenuTile(
                    //           imageURL: groupIcon2,
                    //           title: "Share to Group",
                    //         ),
                    //         SizedBox(
                    //           height: height * .005,
                    //         ),
                    //         MenuTile(
                    //           imageURL: copyLinkIcon,
                    //           title: "Copy Link",
                    //         ),
                    //         SizedBox(
                    //           height: height * .02,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
