import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youonline/component/about_section.dart';
import 'package:youonline/component/photo_section.dart';
import 'package:youonline/component/post_section.dart';

import 'package:youonline/component/video_section.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:bot_toast/bot_toast.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  final String username, fullName, profileAvatar, profileCover;

  const ProfileScreen({
    Key key,
    @required this.userId,
    @required this.profileCover,
    @required this.fullName,
    @required this.profileAvatar,
    @required this.username,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int pageNo = 1;

  String likeReaction;

  List<String> emojis = [
    likeGIF,
    loveGIF,
    happyGIF,
    sadGIF,
    angryGIF,
    wowGIF,
  ];

  List<PostReaction> postReactions = [];

  int reactionIndex;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    if (_widgetProvider.profileSectionIndex == 1) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            YouOnlineIconButton(
              callback: () async {
                BotToast.showLoading();
                await _userProvider.getTimelineUserProfile(
                  userId: widget.userId,
                );
                BotToast.closeAllLoading();
              },
              icon: Icons.refresh,
              iconSize: width * .06,
            ),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
        body: PostSection(
          userId: widget.userId,
          profileCover: widget.profileCover,
          fullName: widget.fullName,
          profileAvatar: widget.profileAvatar,
          username: widget.username,
        ),
      );
    } else if (_widgetProvider.profileSectionIndex == 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            YouOnlineIconButton(
              callback: () async {
                BotToast.showLoading();
                await _userProvider.getTimelineUserProfile(
                  userId: widget.userId,
                );
                BotToast.closeAllLoading();
              },
              icon: Icons.refresh,
              iconSize: width * .06,
            ),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
        body: AboutSection(
          userId: widget.userId,
          profileCover: widget.profileCover,
          fullName: widget.fullName,
          profileAvatar: widget.profileAvatar,
          username: widget.username,
        ),
      );
    } else if (_widgetProvider.profileSectionIndex == 2) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            YouOnlineIconButton(
              callback: () async {
                BotToast.showLoading();
                await _userProvider.getTimelineUserProfile(
                  userId: widget.userId,
                );
                BotToast.closeAllLoading();
              },
              icon: Icons.refresh,
              iconSize: width * .06,
            ),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
        body: PhotosSection(
          userId: widget.userId,
          profileCover: widget.profileCover,
          fullName: widget.fullName,
          profileAvatar: widget.profileAvatar,
          username: widget.username,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            YouOnlineIconButton(
              callback: () async {
                BotToast.showLoading();
                await _userProvider.getTimelineUserProfile(
                  userId: widget.userId,
                );
                BotToast.closeAllLoading();
              },
              icon: Icons.refresh,
              iconSize: width * .06,
            ),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
        body: VideoSection(
          userId: widget.userId,
          profileCover: widget.profileCover,
          fullName: widget.fullName,
          profileAvatar: widget.profileAvatar,
          username: widget.username,
        ),
      );
    }
  }
}
