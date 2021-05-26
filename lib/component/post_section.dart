import 'package:flutter/material.dart';
import 'package:youonline/component/profile_header.dart';
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
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostSection extends StatefulWidget {
  PostSection({
    Key key,
    @required this.userId,
    @required this.profileCover,
    @required this.fullName,
    @required this.profileAvatar,
    @required this.username,
  }) : super(key: key);
  final String userId;
  final String username, fullName, profileAvatar, profileCover;

  @override
  _PostSectionState createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
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
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<UserTimelineData>(
            future: _userProvider.getUserPosts(
              pageNo: pageNo.toString(),
              context: context,
              userID: widget.userId,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TimelineData> timelineData = [];
                timelineData = snapshot.data.posts.data;
                return Expanded(
                  child: SmartRefresher(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: _refreshController,
                    onLoading: () async {
                      print(_refreshController.position);
                      setState(() {
                        pageNo = pageNo + 1;
                      });
                      _userProvider.getUserPosts(
                        pageNo: pageNo.toString(),
                        context: context,
                        userID: widget.userId,
                      );
                      await Future.delayed(Duration(milliseconds: 1000), () {});

                      _refreshController.loadComplete();
                    },
                    scrollController: _smartRefresherController,
                    enablePullDown: true,
                    onRefresh: () async {
                      setState(() {
                        pageNo = 1;
                        _userProvider.userTimelineData.posts.data = [];
                      });

                      _userProvider.getUserPosts(
                        pageNo: pageNo.toString(),
                        context: context,
                        userID: widget.userId,
                      );
                      _refreshController.refreshCompleted();
                    },
                    enablePullUp: true,
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text(
                            "Pull Up",
                            style: labelTextStyle.copyWith(
                              fontSize: width * .04,
                            ),
                            textScaleFactor: 1,
                          );
                        } else if (mode == LoadStatus.loading) {
                          body = CircularProgressIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text(
                            "Load Failed!Click retry!",
                            textScaleFactor: 1,
                          );
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text(
                            "Release to Load Data",
                            style: labelTextStyle.copyWith(
                              fontSize: width * .04,
                            ),
                            textScaleFactor: 1,
                          );
                        } else {
                          body = Text(
                            "No more Data",
                            textScaleFactor: 1,
                          );
                        }
                        return Container(
                          height: 55.0,
                          child: Center(child: body),
                        );
                      },
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        width: double.infinity,
                        // color: Color(0xffE0E0E0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileHeader(
                              fullname: widget.fullName,
                              profileAvatar: widget.profileAvatar,
                              profileCover: widget.profileCover,
                              username: widget.username,
                              userId: int.tryParse(widget.userId),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * .04,
                              ),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Wrap(
                              children: List.generate(
                                _userProvider
                                    .userTimelineData.posts.data.length,
                                (timelineIndex) {
                                  List<TimelinePostComments> comments = [];

                                  comments = _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          ?.comments ??
                                      [];

                                  String imageURL;
                                  String iframe;
                                  String videoURL;
                                  String postText;

                                  bool shared = false;

                                  if (_userProvider.userTimelineData.posts
                                          .data[timelineIndex] !=
                                      null) {
                                    shared = true;
                                  } else {
                                    shared = false;
                                  }

                                  bool urlExist = false;
                                  List<Album> album = [];

                                  if (_userProvider
                                              .userTimelineData
                                              .posts
                                              .data[timelineIndex]
                                              .postYoutube !=
                                          null &&
                                      _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postYoutube
                                          .isNotEmpty) {
                                    iframe = _userProvider.userTimelineData
                                        .posts.data[timelineIndex].postYoutube;
                                  }
                                  if (_userProvider.userTimelineData.posts
                                              .data[timelineIndex].album !=
                                          null &&
                                      _userProvider
                                              .userTimelineData
                                              .posts
                                              .data[timelineIndex]
                                              .album
                                              .length >
                                          0) {
                                    album = _userProvider.userTimelineData.posts
                                        .data[timelineIndex].album;
                                  }
                                  if (_userProvider.userTimelineData.posts
                                              .data[timelineIndex].postFile !=
                                          null &&
                                      _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postFile
                                          .isNotEmpty) {
                                    if (_userProvider.userTimelineData.posts
                                        .data[timelineIndex].postFile
                                        .contains("mp4")) {
                                      videoURL = _userProvider.userTimelineData
                                          .posts.data[timelineIndex].postFile;
                                    } else {
                                      imageURL = _userProvider.userTimelineData
                                          .posts.data[timelineIndex].postFile;
                                      urlExist = true;
                                    }
                                  } else if (_userProvider
                                              .userTimelineData
                                              .posts
                                              .data[timelineIndex]
                                              .postLink !=
                                          null &&
                                      _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postLink
                                          .isNotEmpty) {
                                    if (_userProvider.userTimelineData.posts
                                        .data[timelineIndex].postLink
                                        .contains("mp4")) {
                                      videoURL = _userProvider.userTimelineData
                                          .posts.data[timelineIndex].postLink;
                                      urlExist = true;
                                    } else if (_userProvider
                                                .userTimelineData
                                                .posts
                                                .data[timelineIndex]
                                                .postLinkImage !=
                                            null &&
                                        _userProvider
                                            .userTimelineData
                                            .posts
                                            .data[timelineIndex]
                                            .postLinkImage
                                            .isNotEmpty) {
                                      imageURL = _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postLinkImage;
                                      urlExist = true;
                                    } else {
                                      imageURL = _userProvider.userTimelineData
                                          .posts.data[timelineIndex].postLink;
                                      urlExist = true;
                                    }
                                  } else if (_userProvider
                                              .userTimelineData
                                              .posts
                                              .data[timelineIndex]
                                              .postYoutube !=
                                          null &&
                                      _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postYoutube
                                          .isNotEmpty) {
                                    iframe = _userProvider.userTimelineData
                                        .posts.data[timelineIndex].postYoutube;
                                    urlExist = true;
                                  }
                                  if (_userProvider.userTimelineData.posts
                                              .data[timelineIndex].postText !=
                                          null &&
                                      _userProvider
                                          .userTimelineData
                                          .posts
                                          .data[timelineIndex]
                                          .postText
                                          .isNotEmpty) {
                                    postText = _userProvider.userTimelineData
                                        .posts.data[timelineIndex].postText;
                                  }

                                  List<Reactions> reactions = [];

                                  if (_userProvider.userTimelineData.posts
                                              .data[timelineIndex].reactions !=
                                          null &&
                                      _userProvider
                                              .userTimelineData
                                              .posts
                                              .data[timelineIndex]
                                              .reactions
                                              .length >
                                          0) {
                                    reactions = _userProvider.userTimelineData
                                        .posts.data[timelineIndex].reactions;
                                    likeReaction =
                                        reactions[reactionIndex ?? 0].reaction;
                                  } else {
                                    reactions = [];
                                  }

                                  return HomePostWidget(
                                    isPostShared: shared,
                                    time: _userProvider.userTimelineData.posts
                                        .data[timelineIndex].time,
                                    page: _userProvider.userTimelineData.posts
                                        .data[timelineIndex].page,
                                    group: _userProvider.userTimelineData.posts
                                        .data[timelineIndex].group,
                                    user: _userProvider.userTimelineData.posts
                                        .data[timelineIndex].user,
                                    postColor: _userProvider
                                                .userTimelineData
                                                .posts
                                                .data[timelineIndex]
                                                .colored !=
                                            null
                                        ? _userProvider.userTimelineData.posts
                                            .data[timelineIndex].colored
                                        : null,
                                    likedButtonOnPressed: () {
                                      SizeConfig().init(context);

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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                SizeConfig.kDefaultSize * 18,
                                              ),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            titlePadding: EdgeInsets.all(0),
                                            content: Container(
                                              height:
                                                  SizeConfig.kDefaultSize * 20,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: List.generate(
                                                  emojis.length,
                                                  (emojiIndex) {
                                                    return GestureDetector(
                                                      onTap: () async {
                                                        if (reactions == null) {
                                                          reactions = [];
                                                        } else if (reactions
                                                                .length >
                                                            0) {
                                                          reactions.forEach(
                                                              (element) {
                                                            if (element
                                                                    .postId ==
                                                                _userProvider
                                                                    .userTimelineData
                                                                    .posts
                                                                    .data[
                                                                        timelineIndex]
                                                                    .id) {
                                                              setState(() {
                                                                reactionIndex =
                                                                    reactions
                                                                        .indexOf(
                                                                            element);
                                                              });
                                                            }
                                                          });
                                                        }
                                                        Reactions reaction =
                                                            Reactions();
                                                        User user = User();
                                                        reaction.postId =
                                                            _userProvider
                                                                .userTimelineData
                                                                .posts
                                                                .data[
                                                                    timelineIndex]
                                                                .id;
                                                        user.userId =
                                                            _userProvider
                                                                .user.userId;
                                                        user.email =
                                                            _userProvider
                                                                .user.email;

                                                        user.avatar =
                                                            _userProvider
                                                                .user.avatar;
                                                        user.username =
                                                            _userProvider
                                                                .user.username;
                                                        if (_userProvider.user
                                                                    .firstName !=
                                                                null &&
                                                            _userProvider.user
                                                                    .lastName !=
                                                                null) {
                                                          user.firstName =
                                                              _userProvider.user
                                                                  .firstName;
                                                          user.lastName =
                                                              _userProvider.user
                                                                  .lastName;
                                                        }
                                                        reaction.user = user;
                                                        reaction
                                                            .reaction = emojis[
                                                                emojiIndex]
                                                            .replaceAll(
                                                                "assets/images/",
                                                                "")
                                                            .replaceAll(
                                                                ".gif", "");

                                                        if (reactionIndex !=
                                                            null) {
                                                          if (reactions.length >
                                                              0) {
                                                            setState(() {
                                                              reactions.removeAt(
                                                                  reactionIndex);
                                                              reactions.insert(
                                                                  reactionIndex,
                                                                  reaction);
                                                              _userProvider
                                                                  .userTimelineData
                                                                  .posts
                                                                  .data[
                                                                      timelineIndex]
                                                                  .reactions = reactions;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              reactions.add(
                                                                  reaction);
                                                              _userProvider
                                                                  .userTimelineData
                                                                  .posts
                                                                  .data[
                                                                      timelineIndex]
                                                                  .reactions = reactions;
                                                            });
                                                          }
                                                        } else {
                                                          setState(() {
                                                            reactions
                                                                .add(reaction);
                                                            _userProvider
                                                                .userTimelineData
                                                                .posts
                                                                .data[
                                                                    timelineIndex]
                                                                .reactions = reactions;
                                                          });
                                                        }
                                                        Navigator.pop(context);
                                                        Provider.of<TimelineProvider>(
                                                                context,
                                                                listen: false)
                                                            .likePost(
                                                          context,
                                                          postID: reaction
                                                              .postId
                                                              .toString(),
                                                          reaction:
                                                              reaction.reaction,
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: SizeConfig
                                                                .kDefaultSize *
                                                            10,
                                                        height: SizeConfig
                                                                .kDefaultSize *
                                                            10,
                                                        child: Image.asset(
                                                          emojis[emojiIndex],
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
                                    comments:
                                        timelineData[timelineIndex].comments,
                                    comment: comments != null
                                        ? comments.length > 0
                                            ? comments[0]
                                            : TimelinePostComments()
                                        : TimelinePostComments(),
                                    commentButtonCallback: () {
                                      commentBottomSheet(
                                        context,
                                        comments: comments ?? [],
                                        postID: timelineData[timelineIndex]
                                            .postId
                                            .toString(),
                                        timelineIndex: timelineIndex,
                                        totalLikes: reactions.length,
                                      );
                                    },
                                    feelings:
                                        timelineData[timelineIndex].postFeeling,
                                    timelineIndex: timelineIndex,
                                    shareButtonCallback: () {
                                      shareBottomSheet(
                                        context,
                                        postID: timelineData[timelineIndex]
                                            .postId
                                            .toString(),
                                      );
                                    },
                                    postSticker:
                                        timelineData[timelineIndex].postSticker,
                                    postID: timelineData[timelineIndex]
                                        .id
                                        .toString(),
                                    moreButtonCallback: () {
                                      showPostMenuBottomSheet(
                                        context,
                                        postID: timelineData[timelineIndex]
                                            .id
                                            .toString(),
                                        timelineData:
                                            timelineData[timelineIndex],
                                      );
                                    },
                                    reactionCount: reactions.length == 0
                                        ? null
                                        : reactions.length,
                                    description: postText,
                                    iframe: iframe,
                                    album: album,
                                    videoURL: videoURL,
                                    imageURL:
                                        timelineData[timelineIndex].album !=
                                                null
                                            ? imageURL
                                            : null,
                                    name: _userProvider.userTimelineData.user !=
                                            null
                                        ? _userProvider.userTimelineData.user
                                                        .firstName !=
                                                    null &&
                                                timelineData[timelineIndex]
                                                        .user
                                                        .lastName !=
                                                    null
                                            ? timelineData[timelineIndex]
                                                    .user
                                                    .firstName +
                                                " " +
                                                timelineData[timelineIndex]
                                                    .user
                                                    .lastName
                                            : timelineData[timelineIndex]
                                                        .user
                                                        .username !=
                                                    null
                                                ? _userProvider.userTimelineData
                                                    .user.username
                                                : " "
                                        : " ",
                                    profileAvatar:
                                        _userProvider.userTimelineData.user !=
                                                null
                                            ? _userProvider
                                                .userTimelineData.user.avatar
                                            : null,
                                    reaction: likeReaction,
                                    postType:
                                        timelineData[timelineIndex].type ?? "",
                                    option:
                                        timelineData[timelineIndex].options ??
                                            [],
                                    showCommentBottomSheet: () {
                                      commentBottomSheet(
                                        context,
                                        comments: comments ?? [],
                                        postID: timelineData[timelineIndex]
                                            .postId
                                            .toString(),
                                        timelineIndex: timelineIndex,
                                        totalLikes: reactions.length,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
