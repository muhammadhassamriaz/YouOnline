import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/widgets/comment_bottom_sheet.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/main_appbar.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  final bool isMainScreen;
  const HomeScreen({
    Key key,
    this.isMainScreen = true,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String likeReaction;

  List<String> emojis = [
    likeGIF,
    loveGIF,
    happyGIF,
    sadGIF,
    angryGIF,
    wowGIF,
  ];

  ScrollController scrollController;

  bool closeTopColumn = false;
  List<File> videoFiles;

  @override
  void initState() {
    super.initState();
    var _timelineProvider =
        Provider.of<TimelineProvider>(context, listen: false);
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset > 10 && scrollController.offset < 25) {
          setState(() {
            closeTopColumn = true;
          });
        } else if (scrollController.offset >= 0 &&
            scrollController.offset < 10) {
          setState(() {
            closeTopColumn = false;
          });
        }

        double centerPosition =
            scrollController.position.maxScrollExtent / 1.75;
        double edgePosition = scrollController.position.maxScrollExtent / 1.73;
        if (scrollController.position.pixels > centerPosition &&
            scrollController.position.pixels < edgePosition) {
          pageNo = pageNo + 1;
          _timelineProvider.getTimeLinePosts(
            context: context,
            pageNo: pageNo,
          );
        }
        if (scrollController.position.pixels < 5) {
          _timelineProvider.getTimeLinePosts(
            context: context,
            pageNo: 1,
            isRefresh: true,
          );
        }
      });
  }

  int pageNo = 1;

  List<PostReaction> postReactions = [];

  int reactionIndex;
  bool pinned = false;

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    var _timelineProvider = Provider.of<TimelineProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: !closeTopColumn ? 1 : 0,
            child: AnimatedContainer(
              width: width,
              height: !closeTopColumn ? height * .5 : 0,
              duration: Duration(
                milliseconds: 500,
              ),
              alignment: Alignment.topCenter,
              child: MainAppBar(),
            ),
          ),
          if (_timelineProvider.timelineData != null)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                cacheExtent: 999999999,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _timelineProvider.timelineData.length,
                itemBuilder: (context, timelineIndex) {
                  List<TimelinePostComments> comments = [];

                  comments =
                      _timelineProvider.timelineData[timelineIndex]?.comments ??
                          [];

                  String imageURL;
                  String iframe;
                  String videoURL;
                  String postText;

                  bool shared = false;

                  if (_timelineProvider.timelineData[timelineIndex].sharedBy !=
                      null) {
                    shared = true;
                  } else {
                    shared = false;
                  }

                  List<Album> album = [];
                  String videoThumbnail = "";

                  if (shared) {
                    videoThumbnail = _timelineProvider
                        .timelineData[timelineIndex]
                        .sharedBy
                        ?.videoThumbnail
                        ?.image;
                    if (_timelineProvider.timelineData[timelineIndex].sharedBy
                                .postText !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                            .postText.isNotEmpty) {
                      postText = _timelineProvider
                              .timelineData[timelineIndex].sharedBy.postText ??
                          "";
                    }
                    if (_timelineProvider.timelineData[timelineIndex].sharedBy
                                .postYoutube !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                            .postYoutube.isNotEmpty) {
                      iframe = _timelineProvider
                          .timelineData[timelineIndex].sharedBy.postYoutube;
                    }
                    if (_timelineProvider
                                .timelineData[timelineIndex].sharedBy.album !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                                .album.length >
                            0) {
                      album = _timelineProvider
                          .timelineData[timelineIndex].sharedBy.album;
                    }
                    if (_timelineProvider.timelineData[timelineIndex].sharedBy
                                .postFile !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                            .postFile.isNotEmpty) {
                      if (_timelineProvider
                          .timelineData[timelineIndex].sharedBy.postFile
                          .contains(".mp4")) {
                        videoURL = _timelineProvider
                            .timelineData[timelineIndex].sharedBy.postFile;
                      } else {
                        imageURL = _timelineProvider
                            .timelineData[timelineIndex].sharedBy.postFile;
                      }
                    } else if (_timelineProvider.timelineData[timelineIndex]
                                .sharedBy.postLink !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                            .postLink.isNotEmpty) {
                      {
                        if (_timelineProvider
                            .timelineData[timelineIndex].sharedBy.postLink
                            .contains(".mp4")) {
                          videoURL = _timelineProvider
                              .timelineData[timelineIndex].sharedBy.postLink;
                        } else if (_timelineProvider.timelineData[timelineIndex]
                                    .sharedBy.postLinkImage !=
                                null &&
                            _timelineProvider.timelineData[timelineIndex]
                                .sharedBy.postLinkImage.isNotEmpty) {
                          imageURL = _timelineProvider
                              .timelineData[timelineIndex]
                              .sharedBy
                              .postLinkImage;
                        } else {
                          imageURL = _timelineProvider
                              .timelineData[timelineIndex].sharedBy.postLink;
                        }
                      }
                    } else if (_timelineProvider.timelineData[timelineIndex]
                                .sharedBy.postYoutube !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex].sharedBy
                            .postYoutube.isNotEmpty) {
                      iframe = _timelineProvider
                          .timelineData[timelineIndex].sharedBy.postYoutube;
                    }
                  } else {
                    videoThumbnail = _timelineProvider
                        .timelineData[timelineIndex].videoThumbnail?.image;
                    if (_timelineProvider
                                .timelineData[timelineIndex].postYoutube !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex]
                            .postYoutube.isNotEmpty) {
                      iframe = _timelineProvider
                          .timelineData[timelineIndex].postYoutube;
                    }
                    if (_timelineProvider.timelineData[timelineIndex].album !=
                            null &&
                        _timelineProvider
                                .timelineData[timelineIndex].album.length >
                            0) {
                      album =
                          _timelineProvider.timelineData[timelineIndex].album;
                    }
                    if (_timelineProvider
                                .timelineData[timelineIndex].postFile !=
                            null &&
                        _timelineProvider
                            .timelineData[timelineIndex].postFile.isNotEmpty) {
                      if (_timelineProvider.timelineData[timelineIndex].postFile
                          .contains("mp4")) {
                        videoURL = _timelineProvider
                            .timelineData[timelineIndex].postFile;
                      } else {
                        imageURL = _timelineProvider
                            .timelineData[timelineIndex].postFile;
                      }
                    } else if (_timelineProvider
                                .timelineData[timelineIndex].postLink !=
                            null &&
                        _timelineProvider
                            .timelineData[timelineIndex].postLink.isNotEmpty) {
                      if (_timelineProvider.timelineData[timelineIndex].postLink
                          .contains("mp4")) {
                        videoURL = _timelineProvider
                            .timelineData[timelineIndex].postLink;
                      } else if (_timelineProvider
                                  .timelineData[timelineIndex].postLinkImage !=
                              null &&
                          _timelineProvider.timelineData[timelineIndex]
                              .postLinkImage.isNotEmpty) {
                        imageURL = _timelineProvider
                            .timelineData[timelineIndex].postLinkImage;
                      } else {
                        imageURL = _timelineProvider
                            .timelineData[timelineIndex].postLink;
                      }
                    } else if (_timelineProvider
                                .timelineData[timelineIndex].postYoutube !=
                            null &&
                        _timelineProvider.timelineData[timelineIndex]
                            .postYoutube.isNotEmpty) {
                      iframe = _timelineProvider
                          .timelineData[timelineIndex].postYoutube;
                    }
                    if (_timelineProvider
                                .timelineData[timelineIndex].postText !=
                            null &&
                        _timelineProvider
                            .timelineData[timelineIndex].postText.isNotEmpty) {
                      postText = _timelineProvider
                          .timelineData[timelineIndex].postText;
                    }
                  }

                  List<Reactions> reactions = [];

                  if (_timelineProvider.timelineData[timelineIndex].reactions !=
                          null &&
                      _timelineProvider
                              .timelineData[timelineIndex].reactions.length >
                          0) {
                    reactions =
                        _timelineProvider.timelineData[timelineIndex].reactions;
                    likeReaction = reactions[reactionIndex ?? 0].reaction;
                  } else {
                    reactions = [];
                  }
                  return HomePostWidget(
                    videoThumbnail: videoThumbnail,
                    page: _timelineProvider.timelineData[timelineIndex].page,
                    user: _timelineProvider.timelineData[timelineIndex].user,
                    group: _timelineProvider.timelineData[timelineIndex].group,
                    isPostShared: shared,
                    time: _timelineProvider.timelineData[timelineIndex].time,
                    postColor: _timelineProvider
                                .timelineData[timelineIndex].colored !=
                            null
                        ? _timelineProvider.timelineData[timelineIndex].colored
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
                                  (emojiIndex) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (reactions == null) {
                                          reactions = [];
                                        } else if (reactions.length > 0) {
                                          reactions.forEach((element) {
                                            if (element.postId ==
                                                    _timelineProvider
                                                        .timelineData[
                                                            timelineIndex]
                                                        .id &&
                                                element.user.userId ==
                                                    _userProvider.user.userId) {
                                              setState(() {
                                                reactionIndex =
                                                    reactions.indexOf(element);
                                              });
                                            }
                                          });
                                        }
                                        Reactions reaction = Reactions();
                                        User user = User();
                                        reaction.postId = _timelineProvider
                                            .timelineData[timelineIndex].id;
                                        user.userId = _userProvider.user.userId;
                                        user.email = _userProvider.user.email;

                                        user.avatar = _userProvider.user.avatar;
                                        user.username =
                                            _userProvider.user.username;
                                        if (_userProvider.user.firstName !=
                                                null &&
                                            _userProvider.user.lastName !=
                                                null) {
                                          user.firstName =
                                              _userProvider.user.firstName;
                                          user.lastName =
                                              _userProvider.user.lastName;
                                        }

                                        reaction.user = user;
                                        reaction.reaction = emojis[emojiIndex]
                                            .replaceAll("assets/images/", "")
                                            .replaceAll(".gif", "");

                                        if (reactionIndex != null) {
                                          if (reactions.length > 0) {
                                            setState(() {
                                              reactions.removeAt(reactionIndex);
                                              reactions.insert(
                                                  reactionIndex, reaction);
                                              _timelineProvider
                                                  .timelineData[timelineIndex]
                                                  .reactions = reactions;
                                            });
                                          } else {
                                            setState(() {
                                              reactions.add(reaction);
                                              _timelineProvider
                                                  .timelineData[timelineIndex]
                                                  .reactions = reactions;
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            reactions.add(reaction);
                                            _timelineProvider
                                                .timelineData[timelineIndex]
                                                .reactions = reactions;
                                          });
                                        }
                                        Navigator.pop(context);
                                        _timelineProvider.likePost(
                                          context,
                                          postID: reaction.postId.toString(),
                                          reaction: reaction.reaction,
                                        );
                                      },
                                      child: SizedBox(
                                        width: SizeConfig.kDefaultSize * 10,
                                        height: SizeConfig.kDefaultSize * 10,
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
                        _timelineProvider.timelineData[timelineIndex].comments,
                    comment: comments != null
                        ? comments.length > 0
                            ? comments[0]
                            : TimelinePostComments()
                        : TimelinePostComments(),
                    commentButtonCallback: () async {
                      await commentBottomSheet(
                        context,
                        comments: comments ?? [],
                        postID: _timelineProvider
                            .timelineData[timelineIndex].postId
                            .toString(),
                        timelineIndex: timelineIndex,
                        totalLikes: reactions.length,
                      );
                      setState(() {});
                    },
                    feelings: _timelineProvider
                        .timelineData[timelineIndex].postFeeling,
                    timelineIndex: timelineIndex,
                    shareButtonCallback: () {
                      shareBottomSheet(
                        context,
                        postID: _timelineProvider
                            .timelineData[timelineIndex].postId
                            .toString(),
                      );
                    },
                    postSticker: _timelineProvider
                        .timelineData[timelineIndex].postSticker,
                    postID: _timelineProvider.timelineData[timelineIndex].id
                        .toString(),
                    moreButtonCallback: () {
                      print(_timelineProvider.timelineData[timelineIndex]);
                      showPostMenuBottomSheet(
                        context,
                        postID: _timelineProvider.timelineData[timelineIndex].id
                            .toString(),
                        timelineData:
                            _timelineProvider.timelineData[timelineIndex],
                      );
                    },
                    reactionCount:
                        reactions.length == 0 ? null : reactions.length,
                    description: postText,
                    iframe: iframe,
                    album: album,
                    videoURL: videoURL,
                    imageURL:
                        _timelineProvider.timelineData[timelineIndex].album !=
                                null
                            ? imageURL
                            : null,
                    name: _timelineProvider.timelineData[timelineIndex].page !=
                            null
                        ? _timelineProvider
                            .timelineData[timelineIndex].page.pageTitle
                        : _timelineProvider.timelineData[timelineIndex].user !=
                                null
                            ? _timelineProvider.timelineData[timelineIndex].user
                                            .firstName !=
                                        null &&
                                    _timelineProvider
                                            .timelineData[timelineIndex]
                                            .user
                                            .lastName !=
                                        null
                                ? _timelineProvider.timelineData[timelineIndex]
                                        .user.firstName +
                                    " " +
                                    _timelineProvider
                                        .timelineData[timelineIndex]
                                        .user
                                        .lastName
                                : _timelineProvider.timelineData[timelineIndex]
                                            .user.username !=
                                        null
                                    ? _timelineProvider
                                        .timelineData[timelineIndex]
                                        .user
                                        .username
                                    : " "
                            : " ",
                    profileAvatar: _timelineProvider
                                .timelineData[timelineIndex].page !=
                            null
                        ? _timelineProvider
                            .timelineData[timelineIndex].page.avatar
                        : _timelineProvider.timelineData[timelineIndex].user !=
                                null
                            ? _timelineProvider
                                .timelineData[timelineIndex].user.avatar
                            : null,
                    reaction: likeReaction,
                    postType:
                        _timelineProvider.timelineData[timelineIndex].type ??
                            "",
                    option:
                        _timelineProvider.timelineData[timelineIndex].options ??
                            [],
                    showCommentBottomSheet: () async {
                      await commentBottomSheet(
                        context,
                        comments: comments ?? [],
                        postID: _timelineProvider
                            .timelineData[timelineIndex].postId
                            .toString(),
                        timelineIndex: timelineIndex,
                        totalLikes: reactions.length,
                      );
                      setState(() {});
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
