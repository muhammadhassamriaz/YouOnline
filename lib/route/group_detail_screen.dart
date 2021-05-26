import 'package:youonline/model/group_data.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/search_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/comment_bottom_sheet.dart';
import 'package:youonline/widgets/group_bottom_sheet.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroupDetailScreen extends StatefulWidget {
  final String groupTitle, groupAvatar, groupCoverPhoto, groupInfo;

  final int groupId;

  GroupDetailScreen({
    Key key,
    @required this.groupTitle,
    @required this.groupAvatar,
    @required this.groupCoverPhoto,
    @required this.groupInfo,
    @required this.groupId,
  }) : super(key: key);

  @override
  _GroupDetailScreenState createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  TextEditingController _postTextEditingController = TextEditingController();

  TextEditingController _commentTextEditingController = TextEditingController();
  List<PostReaction> postReactions = [];
  String likeReaction;
  List<String> emojis = [
    likeGIF,
    loveGIF,
    happyGIF,
    sadGIF,
    angryGIF,
    wowGIF,
  ];
  int reactionIndex;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 1,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Expanded(
                    child: Text(
                      widget.groupTitle,
                      style: subheadingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                      maxLines: 1,
                    ),
                  ),
                  YouOnlineIconButton(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchScreen(),
                        ),
                      );
                    },
                    icon: Icons.search,
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 3,
                  ),
                  YouOnlineIconButton(
                    callback: () {
                      groupBottomSheet(
                        context,
                        groupId: widget.groupId.toString(),
                      );
                    },
                    icon: Icons.more_horiz,
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .25,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: widget.groupCoverPhoto ?? groupCover,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * .02,
                          ),
                          Text(
                            widget.groupTitle ?? 'UI/UX Design Projects',
                            style: subheadingTextStyle.copyWith(
                              fontSize: width * .045,
                            ),
                            textScaleFactor: 1,
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          RichText(
                            textScaleFactor: 1,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.groupInfo ?? 'Public Group',
                                  style: labelTextStyle.copyWith(
                                    fontSize: width * .035,
                                  ),
                                ),
                                // TextSpan(
                                //   text: ' 102.6K',
                                //   style: labelTextStyle.copyWith(
                                //     fontSize: width * .035,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: ' members',
                                //   style: labelTextStyle.copyWith(
                                //     fontSize: width * .035,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       height: height * .08,
                          //       width: width * .6,
                          //       child: Image.asset(
                          //         groupMembers,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: width * .03,
                          //     ),
                          //     Container(
                          //       width: width / 4,
                          //       height: height * .06,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(
                          //           width * .07,
                          //         ),
                          //       ),
                          //       clipBehavior: Clip.antiAliasWithSaveLayer,
                          //       child: YouOnlineButton(
                          //         callback: () {},
                          //         title: "Invite",
                          //         textSize: width * .04,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: height * .02,
                          ),
                        ],
                      ),
                    ),
                    // Divider(
                    //   thickness: width * .02,
                    // ),
                    // Container(
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding:
                    //             EdgeInsets.symmetric(horizontal: width * .04),
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             SizedBox(
                    //               width: width * .14,
                    //               height: width * .14,
                    //               child: Image.asset(
                    //                 Assets.PROFILE_AVATAR,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               width: width * .02,
                    //             ),
                    //             Flexible(
                    //               child: MediaQuery(
                    //                 data: MediaQuery.of(context).copyWith(
                    //                   textScaleFactor: 1,
                    //                 ),
                    //                 child: TextField(
                    //                   onTap: () {
                    //                     WidgetsBinding
                    //                         .instance.focusManager.primaryFocus
                    //                         ?.unfocus();
                    //                   },
                    //                   autofocus: false,
                    //                   readOnly: true,
                    //                   controller: _postTextEditingController,
                    //                   maxLines: 4,
                    //                   decoration: InputDecoration(
                    //                     hintStyle: hintTextStyle.copyWith(
                    //                       fontSize: width * .04,
                    //                     ),
                    //                     hintText: 'Create a public post...',
                    //                     border: InputBorder.none,
                    //                   ),
                    //                   style: labelTextStyle.copyWith(
                    //                     fontSize: width * .04,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: height * .01,
                    //       ),
                    //       Divider(
                    //         color: Colors.grey[300],
                    //         height: height * .003,
                    //       ),
                    //       Row(
                    //         children: [
                    //           Expanded(
                    //             child: YouOnlineTextButton(
                    //               assetImage: Assets.UPLOAD_IMAGE_ICON,
                    //               title: 'Photo',
                    //               color: searchContainerColor,
                    //               callback: () {},
                    //             ),
                    //           ),
                    //           Container(
                    //             height: height * .03,
                    //             width: width * .002,
                    //             color: Colors.grey[300],
                    //           ),
                    //           Expanded(
                    //             child: YouOnlineTextButton(
                    //               title: 'Poll',
                    //               assetImage: Assets.CREATE_POLL_ICON,
                    //               color: yellowColor,
                    //               callback: () {},
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Divider(
                      thickness: width * .02,
                    ),
                    FutureBuilder<SingleGroupData>(
                      future: _userProvider.singleGroupData(
                          groupId: widget.groupId.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.success) {
                            List<TimelineData> timelineData =
                                snapshot.data.posts.data;
                            if (timelineData != null &&
                                timelineData.length > 0) {
                              return Wrap(
                                children: List.generate(
                                  timelineData.length,
                                  (timelineIndex) {
                                    List<TimelinePostComments> comments = [];

                                    comments =
                                        timelineData[timelineIndex]?.comments ??
                                            [];

                                    String imageURL;
                                    String iframe;
                                    String videoURL;
                                    String postText;

                                    bool shared = false;

                                    if (timelineData[timelineIndex].sharedBy !=
                                        null) {
                                      shared = true;
                                    } else {
                                      shared = false;
                                    }

                                    bool urlExist = false;
                                    List<Album> album = [];

                                    if (shared) {
                                      if (timelineData[timelineIndex]
                                                  .sharedBy
                                                  .postText !=
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
                                      if (timelineData[timelineIndex]
                                                  .sharedBy
                                                  .album !=
                                              null &&
                                          timelineData[timelineIndex]
                                                  .sharedBy
                                                  .album
                                                  .length >
                                              0) {
                                        album = timelineData[timelineIndex]
                                            .sharedBy
                                            .album;
                                      }
                                      if (timelineData[timelineIndex]
                                                  .sharedBy
                                                  .postFile !=
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
                                            videoURL =
                                                timelineData[timelineIndex]
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
                                            imageURL =
                                                timelineData[timelineIndex]
                                                    .sharedBy
                                                    .postLinkImage;
                                            urlExist = true;
                                          } else {
                                            imageURL =
                                                timelineData[timelineIndex]
                                                    .sharedBy
                                                    .postLink;
                                            urlExist = true;
                                          }

                                          urlExist = true;
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
                                        urlExist = true;
                                      }
                                    } else {
                                      if (timelineData[timelineIndex]
                                                  .postYoutube !=
                                              null &&
                                          timelineData[timelineIndex]
                                              .postYoutube
                                              .isNotEmpty) {
                                        iframe = timelineData[timelineIndex]
                                            .postYoutube;
                                      }
                                      if (timelineData[timelineIndex].album !=
                                              null &&
                                          timelineData[timelineIndex]
                                                  .album
                                                  .length >
                                              0) {
                                        album =
                                            timelineData[timelineIndex].album;
                                      }
                                      if (timelineData[timelineIndex]
                                                  .postFile !=
                                              null &&
                                          timelineData[timelineIndex]
                                              .postFile
                                              .isNotEmpty) {
                                        if (timelineData[timelineIndex]
                                            .postFile
                                            .contains("mp4")) {
                                          videoURL = timelineData[timelineIndex]
                                              .postFile;
                                        } else {
                                          imageURL = timelineData[timelineIndex]
                                              .postFile;
                                          urlExist = true;
                                        }
                                      } else if (timelineData[timelineIndex]
                                                  .postLink !=
                                              null &&
                                          timelineData[timelineIndex]
                                              .postLink
                                              .isNotEmpty) {
                                        if (timelineData[timelineIndex]
                                            .postLink
                                            .contains("mp4")) {
                                          videoURL = timelineData[timelineIndex]
                                              .postLink;
                                          urlExist = true;
                                        } else if (timelineData[timelineIndex]
                                                    .postLinkImage !=
                                                null &&
                                            timelineData[timelineIndex]
                                                .postLinkImage
                                                .isNotEmpty) {
                                          imageURL = timelineData[timelineIndex]
                                              .postLinkImage;
                                          urlExist = true;
                                        } else {
                                          imageURL = timelineData[timelineIndex]
                                              .postLink;
                                          urlExist = true;
                                        }
                                      } else if (timelineData[timelineIndex]
                                                  .postYoutube !=
                                              null &&
                                          timelineData[timelineIndex]
                                              .postYoutube
                                              .isNotEmpty) {
                                        iframe = timelineData[timelineIndex]
                                            .postYoutube;
                                        urlExist = true;
                                      }
                                      if (timelineData[timelineIndex]
                                                  .postText !=
                                              null &&
                                          timelineData[timelineIndex]
                                              .postText
                                              .isNotEmpty) {
                                        postText = timelineData[timelineIndex]
                                            .postText;
                                      }
                                    }

                                    List<Reactions> reactions = [];

                                    if (timelineData[timelineIndex].reactions !=
                                            null &&
                                        timelineData[timelineIndex]
                                                .reactions
                                                .length >
                                            0) {
                                      reactions =
                                          timelineData[timelineIndex].reactions;
                                      likeReaction =
                                          reactions[reactionIndex ?? 0]
                                              .reaction;
                                    } else {
                                      reactions = [];
                                    }
                                    print(imageURL);
                                    print(timelineData[timelineIndex].album);

                                    return HomePostWidget(
                                      isPostShared: shared,
                                      time: timelineData[timelineIndex].time,
                                      user: timelineData[timelineIndex].user,
                                      page: timelineData[timelineIndex].page,
                                      group: timelineData[timelineIndex].group,
                                      postColor: timelineData[timelineIndex]
                                                  .colored !=
                                              null
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
                                                    SizeConfig.kDefaultSize *
                                                        20,
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
                                                          if (reactions ==
                                                              null) {
                                                            reactions = [];
                                                          } else if (reactions
                                                                  .length >
                                                              0) {
                                                            reactions.forEach(
                                                                (element) {
                                                              if (element.postId ==
                                                                      timelineData[
                                                                              timelineIndex]
                                                                          .id &&
                                                                  element.user
                                                                          .userId ==
                                                                      _userProvider
                                                                          .user
                                                                          .userId) {
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
                                                              timelineData[
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
                                                              _userProvider.user
                                                                  .username;
                                                          if (_userProvider.user
                                                                      .firstName !=
                                                                  null &&
                                                              _userProvider.user
                                                                      .lastName !=
                                                                  null) {
                                                            user.firstName =
                                                                _userProvider
                                                                    .user
                                                                    .firstName;
                                                            user.lastName =
                                                                _userProvider
                                                                    .user
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
                                                            if (reactions
                                                                    .length >
                                                                0) {
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
                                                                reactions.add(
                                                                    reaction);
                                                                timelineData[
                                                                            timelineIndex]
                                                                        .reactions =
                                                                    reactions;
                                                              });
                                                            }
                                                          } else {
                                                            setState(() {
                                                              reactions.add(
                                                                  reaction);
                                                              timelineData[
                                                                          timelineIndex]
                                                                      .reactions =
                                                                  reactions;
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                          Provider.of<TimelineProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .likePost(
                                                            context,
                                                            postID: reaction
                                                                .postId
                                                                .toString(),
                                                            reaction: reaction
                                                                .reaction,
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
                                      feelings: timelineData[timelineIndex]
                                          .postFeeling,
                                      timelineIndex: timelineIndex,
                                      shareButtonCallback: () {
                                        shareBottomSheet(
                                          context,
                                          postID: timelineData[timelineIndex]
                                              .postId
                                              .toString(),
                                        );
                                      },
                                      postSticker: timelineData[timelineIndex]
                                          .postSticker,
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
                                      name: timelineData[timelineIndex].page !=
                                              null
                                          ? timelineData[timelineIndex]
                                              .page
                                              .pageTitle
                                          : timelineData[timelineIndex].user !=
                                                  null
                                              ? timelineData[timelineIndex]
                                                              .user
                                                              .firstName !=
                                                          null &&
                                                      timelineData[
                                                                  timelineIndex]
                                                              .user
                                                              .lastName !=
                                                          null
                                                  ? timelineData[timelineIndex]
                                                          .user
                                                          .firstName +
                                                      " " +
                                                      timelineData[
                                                              timelineIndex]
                                                          .user
                                                          .lastName
                                                  : timelineData[timelineIndex]
                                                              .user
                                                              .username !=
                                                          null
                                                      ? timelineData[
                                                              timelineIndex]
                                                          .user
                                                          .username
                                                      : " "
                                              : " ",
                                      profileAvatar: timelineData[timelineIndex]
                                                  .page !=
                                              null
                                          ? timelineData[timelineIndex]
                                              .page
                                              .avatar
                                          : timelineData[timelineIndex].user !=
                                                  null
                                              ? timelineData[timelineIndex]
                                                  .user
                                                  .avatar
                                              : null,
                                      reaction: likeReaction,
                                      postType:
                                          timelineData[timelineIndex].type ??
                                              "",
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
                              );
                            } else {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: height * .2,
                                  ),
                                  Center(
                                    child: Text(
                                      "No post found",
                                      style: labelTextStyle.copyWith(
                                        fontSize: width * .04,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                  height: height * .2,
                                ),
                                Center(
                                  child: Text(
                                    "You need to join the group to see all posts.",
                                    style: labelTextStyle.copyWith(
                                      fontSize: width * .04,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
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
          ],
        ),
      ),
    );
  }
}
