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
class HomePostWidget extends StatefulWidget {
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
  }) : super(key: key);

  @override
  _HomePostWidgetState createState() => _HomePostWidgetState();
}

class _HomePostWidgetState extends State<HomePostWidget> {
  FlutterUploader uploader = FlutterUploader();
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  Map<String, UploadItem> _tasks = {};

  @override
  void initState() {
    super.initState();
    _progressSubscription = uploader.progress.listen((progress) {
      final task = _tasks[progress.tag];
      print("progress: ${progress.progress} , tag: ${progress.tag}");
      if (task == null) return;
      if (task.isCompleted()) return;
      // setState(() {
      _tasks[progress.tag] =
          task.copyWith(progress: progress.progress, status: progress.status);
      // });
    });
    _resultSubscription = uploader.result.listen((result) {
      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");
      BotToast.showText(text: "Image Uploaded");

      final task = _tasks[result.tag];
      if (task == null) return;

      // setState(() {
      _tasks[result.tag] = task.copyWith(status: result.status);
      // });
    }, onError: (ex, stacktrace) {
      print("exception: $ex");
      print("stacktrace: $stacktrace" ?? "no stacktrace");
      final exp = ex as UploadException;
      final task = _tasks[exp.tag];
      if (task == null) return;

      // setState(() {
      _tasks[exp.tag] = task.copyWith(status: exp.status);
      // });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _progressSubscription?.cancel();
    _resultSubscription?.cancel();
  }

  String _parseHtmlString(String htmlString) {
    var text = html.Element.span()..appendHtml(htmlString);
    return text.innerText;
  }

  TextEditingController commentTextEditingController = TextEditingController();
  String comment = "";
  File imageFile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _timelineProvider = Provider.of<TimelineProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    double height = MediaQuery.of(context).size.height;

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
                profileAvatar: widget.profileAvatar,
                name: widget.name,
                isView: widget.isView,
                isPostShared: widget.isPostShared,
                time: widget.time,
                feelings: widget.feelings,
                callback: () {
                  widget.moreButtonCallback();
                },
                page: widget.page,
                group: widget.group,
                user: widget.user,
              ),
              if (widget.description != null)
                if (widget.postColor != null &&
                    !widget.postType.contains("poll"))
                  PostColorContainer(
                    color1: Color(int.tryParse(
                        widget.postColor.color1.replaceAll("#", "0xff"))),
                    color2: Color(int.tryParse(
                        widget.postColor.color2.replaceAll("#", "0xff"))),
                    textColor: Color(int.tryParse(
                        widget.postColor.textColor.replaceAll("#", "0xff"))),
                    description: _parseHtmlString(widget.description),
                  )
                else if (!widget.postType.contains("poll"))
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            _parseHtmlString(widget.description),
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 3.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (widget.postType.contains("poll"))
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            _parseHtmlString(widget.description),
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
                options: widget.option,
              ),
              if (widget.imageURL != null && widget.description != null ||
                  widget.description != null && widget.iframe != null ||
                  widget.description != null && widget.isAlbum != null ||
                  widget.videoURL != null &&
                      widget.description != null &&
                      !widget.postType.contains("poll") &&
                      widget.postSticker != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
              if (widget.imageURL != null && !widget.postType.contains("poll"))
                PostSinglePicture(
                  shareButtonCallback: () {
                    widget.shareButtonCallback();
                  },
                  commentButtonCallback: () {
                    widget.commentButtonCallback();
                  },
                  likedButtonOnPressed: () {
                    widget.likedButtonOnPressed();
                  },
                  reaction: widget.reaction,
                  reactionCount: widget.reactionCount,
                  commentCount: widget.comments != null
                      ? widget.comments.length > 0
                          ? widget.comments.length
                          : 0
                      : 0,
                  imageURL: widget.imageURL,
                )
              else if (widget.postSticker != null &&
                  !widget.postType.contains("poll"))
                PostSinglePicture(
                  shareButtonCallback: () {
                    widget.shareButtonCallback();
                  },
                  commentButtonCallback: () {
                    widget.commentButtonCallback();
                  },
                  likedButtonOnPressed: () {
                    widget.likedButtonOnPressed();
                  },
                  reaction: widget.reaction,
                  reactionCount: widget.reactionCount,
                  commentCount: widget.comments != null
                      ? widget.comments.length > 0
                          ? widget.comments.length
                          : 0
                      : 0,
                  imageURL: widget.postSticker,
                )
              else if (widget.iframe != null &&
                  !widget.postType.contains("poll"))
                YouTubeVideoPlayer(
                  iframe: widget.iframe,
                )
              else if (widget.album != null &&
                  widget.album.length > 0 &&
                  !widget.postType.contains("poll"))
                PostMultipleImages(
                  shareButtonCallback: () {
                    widget.shareButtonCallback();
                  },
                  commentButtonCallback: () {
                    widget.commentButtonCallback();
                  },
                  likedButtonOnPressed: () {
                    widget.likedButtonOnPressed();
                  },
                  reaction: widget.reaction,
                  reactionCount: widget.reactionCount,
                  commentCount: widget.comments != null
                      ? widget.comments.length > 0
                          ? widget.comments.length
                          : 0
                      : 0,
                  album: widget.album,
                )
              else if (widget.videoURL != null &&
                  !widget.postType.contains("poll") &&
                  widget.videoURL.isNotEmpty)
                Container(
                  height: height * .4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.kDefaultSize * 5,
                    ),
                    child: VideoPlayerWidget(
                      videoURL: widget.videoURL,
                    ),
                  ),
                ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 1.5,
              ),
              PostCommentsLikesWidget(
                isView: widget.isView,
                commentButtonCallback: () {
                  widget.commentButtonCallback();
                },
                reaction: widget.reaction,
                reactionCount: widget.reactionCount,
                commentCount: widget.comments != null
                    ? widget.comments.length > 0
                        ? widget.comments.length
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
                  widget.shareButtonCallback();
                },
                commentButtonCallback: () {
                  widget.commentButtonCallback();
                },
                likedButtonOnPressed: () {
                  widget.likedButtonOnPressed();
                },
                isView: widget.isView,
              ),
              if (widget.comment?.text != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 02,
                ),
              if (widget.comment != null)
                if (widget.comment.text != null)
                  if (widget.comment.user.firstName != null &&
                      widget.comment.user.lastName != null)
                    PostCommentsWidget(
                      comment: widget.comment?.text,
                      username: widget.comment.user.firstName +
                          " " +
                          widget.comment.user.lastName,
                      replies: widget.comment.replies ?? [],
                      commentID: widget.comment.id.toString(),
                      imageURL: widget.comment.user.avatar,
                      postComment: widget.comment,
                      postId: int.tryParse(widget.postID),
                      timelineIndex: widget.timelineIndex,
                      showCommentBottomSheet: () {
                        widget.showCommentBottomSheet();
                      },
                    )
                  else
                    PostCommentsWidget(
                      comment: widget.comment?.text,
                      username: widget.comment.user.username,
                      replies: widget.comment.replies ?? [],
                      commentID: widget.comment.id.toString(),
                      imageURL: widget.comment.user.avatar,
                      postComment: widget.comment,
                      postId: int.tryParse(widget.postID),
                      timelineIndex: widget.timelineIndex,
                      showCommentBottomSheet: () {
                        widget.showCommentBottomSheet();
                      },
                    ),
              if (widget.comment?.text != null)
                SizedBox(
                  height: SizeConfig.kDefaultSize * 04,
                ),
            ],
          ),
        ),
        // PostCommentSection(
        //   imageURL: _userProvider.user.avatar,
        //   isView: widget.isView,
        //   commentTextEditingController: commentTextEditingController,
        //   postID: widget.postID,
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
        //         widget.comments.add(com);
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
        //           "post_id": widget.postID,
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
        //         widget.comments.add(com);
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
        //         postID: widget.postID,
        //         userID: _userProvider.user.userId.toString(),
        //       );
        //       widget.showCommentBottomSheet();
        //     }
        //   },
        // ),
      ],
    );
  }
}
