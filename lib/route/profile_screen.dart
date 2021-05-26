import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youonline/component/about_section.dart';
import 'package:youonline/component/photo_section.dart';
import 'package:youonline/component/post_section.dart';

import 'package:youonline/component/video_section.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';

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
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    if (_widgetProvider.profileSectionIndex == 1) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
