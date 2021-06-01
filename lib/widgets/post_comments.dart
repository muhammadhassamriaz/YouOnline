import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'comment_bottom_sheet.dart';

// ignore: must_be_immutable
class PostCommentsWidget extends StatefulWidget {
  final String comment;
  final String username;
  List<Replies> replies;
  final String commentID;
  final String imageURL;
  final TimelinePostComments postComment;
  final int postId;
  final int timelineIndex;
  final Function showCommentBottomSheet;

  PostCommentsWidget({
    Key key,
    @required this.comment,
    @required this.username,
    @required this.replies,
    @required this.commentID,
    @required this.imageURL,
    @required this.postComment,
    @required this.postId,
    @required this.timelineIndex,
    @required this.showCommentBottomSheet,
  }) : super(key: key);

  @override
  _PostCommentsWidgetState createState() => _PostCommentsWidgetState();
}

class _PostCommentsWidgetState extends State<PostCommentsWidget> {
  bool clickOnReply = false;

  TextEditingController _replyTextEditingController = TextEditingController();
  List<Reactions> reactions = [];
  int reactionIndex;
  int commentIndex;
  String react;

  @override
  Widget build(BuildContext context) {
    var _timelineProvider = Provider.of<TimelineProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context).user;
    int commentIndex = _timelineProvider
        .timelineData[widget.timelineIndex].comments
        .indexOf(widget.postComment);
    if (widget.postComment.reactions != null) {
      reactions = widget.postComment.reactions;
      reactions.forEach((element) {
        if (element.commentId == widget.postComment.id &&
            element.user.userId == _userProvider.userId) {
          react = "assets/images/" + element.reaction + ".gif";
        }
      });
    }
    print(widget.postComment);
    if (widget.replies == null) {
      widget.replies = [];
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 04,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.kDefaultSize * 15,
            height: SizeConfig.kDefaultSize * 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: widget.imageURL != null
                ?
                // CachedNetworkImageProvider(
                //     widget.imageURL,
                //   )
                ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.imageURL,
                      fit: BoxFit.cover,
                      imageScale: 0.5,
                      excludeFromSemantics: true,
                    ),
                  )
                : Image.asset(
                    Assets.PROFILE_AVATAR,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            width: SizeConfig.kDefaultSize * 03,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: searchContainerColor,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.kDefaultSize * 03,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      SizeConfig.kDefaultSize * 03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.username != null)
                          Text(
                            widget.username ?? 'Zain Mehmood',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 03.8,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          ),
                        SizedBox(
                          height: SizeConfig.kDefaultSize * .04,
                        ),
                        if (widget.comment != null)
                          Text(
                            widget.comment ?? 'Here I am inbox me',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 03.5,
                            ),
                            textScaleFactor: 1,
                          ),
                        if (widget.postComment.cFile != null)
                          Container(
                            width: SizeConfig.kDefaultSize * 40,
                            height: SizeConfig.kDefaultSize * 40,
                            child:
                                // CachedNetworkImage(
                                //   imageUrl: widget.postComment.cFile,
                                // ),
                                FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: widget.postComment.cFile,
                              imageScale: 0.5,
                              excludeFromSemantics: true,
                            ),
                          )
                        else if (widget.postComment.imageFile != null)
                          Container(
                            width: SizeConfig.kDefaultSize * 40,
                            height: SizeConfig.kDefaultSize * 40,
                            child: Image.file(
                              widget.postComment.imageFile,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 01,
                ),
                Row(
                  children: [
                    if (react != null)
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 03,
                      ),
                    if (react != null)
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 05,
                        height: SizeConfig.kDefaultSize * 05,
                        child: Image.asset(
                          react,
                        ),
                      ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 01,
                    ),
                    GestureDetector(
                      onTap: () {},
                      onLongPress: () {
                        List<String> emojis = [
                          likeGIF,
                          loveGIF,
                          happyGIF,
                          sadGIF,
                          angryGIF,
                          wowGIF,
                        ];
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
                                        onTap: () {
                                          if (reactions != null) {
                                            reactions.forEach((element) {
                                              if (element.commentId ==
                                                      widget.postComment.id &&
                                                  element.user.userId ==
                                                      _userProvider.userId) {
                                                setState(() {
                                                  reactionIndex = reactions
                                                      .indexOf(element);
                                                });
                                              }
                                            });
                                          }

                                          Reactions reaction = Reactions();
                                          User user = User();
                                          user.avatar = _userProvider.avatar;
                                          user.firstName =
                                              _userProvider.firstName;
                                          user.lastName =
                                              _userProvider.lastName;
                                          user.userId = _userProvider.userId;
                                          user.email = _userProvider.email;
                                          user.username =
                                              _userProvider.username;
                                          reaction.postId = widget.postId;
                                          reaction.commentId =
                                              widget.postComment.id;
                                          reaction.user = user;
                                          setState(() {
                                            react = emojis[emojiIndex];
                                          });
                                          reaction.reaction = emojis[emojiIndex]
                                              .replaceAll("assets/images/", "")
                                              .replaceAll(".gif", "");

                                          if (reactionIndex != null) {
                                            if (reactions.length > 0) {
                                              setState(() {
                                                reactions
                                                    .removeAt(reactionIndex);
                                                reactions.insert(
                                                    reactionIndex, reaction);
                                                _timelineProvider
                                                    .timelineData[
                                                        widget.timelineIndex]
                                                    .comments[commentIndex]
                                                    .reactions = reactions;
                                              });
                                            } else {
                                              setState(() {
                                                reactions.add(reaction);
                                                _timelineProvider
                                                    .timelineData[
                                                        widget.timelineIndex ??
                                                            0]
                                                    .comments[commentIndex]
                                                    .reactions = reactions;
                                              });
                                            }
                                          } else {
                                            setState(() {
                                              reactions.add(reaction);
                                              _timelineProvider
                                                  .timelineData[
                                                      widget.timelineIndex ?? 0]
                                                  .comments[commentIndex]
                                                  .reactions = reactions;
                                            });
                                          }
                                          Navigator.pop(context);

                                          _timelineProvider.likeComment(
                                            context: context,
                                            postID: widget.postId.toString(),
                                            commentID: widget.postComment.id
                                                .toString(),
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
                      child: react != null
                          ? Text(
                              react
                                  .replaceAll("assets/images/", "")
                                  .replaceAll(".gif", "")
                                  .capitalize(),
                              style: hintTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 03.5,
                                color: react.toLowerCase().contains("love")
                                    ? Colors.redAccent
                                    : react.toLowerCase().contains("like")
                                        ? Color(0xff9B9B9B)
                                        : yellowColor,
                              ),
                              textScaleFactor: 1,
                            )
                          : Text(
                              'Like',
                              style: hintTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 03.5,
                                color: Color(0xff9B9B9B),
                              ),
                              textScaleFactor: 1,
                            ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 03,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Reply',
                        style: hintTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 03.5,
                          color: Color(0xff9B9B9B),
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                  ],
                ),
                if (widget.replies != null && widget.replies.length > 0)
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 3,
                  ),
                if (widget.replies != null && widget.replies.length > 0)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: SizeConfig.kDefaultSize * 10,
                        height: SizeConfig.kDefaultSize * 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: widget.replies[0].user != null
                            ?
                            // CachedNetworkImageProvider(
                            //     widget.replies[0].user.avatar,
                            //   )
                            ClipOval(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: widget.replies[0].user.avatar,
                                  fit: BoxFit.cover,
                                  imageScale: 0.5,
                                  excludeFromSemantics: true,
                                ),
                              )
                            : Image.asset(
                                Assets.PROFILE_AVATAR,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 03,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: searchContainerColor,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.kDefaultSize * 03,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  SizeConfig.kDefaultSize * 02,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget.replies[0].user.firstName !=
                                            null &&
                                        widget.replies[0].user.lastName != null)
                                      Text(
                                        widget.replies[0].user.firstName +
                                            " " +
                                            widget.replies[0].user.lastName,
                                        style: labelTextStyle.copyWith(
                                          fontSize:
                                              SizeConfig.kDefaultSize * 03.2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textScaleFactor: 1,
                                      )
                                    else
                                      Text(
                                        widget.replies[0].user.username,
                                        style: labelTextStyle.copyWith(
                                          fontSize:
                                              SizeConfig.kDefaultSize * 03.2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textScaleFactor: 1,
                                      ),
                                    SizedBox(
                                      height: SizeConfig.kDefaultSize * .04,
                                    ),
                                    if (widget.comment != null)
                                      Text(
                                        widget.replies[0].text ??
                                            'Here I am inbox me',
                                        style: labelTextStyle.copyWith(
                                          fontSize:
                                              SizeConfig.kDefaultSize * 02.8,
                                        ),
                                        textScaleFactor: 1,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 01,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                Container(
                  width: double.infinity,
                  height: SizeConfig.kDefaultSize * 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.kDefaultSize * 08,
                    ),
                    border: Border.all(
                      width: 1,
                      color: searchContainerColor,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 02,
                    ),
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaleFactor: 1,
                      ),
                      child: TextField(
                        controller: _replyTextEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: hintTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 2.8,
                          ),
                          hintText: 'Write your reply',
                        ),
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 2.8,
                        ),
                        onSubmitted: (value) {
                          Replies reply = Replies();
                          User user = User();
                          var _userProvider =
                              Provider.of<UserProvider>(context, listen: false)
                                  .user;
                          user.avatar = _userProvider.avatar;
                          user.firstName = _userProvider.firstName;
                          user.lastName = _userProvider.lastName;
                          user.avatar = _userProvider.avatar;
                          user.email = _userProvider.email;
                          user.username = _userProvider.username;
                          user.userId = _userProvider.userId;
                          reply.user = user;

                          reply.text = value;
                          setState(() {
                            widget.replies.add(reply);
                            _replyTextEditingController.text = "";
                            _timelineProvider
                                .timelineData[widget.timelineIndex]
                                .comments[commentIndex]
                                .replies = widget.replies;
                          });
                          BotToast.showText(
                            text: "Successfully replied on comment",
                            textStyle: labelTextStyle.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            contentColor: Colors.white,
                          );

                          Provider.of<TimelineProvider>(context, listen: false)
                              .addCommentReply(
                            context,
                            commentID: widget.commentID,
                            text: reply.text,
                          );
                          widget.showCommentBottomSheet();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
