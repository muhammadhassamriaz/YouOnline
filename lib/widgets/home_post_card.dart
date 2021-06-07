import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:provider/provider.dart';
import 'package:youonline/model/colors.dart';
import 'package:youonline/model/page.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/model/uploader.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/poll_widget.dart';
import 'package:youonline/widgets/post_actions.dart';
import 'package:youonline/widgets/post_card_header.dart';
import 'package:youonline/widgets/post_colored_container_text.dart';
import 'package:youonline/widgets/post_comment_section.dart';
import 'package:youonline/widgets/post_comments.dart';
import 'package:youonline/widgets/post_comments_likes_count_widget.dart';
import 'package:youonline/widgets/post_multiple_images.dart';
import 'package:youonline/widgets/post_single_picture.dart';
import 'package:youonline/widgets/video_player_widget.dart';
import 'package:youonline/widgets/youtube_player.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:universal_html/html.dart' as html;
import 'package:path/path.dart' as path;

// ignore: must_be_immutable
class HomePostWidget extends StatelessWidget {
  final String description;
  final String imageURL;
  final String profileAvatar;
  final String name;
  final String iframe;
  final VoidCallback likedButtonOnPressed;
  final VoidCallback shareButtonCallback;
  final VoidCallback commentButtonCallback;
  final VoidCallback moreButtonCallback;
  final String postID;
  final String videoURL;
  final bool isAlbum;
  final bool isView;
  final TimelinePostComments comment;
  final bool boolCheckComment;
  final List<TimelinePostComments> comments;
  final int reactionCount;
  String reaction;
  final bool isPostShared;
  final String time;
  List<Album> album;
  final int timelineIndex;
  ColorPostTypes postColor;
  final String postType;
  final List<Options> option;
  final Function showCommentBottomSheet;
  final String feelings;
  final String postSticker;
  final User user;
  final TimelinePage page;
  final Group group;
  final String videoThumbnail;

  HomePostWidget({
    Key key,
    @required this.description,
    @required this.imageURL,
    @required this.profileAvatar,
    @required this.name,
    @required this.iframe,
    this.isView = false,
    this.isAlbum = false,
    this.likedButtonOnPressed,
    this.shareButtonCallback,
    this.moreButtonCallback,
    @required this.commentButtonCallback,
    this.videoURL,
    @required this.comment,
    @required this.postID,
    @required this.comments,
    this.boolCheckComment = false,
    @required this.reactionCount,
    @required this.reaction,
    @required this.isPostShared,
    @required this.time,
    @required this.album,
    @required this.postColor,
    @required this.timelineIndex,
    @required this.postType,
    @required this.option,
    @required this.showCommentBottomSheet,
    @required this.feelings,
    @required this.postSticker,
    @required this.group,
    @required this.page,
    @required this.user,
    @required this.videoThumbnail,
  }) : super(key: key);

  String _parseHtmlString(String htmlString) {
    var text = html.Element.span()..appendHtml(htmlString);
    return text.innerText;
  }

  TextEditingController commentTextEditingController = TextEditingController();
  String commentt = "";
  File imageFile;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              PostCardHeader(
                profileAvatar: profileAvatar,
                name: name,
                isView: isView,
                isPostShared: isPostShared,
                time: time,
                feelings: feelings,
                callback: () {
                  moreButtonCallback();
                },
                page: page,
                group: group,
                user: user,
              ),
              if (description != null)
                if (postColor != null && !postType.contains("poll"))
                  PostColorContainer(
                    color1: Color(
                        int.tryParse(postColor.color1.replaceAll("#", "0xff"))),
                    color2: Color(
                        int.tryParse(postColor.color2.replaceAll("#", "0xff"))),
                    textColor: Color(int.tryParse(
                        postColor.textColor.replaceAll("#", "0xff"))),
                    description: _parseHtmlString(description),
                  )
                else if (!postType.contains("poll"))
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            _parseHtmlString(description),
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 3.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (postType.contains("poll"))
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            _parseHtmlString(description),
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 5.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              SizedBox(height: SizeConfig.kDefaultSize * 2),
              PollWidget(
                options: option,
              ),
              if (imageURL != null && description != null ||
                  description != null && iframe != null ||
                  description != null && isAlbum != null ||
                  videoURL != null &&
                      description != null &&
                      !postType.contains("poll") &&
                      postSticker != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
              if (imageURL != null && !postType.contains("poll"))
                Container(
                  height: height * .4,
                  child: PostSinglePicture(
                    shareButtonCallback: () {
                      shareButtonCallback();
                    },
                    commentButtonCallback: () {
                      commentButtonCallback();
                    },
                    likedButtonOnPressed: () {
                      likedButtonOnPressed();
                    },
                    reaction: reaction,
                    reactionCount: reactionCount,
                    commentCount: comments != null
                        ? comments.length > 0
                            ? comments.length
                            : 0
                        : 0,
                    imageURL: imageURL,
                  ),
                )
              else if (postSticker != null && !postType.contains("poll"))
                Container(
                  height: height * .4,
                  child: PostSinglePicture(
                    shareButtonCallback: () {
                      shareButtonCallback();
                    },
                    commentButtonCallback: () {
                      commentButtonCallback();
                    },
                    likedButtonOnPressed: () {
                      likedButtonOnPressed();
                    },
                    reaction: reaction,
                    reactionCount: reactionCount,
                    commentCount: comments != null
                        ? comments.length > 0
                            ? comments.length
                            : 0
                        : 0,
                    imageURL: postSticker,
                  ),
                )
              else if (iframe != null && !postType.contains("poll"))
                Container(
                  child: YouTubeVideoPlayer(
                    iframe: iframe,
                  ),
                )
              else if (album != null &&
                  album.length > 0 &&
                  !postType.contains("poll"))
                Container(
                  child: PostMultipleImages(
                    shareButtonCallback: () {
                      shareButtonCallback();
                    },
                    commentButtonCallback: () {
                      commentButtonCallback();
                    },
                    likedButtonOnPressed: () {
                      likedButtonOnPressed();
                    },
                    reaction: reaction,
                    reactionCount: reactionCount,
                    commentCount: comments != null
                        ? comments.length > 0
                            ? comments.length
                            : 0
                        : 0,
                    album: album,
                  ),
                )
              else if (videoURL != null &&
                  !postType.contains("poll") &&
                  videoURL.isNotEmpty)
                Container(
                  height: height * .4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.kDefaultSize * 5,
                    ),
                    child: VideoPlayerWidget(
                      videoURL: videoURL,
                      videoThumbnail: videoThumbnail,
                    ),
                  ),
                ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 1.5,
              ),
              PostCommentsLikesWidget(
                isView: isView,
                commentButtonCallback: () {
                  commentButtonCallback();
                },
                reaction: reaction,
                reactionCount: reactionCount,
                commentCount: comments != null
                    ? comments.length > 0
                        ? comments.length
                        : 0
                    : 0,
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 01,
              ),
              Divider(
                color: Colors.grey[300],
                height: SizeConfig.kDefaultSize * .03,
              ),
              PostCallbackActions(
                shareButtonCallback: () {
                  shareButtonCallback();
                },
                commentButtonCallback: () {
                  commentButtonCallback();
                },
                likedButtonOnPressed: () {
                  likedButtonOnPressed();
                },
                isView: isView,
              ),
              if (comment?.text != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 02,
                ),
              if (comment != null)
                if (comment.text != null)
                  if (comment.user.firstName != null &&
                      comment.user.lastName != null)
                    PostCommentsWidget(
                      comment: comment?.text,
                      username:
                          comment.user.firstName + " " + comment.user.lastName,
                      replies: comment.replies ?? [],
                      commentID: comment.id.toString(),
                      imageURL: comment.user.avatar,
                      postComment: comment,
                      postId: int.tryParse(postID),
                      timelineIndex: timelineIndex,
                      showCommentBottomSheet: () {
                        showCommentBottomSheet();
                      },
                    )
                  else
                    PostCommentsWidget(
                      comment: comment?.text,
                      username: comment.user.username,
                      replies: comment.replies ?? [],
                      commentID: comment.id.toString(),
                      imageURL: comment.user.avatar,
                      postComment: comment,
                      postId: int.tryParse(postID),
                      timelineIndex: timelineIndex,
                      showCommentBottomSheet: () {
                        showCommentBottomSheet();
                      },
                    ),
              if (comment?.text != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 04,
                ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 5,
        ),
        // PostCommentSection(
        //   imageURL: _userProvider.user.avatar,
        //   isView:  isView,
        //   commentTextEditingController: commentTextEditingController,
        //   postID:  postID,
        //   onChangedCallback: (value) {
        //     setState(() {
        //       comment = value;
        //     });
        //   },
        //   imageUploadCallback: () async {
        //     TimelinePostComments com = TimelinePostComments();

        //     User user = User();

        //     // await ImagePicker.pickImage(source: ImageSource.gallery)
        //     //     .then((value) async {

        //     // });
        //     await ImagePicker.pickImage(
        //       source: ImageSource.gallery,
        //       imageQuality: 70,
        //     ).then((value) async {
        //       setState(() {
        //         user.userId = _userProvider.user.userId;
        //         user.firstName = _userProvider.user.firstName;
        //         user.lastName = _userProvider.user.lastName;
        //         user.username = _userProvider.user.username;
        //         user.email = _userProvider.user.email;
        //         user.avatar = _userProvider.user.avatar;
        //         com.user = user;
        //         com.imageFile = value;
        //          comments.add(com);
        //       });
        //       await uploader.enqueue(
        //         url: "https://api.youonline.site/api/add-comment",
        //         files: [
        //           FileItem(
        //             filename: path.basename(value.path),
        //             savedDir: path.dirname(value.path),
        //             fieldname: "image",
        //           )
        //         ],
        //         method: UploadMethod.POST,
        //         headers: <String, String>{
        //           "Accept": "application/json",
        //           "Authorization":
        //               "Bearer ${_userProvider.userAuthenticationToken}",
        //         },
        //         data: {
        //           "post_id":  postID,
        //           "text": "",
        //         },
        //         showNotification: true,
        //         tag: "Uploading Image",
        //       );
        //     });
        //   },
        //   comment: comment,
        //   onSubmitCallback: (value) {
        //     TimelinePostComments com = TimelinePostComments();
        //     if (value.isNotEmpty) {
        //       com.text = value;
        //       User user = User();
        //       user.userId = _userProvider.user.userId;
        //       user.firstName = _userProvider.user.firstName;
        //       user.lastName = _userProvider.user.lastName;
        //       user.username = _userProvider.user.username;
        //       user.email = _userProvider.user.email;
        //       user.avatar = _userProvider.user.avatar;
        //       com.user = user;

        //       setState(() {
        //          comments.add(com);
        //         commentTextEditingController.text = "";
        //         comment = "";
        //       });

        //       BotToast.showText(
        //         text: "Comments are updated!",
        //         textStyle: labelTextStyle.copyWith(
        //           fontSize: 12,
        //           color: Colors.black,
        //         ),
        //         contentColor: Colors.white,
        //       );
        //       _timelineProvider.addComment(
        //         context: context,
        //         comment: com.text,
        //         postID:  postID,
        //         userID: _userProvider.user.userId.toString(),
        //       );
        //        showCommentBottomSheet();
        //     }
        //   },
        // ),
      ],
    );
  }
}
