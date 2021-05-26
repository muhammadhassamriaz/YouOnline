import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';
import 'package:youonline/component/about_section.dart';
import 'package:youonline/component/photo_section.dart';
import 'package:youonline/component/post_section.dart';

import 'package:youonline/component/profile_header.dart';
import 'package:youonline/component/video_section.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/model/user_profile_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/comment_bottom_sheet.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';

import '../model/user_profile_data.dart';

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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ScrollController _bouncingScrollController, _smartRefresherController;
  List<PostReaction> postReactions = [];

  int reactionIndex;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
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
