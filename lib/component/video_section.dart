import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youonline/component/profile_header.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:youonline/widgets/comment_bottom_sheet.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';

// ignore: must_be_immutable
class VideoSection extends StatefulWidget {
  bool isView;

  final String userId;

  final String username, fullName, profileAvatar, profileCover;

  VideoSection({
    Key key,
    this.userId,
    this.username,
    this.fullName,
    this.profileAvatar,
    this.profileCover,
  }) : super(key: key);
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
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
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
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
              FutureBuilder<Timeline>(
                future: _userProvider.getVideoPosts(userId: widget.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Wrap(
                      children: List.generate(
                        snapshot.data.posts.data.length,
                        (timelineIndex) {
                          List<TimelineData> timelineData =
                              snapshot.data.posts.data;
                          List<TimelinePostComments> comments = [];

                          comments =
                              timelineData[timelineIndex]?.comments ?? [];

                          String imageURL;
                          String iframe;
                          String videoURL;
                          String postText;

                          bool shared = false;

                          if (timelineData[timelineIndex].sharedBy != null) {
                            shared = true;
                          } else {
                            shared = false;
                          }

                          List<Album> album = [];

                          if (shared) {
                            if (timelineData[timelineIndex].sharedBy.postText !=
                                    null &&
                                timelineData[timelineIndex]
                                    .sharedBy
                                    .postText
                                    .isNotEmpty) {
                              postText = timelineData[timelineIndex]
                                      .sharedBy
                                      .postText ??
                                  "";
                            }
                            if (timelineData[timelineIndex]
                                        .sharedBy
                                        .postYoutube !=
                                    null &&
                                timelineData[timelineIndex]
                                    .sharedBy
                                    .postYoutube
                                    .isNotEmpty) {
                              iframe = timelineData[timelineIndex]
                                  .sharedBy
                                  .postYoutube;
                            }
                            if (timelineData[timelineIndex].sharedBy.album !=
                                    null &&
                                timelineData[timelineIndex]
                                        .sharedBy
                                        .album
                                        .length >
                                    0) {
                              album =
                                  timelineData[timelineIndex].sharedBy.album;
                            }
                            if (timelineData[timelineIndex].sharedBy.postFile !=
                                    null &&
                                timelineData[timelineIndex]
                                    .sharedBy
                                    .postFile
                                    .isNotEmpty) {
                              if (timelineData[timelineIndex]
                                  .sharedBy
                                  .postFile
                                  .contains(".mp4")) {
                                videoURL = timelineData[timelineIndex]
                                    .sharedBy
                                    .postFile;
                              } else {
                                imageURL = timelineData[timelineIndex]
                                    .sharedBy
                                    .postFile;
                              }
                            } else if (timelineData[timelineIndex]
                                        .sharedBy
                                        .postLink !=
                                    null &&
                                timelineData[timelineIndex]
                                    .sharedBy
                                    .postLink
                                    .isNotEmpty) {
                              {
                                if (timelineData[timelineIndex]
                                    .sharedBy
                                    .postLink
                                    .contains(".mp4")) {
                                  videoURL = timelineData[timelineIndex]
                                      .sharedBy
                                      .postLink;
                                } else if (timelineData[timelineIndex]
                                            .sharedBy
                                            .postLinkImage !=
                                        null &&
                                    timelineData[timelineIndex]
                                        .sharedBy
                                        .postLinkImage
                                        .isNotEmpty) {
                                  imageURL = timelineData[timelineIndex]
                                      .sharedBy
                                      .postLinkImage;
                                } else {
                                  imageURL = timelineData[timelineIndex]
                                      .sharedBy
                                      .postLink;
                                }
                              }
                            } else if (timelineData[timelineIndex]
                                        .sharedBy
                                        .postYoutube !=
                                    null &&
                                timelineData[timelineIndex]
                                    .sharedBy
                                    .postYoutube
                                    .isNotEmpty) {
                              iframe = timelineData[timelineIndex]
                                  .sharedBy
                                  .postYoutube;
                            }
                          } else {
                            if (timelineData[timelineIndex].postYoutube !=
                                    null &&
                                timelineData[timelineIndex]
                                    .postYoutube
                                    .isNotEmpty) {
                              iframe = timelineData[timelineIndex].postYoutube;
                            }
                            if (timelineData[timelineIndex].album != null &&
                                timelineData[timelineIndex].album.length > 0) {
                              album = timelineData[timelineIndex].album;
                            }
                            if (timelineData[timelineIndex].postFile != null &&
                                timelineData[timelineIndex]
                                    .postFile
                                    .isNotEmpty) {
                              if (timelineData[timelineIndex]
                                  .postFile
                                  .contains("mp4")) {
                                videoURL = timelineData[timelineIndex].postFile;
                              } else {
                                imageURL = timelineData[timelineIndex].postFile;
                              }
                            } else if (timelineData[timelineIndex].postLink !=
                                    null &&
                                timelineData[timelineIndex]
                                    .postLink
                                    .isNotEmpty) {
                              if (timelineData[timelineIndex]
                                  .postLink
                                  .contains("mp4")) {
                                videoURL = timelineData[timelineIndex].postLink;
                              } else if (timelineData[timelineIndex]
                                          .postLinkImage !=
                                      null &&
                                  timelineData[timelineIndex]
                                      .postLinkImage
                                      .isNotEmpty) {
                                imageURL =
                                    timelineData[timelineIndex].postLinkImage;
                              } else {
                                imageURL = timelineData[timelineIndex].postLink;
                              }
                            } else if (timelineData[timelineIndex]
                                        .postYoutube !=
                                    null &&
                                timelineData[timelineIndex]
                                    .postYoutube
                                    .isNotEmpty) {
                              iframe = timelineData[timelineIndex].postYoutube;
                            }
                            if (timelineData[timelineIndex].postText != null &&
                                timelineData[timelineIndex]
                                    .postText
                                    .isNotEmpty) {
                              postText = timelineData[timelineIndex].postText;
                            }
                          }

                          List<Reactions> reactions = [];

                          if (timelineData[timelineIndex].reactions != null &&
                              timelineData[timelineIndex].reactions.length >
                                  0) {
                            reactions = timelineData[timelineIndex].reactions;
                            likeReaction =
                                reactions[reactionIndex ?? 0].reaction;
                          } else {
                            reactions = [];
                          }
                          print(imageURL);
                          print(timelineData[timelineIndex].album);

                          return HomePostWidget(
                            page: timelineData[timelineIndex].page,
                            user: timelineData[timelineIndex].user,
                            group: timelineData[timelineIndex].group,
                            isPostShared: shared,
                            time: timelineData[timelineIndex].time,
                            postColor:
                                timelineData[timelineIndex].colored != null
                                    ? timelineData[timelineIndex].colored
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
                                      width: MediaQuery.of(context).size.width -
                                          20,
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
                                                } else if (reactions.length >
                                                    0) {
                                                  reactions.forEach((element) {
                                                    if (element.postId ==
                                                            timelineData[
                                                                    timelineIndex]
                                                                .id &&
                                                        element.user.userId ==
                                                            _userProvider
                                                                .user.userId) {
                                                      setState(() {
                                                        reactionIndex =
                                                            reactions.indexOf(
                                                                element);
                                                      });
                                                    }
                                                  });
                                                }
                                                Reactions reaction =
                                                    Reactions();
                                                User user = User();
                                                reaction.postId =
                                                    timelineData[timelineIndex]
                                                        .id;
                                                user.userId =
                                                    _userProvider.user.userId;
                                                user.email =
                                                    _userProvider.user.email;

                                                user.avatar =
                                                    _userProvider.user.avatar;
                                                user.username =
                                                    _userProvider.user.username;
                                                if (_userProvider
                                                            .user.firstName !=
                                                        null &&
                                                    _userProvider
                                                            .user.lastName !=
                                                        null) {
                                                  user.firstName = _userProvider
                                                      .user.firstName;
                                                  user.lastName = _userProvider
                                                      .user.lastName;
                                                }

                                                reaction.user = user;
                                                reaction.reaction =
                                                    emojis[emojiIndex]
                                                        .replaceAll(
                                                            "assets/images/",
                                                            "")
                                                        .replaceAll(".gif", "");

                                                if (reactionIndex != null) {
                                                  if (reactions.length > 0) {
                                                    setState(() {
                                                      reactions.removeAt(
                                                          reactionIndex);
                                                      reactions.insert(
                                                          reactionIndex,
                                                          reaction);
                                                      timelineData[
                                                                  timelineIndex]
                                                              .reactions =
                                                          reactions;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      reactions.add(reaction);
                                                      timelineData[
                                                                  timelineIndex]
                                                              .reactions =
                                                          reactions;
                                                    });
                                                  }
                                                } else {
                                                  setState(() {
                                                    reactions.add(reaction);
                                                    timelineData[timelineIndex]
                                                        .reactions = reactions;
                                                  });
                                                }
                                                Navigator.pop(context);
                                                Provider.of<TimelineProvider>(
                                                        context,
                                                        listen: false)
                                                    .likePost(
                                                  context,
                                                  postID: reaction.postId
                                                      .toString(),
                                                  reaction: reaction.reaction,
                                                );
                                              },
                                              child: SizedBox(
                                                width: SizeConfig.kDefaultSize *
                                                    10,
                                                height:
                                                    SizeConfig.kDefaultSize *
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
                            comments: timelineData[timelineIndex].comments,
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
                            feelings: timelineData[timelineIndex].postFeeling,
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
                            postID: timelineData[timelineIndex].id.toString(),
                            moreButtonCallback: () {
                              showPostMenuBottomSheet(
                                context,
                                postID:
                                    timelineData[timelineIndex].id.toString(),
                                timelineData: timelineData[timelineIndex],
                              );
                            },
                            reactionCount:
                                reactions.length == 0 ? null : reactions.length,
                            description: postText,
                            iframe: iframe,
                            album: album,
                            videoURL: videoURL,
                            imageURL: timelineData[timelineIndex].album != null
                                ? imageURL
                                : null,
                            name: timelineData[timelineIndex].page != null
                                ? timelineData[timelineIndex].page.pageTitle
                                : timelineData[timelineIndex].user != null
                                    ? timelineData[timelineIndex]
                                                    .user
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
                                            ? timelineData[timelineIndex]
                                                .user
                                                .username
                                            : " "
                                    : " ",
                            profileAvatar: timelineData[timelineIndex].page !=
                                    null
                                ? timelineData[timelineIndex].page.avatar
                                : timelineData[timelineIndex].user != null
                                    ? timelineData[timelineIndex].user.avatar
                                    : null,
                            reaction: likeReaction,
                            postType: timelineData[timelineIndex].type ?? "",
                            option: timelineData[timelineIndex].options ?? [],
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
        ),
      ),
    );
  }
}
