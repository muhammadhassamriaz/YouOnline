import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:path/path.dart' as path;
import 'package:transparent_image/transparent_image.dart';

commentBottomSheet(
  BuildContext context, {
  @required List<TimelinePostComments> comments,
  @required String postID,
  @required int timelineIndex,
  @required int totalLikes,
}) {
  TextEditingController _commentTextEditingController = TextEditingController();
  SizeConfig().init(context);
  var _timelineProvider = Provider.of<TimelineProvider>(context, listen: false);
  var _userProvider = Provider.of<UserProvider>(context, listen: false);
  FlutterUploader uploader = FlutterUploader();
  double width = MediaQuery.of(context).size.width;
  String comment = "";
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.kDefaultSize * 4),
        topRight: Radius.circular(SizeConfig.kDefaultSize * 4),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 4,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          size: SizeConfig.kDefaultSize * 5,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 1,
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 05,
                        height: SizeConfig.kDefaultSize * 05,
                        child: Image.asset(
                          Assets.LIKE_ICON,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 01,
                      ),
                      Text(
                        '$totalLikes',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 3.6,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      // Spacer(),
                      // SizedBox(
                      //   width: SizeConfig.kDefaultSize * 05,
                      //   height: SizeConfig.kDefaultSize * 05,
                      //   child: Image.asset(
                      //     Assets.LIKE_BUTTON_ICON,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 3,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                if (_timelineProvider.timelineData[timelineIndex].comments !=
                        null &&
                    _timelineProvider
                            .timelineData[timelineIndex].comments.length >
                        0)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 4,
                      ),
                      child: SingleChildScrollView(
                        child: Wrap(
                          runSpacing: SizeConfig.kDefaultSize * 4,
                          children: List.generate(
                            _timelineProvider
                                .timelineData[timelineIndex].comments.length,
                            (index) {
                              List<Reactions> reactions = [];
                              int reactionIndex;
                              String react;
                              int commentIndex = index;
                              if (_timelineProvider.timelineData[timelineIndex]
                                      .comments[index].reactions !=
                                  null) {
                                reactions = _timelineProvider
                                    .timelineData[timelineIndex]
                                    .comments[index]
                                    .reactions;
                                reactions.forEach((element) {
                                  if (element.commentId ==
                                          _timelineProvider
                                              .timelineData[timelineIndex]
                                              .comments[index]
                                              .id &&
                                      element.user.userId ==
                                          _userProvider.user.userId) {
                                    react = "assets/images/" +
                                        element.reaction +
                                        ".gif";
                                  }
                                });
                              }
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: SizeConfig.kDefaultSize * 15,
                                    height: SizeConfig.kDefaultSize * 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: _timelineProvider
                                                .timelineData[timelineIndex]
                                                .comments[index]
                                                ?.user
                                                ?.avatar !=
                                            null
                                        ? ClipOval(
                                            child: FadeInImage.memoryNetwork(
                                              image: _timelineProvider
                                                  .timelineData[timelineIndex]
                                                  .comments[index]
                                                  .user
                                                  .avatar,
                                              placeholder: kTransparentImage,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : ClipOval(
                                            child: Image.asset(
                                              Assets.PROFILE_AVATAR,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.kDefaultSize * 03,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: searchContainerColor,
                                            borderRadius: BorderRadius.circular(
                                              SizeConfig.kDefaultSize * 4,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              SizeConfig.kDefaultSize * 3,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(
                                                //   comments[index].user.username ,
                                                //       // " " +
                                                //       // comments[index].user.lastName,
                                                //   style: labelTextStyle.copyWith(
                                                //     fontSize:
                                                //         SizeConfig.kDefaultSize * 3.8,
                                                //     fontWeight: FontWeight.bold,
                                                //   ),
                                                //   textScaleFactor: 1,
                                                // ),
                                                if (_timelineProvider
                                                            .timelineData[
                                                                timelineIndex]
                                                            .comments[index]
                                                            .user
                                                            .firstName !=
                                                        null &&
                                                    _timelineProvider
                                                            .timelineData[
                                                                timelineIndex]
                                                            .comments[index]
                                                            .user
                                                            .lastName !=
                                                        null)
                                                  Text(
                                                    _timelineProvider
                                                            .timelineData[
                                                                timelineIndex]
                                                            .comments[index]
                                                            .user
                                                            .firstName +
                                                        " " +
                                                        _timelineProvider
                                                            .timelineData[
                                                                timelineIndex]
                                                            .comments[index]
                                                            .user
                                                            .lastName,
                                                    style:
                                                        labelTextStyle.copyWith(
                                                      fontSize: SizeConfig
                                                              .kDefaultSize *
                                                          03.2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textScaleFactor: 1,
                                                  )
                                                else
                                                  Text(
                                                    _timelineProvider
                                                        .timelineData[
                                                            timelineIndex]
                                                        .comments[index]
                                                        .user
                                                        .username,
                                                    style:
                                                        labelTextStyle.copyWith(
                                                      fontSize: SizeConfig
                                                              .kDefaultSize *
                                                          03.2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textScaleFactor: 1,
                                                  ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.kDefaultSize *
                                                          0.04,
                                                ),
                                                Text(
                                                  _timelineProvider
                                                      .timelineData[
                                                          timelineIndex]
                                                      .comments[index]
                                                      .text,
                                                  style:
                                                      labelTextStyle.copyWith(
                                                    fontSize: SizeConfig
                                                            .kDefaultSize *
                                                        3.5,
                                                  ),
                                                  textScaleFactor: 1,
                                                ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.kDefaultSize *
                                                          5,
                                                ),
                                                if (_timelineProvider
                                                        .timelineData[
                                                            timelineIndex]
                                                        .comments[index]
                                                        .cFile !=
                                                    null)
                                                  Container(
                                                    width: SizeConfig
                                                            .kDefaultSize *
                                                        40,
                                                    height: SizeConfig
                                                            .kDefaultSize *
                                                        40,
                                                    child: FadeInImage
                                                        .memoryNetwork(
                                                      image: _timelineProvider
                                                          .timelineData[
                                                              timelineIndex]
                                                          .comments[index]
                                                          .cFile,
                                                      placeholder:
                                                          kTransparentImage,
                                                    ),
                                                  )
                                                else if (_timelineProvider
                                                        .timelineData[
                                                            timelineIndex]
                                                        .comments[index]
                                                        .imageFile !=
                                                    null)
                                                  Container(
                                                    width: SizeConfig
                                                            .kDefaultSize *
                                                        40,
                                                    height: SizeConfig
                                                            .kDefaultSize *
                                                        40,
                                                    child: Image.file(
                                                      _timelineProvider
                                                          .timelineData[
                                                              timelineIndex]
                                                          .comments[index]
                                                          .imageFile,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.kDefaultSize * 1,
                                        ),
                                        StatefulBuilder(
                                          builder: (context, setState) {
                                            return Row(
                                              children: [
                                                if (react != null)
                                                  SizedBox(
                                                    width: SizeConfig
                                                            .kDefaultSize *
                                                        03,
                                                  ),
                                                if (react != null)
                                                  SizedBox(
                                                    width: SizeConfig
                                                            .kDefaultSize *
                                                        05,
                                                    height: SizeConfig
                                                            .kDefaultSize *
                                                        05,
                                                    child: Image.asset(
                                                      react,
                                                    ),
                                                  ),
                                                SizedBox(
                                                  width:
                                                      SizeConfig.kDefaultSize *
                                                          03,
                                                ),
                                                GestureDetector(
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
                                                          contentPadding:
                                                              EdgeInsets.all(0),
                                                          actionsPadding:
                                                              EdgeInsets.all(0),
                                                          buttonPadding:
                                                              EdgeInsets.all(0),
                                                          insetPadding:
                                                              EdgeInsets.all(0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              SizeConfig
                                                                      .kDefaultSize *
                                                                  18,
                                                            ),
                                                          ),
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          titlePadding:
                                                              EdgeInsets.all(0),
                                                          content: Container(
                                                            height: SizeConfig
                                                                    .kDefaultSize *
                                                                20,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children:
                                                                  List.generate(
                                                                emojis.length,
                                                                (emojiIndex) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      if (reactions !=
                                                                          null) {
                                                                        reactions
                                                                            .forEach((element) {
                                                                          if (element.commentId == _timelineProvider.timelineData[timelineIndex].comments[index].id &&
                                                                              element.user.userId == _userProvider.user.userId) {
                                                                            setState(() {
                                                                              reactionIndex = reactions.indexOf(element);
                                                                            });
                                                                          }
                                                                        });
                                                                      }

                                                                      Reactions
                                                                          reaction =
                                                                          Reactions();
                                                                      User
                                                                          user =
                                                                          User();
                                                                      user.avatar = _userProvider
                                                                          .user
                                                                          .avatar;
                                                                      user.firstName = _userProvider
                                                                          .user
                                                                          .firstName;
                                                                      user.lastName = _userProvider
                                                                          .user
                                                                          .lastName;
                                                                      user.userId = _userProvider
                                                                          .user
                                                                          .userId;
                                                                      user.email = _userProvider
                                                                          .user
                                                                          .email;
                                                                      user.username = _userProvider
                                                                          .user
                                                                          .username;
                                                                      reaction.postId = _timelineProvider
                                                                          .timelineData[
                                                                              timelineIndex]
                                                                          .comments[
                                                                              index]
                                                                          .postId;
                                                                      reaction.commentId = _timelineProvider
                                                                          .timelineData[
                                                                              timelineIndex]
                                                                          .comments[
                                                                              index]
                                                                          .id;
                                                                      reaction.user =
                                                                          user;
                                                                      setState(
                                                                          () {
                                                                        react =
                                                                            emojis[emojiIndex];
                                                                      });
                                                                      reaction
                                                                          .reaction = emojis[
                                                                              emojiIndex]
                                                                          .replaceAll(
                                                                              "assets/images/",
                                                                              "")
                                                                          .replaceAll(
                                                                              ".gif",
                                                                              "");

                                                                      if (reactionIndex !=
                                                                          null) {
                                                                        if (reactions.length >
                                                                            0) {
                                                                          setState(
                                                                              () {
                                                                            reactions.removeAt(reactionIndex);
                                                                            reactions.insert(reactionIndex,
                                                                                reaction);
                                                                            _timelineProvider.timelineData[timelineIndex].comments[commentIndex].reactions =
                                                                                reactions;
                                                                          });
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            reactions.add(reaction);
                                                                            _timelineProvider.timelineData[timelineIndex ?? 0].comments[commentIndex].reactions =
                                                                                reactions;
                                                                          });
                                                                        }
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          reactions
                                                                              .add(reaction);
                                                                          _timelineProvider
                                                                              .timelineData[timelineIndex ?? 0]
                                                                              .comments[commentIndex]
                                                                              .reactions = reactions;
                                                                        });
                                                                      }
                                                                      Navigator.pop(
                                                                          context);

                                                                      _timelineProvider
                                                                          .likeComment(
                                                                        context:
                                                                            context,
                                                                        postID: _timelineProvider
                                                                            .timelineData[timelineIndex]
                                                                            .comments[index]
                                                                            .postId
                                                                            .toString(),
                                                                        commentID: _timelineProvider
                                                                            .timelineData[timelineIndex]
                                                                            .comments[index]
                                                                            .id
                                                                            .toString(),
                                                                        reaction:
                                                                            reaction.reaction,
                                                                      );
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          SizeConfig.kDefaultSize *
                                                                              10,
                                                                      height:
                                                                          SizeConfig.kDefaultSize *
                                                                              10,
                                                                      child: Image
                                                                          .asset(
                                                                        emojis[
                                                                            emojiIndex],
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
                                                              .replaceAll(
                                                                  "assets/images/",
                                                                  "")
                                                              .replaceAll(
                                                                  ".gif", "")
                                                              .capitalize(),
                                                          style: hintTextStyle
                                                              .copyWith(
                                                            fontSize: SizeConfig
                                                                    .kDefaultSize *
                                                                03.5,
                                                            color: react
                                                                    .toLowerCase()
                                                                    .contains(
                                                                        "love")
                                                                ? Colors
                                                                    .redAccent
                                                                : react
                                                                        .toLowerCase()
                                                                        .contains(
                                                                            "like")
                                                                    ? Color(
                                                                        0xff9B9B9B)
                                                                    : yellowColor,
                                                          ),
                                                          textScaleFactor: 1,
                                                        )
                                                      : Text(
                                                          'Like',
                                                          style: hintTextStyle
                                                              .copyWith(
                                                            fontSize: SizeConfig
                                                                    .kDefaultSize *
                                                                03.5,
                                                            color: Color(
                                                                0xff9B9B9B),
                                                          ),
                                                          textScaleFactor: 1,
                                                        ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      SizeConfig.kDefaultSize *
                                                          03,
                                                ),
                                                Text(
                                                  'Reply',
                                                  style: hintTextStyle.copyWith(
                                                    fontSize: SizeConfig
                                                            .kDefaultSize *
                                                        3.5,
                                                    color: Color(0xff9B9B9B),
                                                  ),
                                                  textScaleFactor: 1,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StatefulBuilder(
                                              builder: (context, setState) {
                                                if (_timelineProvider
                                                        .timelineData[
                                                            timelineIndex]
                                                        .comments[index]
                                                        .replies !=
                                                    null) {
                                                  return Wrap(
                                                    children: List.generate(
                                                      _timelineProvider
                                                          .timelineData[
                                                              timelineIndex]
                                                          .comments[index]
                                                          .replies
                                                          .length,
                                                      (replyIndex) {
                                                        return Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: SizeConfig
                                                                      .kDefaultSize *
                                                                  3,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: SizeConfig
                                                                          .kDefaultSize *
                                                                      10,
                                                                  height: SizeConfig
                                                                          .kDefaultSize *
                                                                      10,
                                                                  child: _timelineProvider
                                                                              .timelineData[timelineIndex]
                                                                              .comments[index]
                                                                              ?.replies[replyIndex]
                                                                              .user !=
                                                                          null
                                                                      ? ClipOval(
                                                                          child:
                                                                              FadeInImage.memoryNetwork(
                                                                            image:
                                                                                _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.avatar,
                                                                            placeholder:
                                                                                kTransparentImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        )
                                                                      : ClipOval(
                                                                          child:
                                                                              Image.asset(
                                                                            Assets.PROFILE_AVATAR,
                                                                          ),
                                                                        ),
                                                                ),
                                                                SizedBox(
                                                                  width: SizeConfig
                                                                          .kDefaultSize *
                                                                      03,
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              searchContainerColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                            SizeConfig.kDefaultSize *
                                                                                03,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(
                                                                            SizeConfig.kDefaultSize *
                                                                                02,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              if (_timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user != null && _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.firstName != null && _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.lastName != null)
                                                                                Text(
                                                                                  _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.firstName + " " + _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.lastName,
                                                                                  style: labelTextStyle.copyWith(
                                                                                    fontSize: SizeConfig.kDefaultSize * 03.2,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  textScaleFactor: 1,
                                                                                )
                                                                              else
                                                                                Text(
                                                                                  _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex].user.username,
                                                                                  style: labelTextStyle.copyWith(
                                                                                    fontSize: SizeConfig.kDefaultSize * 03.2,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                  textScaleFactor: 1,
                                                                                ),
                                                                              SizedBox(
                                                                                height: SizeConfig.kDefaultSize * .04,
                                                                              ),
                                                                              if (_timelineProvider.timelineData[timelineIndex].comments[0].text != null)
                                                                                Text(
                                                                                  _timelineProvider.timelineData[timelineIndex].comments[index].replies[replyIndex]?.text,
                                                                                  style: labelTextStyle.copyWith(
                                                                                    fontSize: SizeConfig.kDefaultSize * 02.8,
                                                                                  ),
                                                                                  textScaleFactor: 1,
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            SizeConfig.kDefaultSize *
                                                                                01,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: SizeConfig
                                                                      .kDefaultSize *
                                                                  2,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                } else {
                                                  return SizedBox();
                                                }
                                              },
                                            ),
                                            StatefulBuilder(
                                              builder: (context, setState) {
                                                TextEditingController
                                                    _replyTextEditingController =
                                                    TextEditingController();
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height:
                                                      SizeConfig.kDefaultSize *
                                                          9,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      SizeConfig.kDefaultSize *
                                                          07,
                                                    ),
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          searchContainerColor,
                                                    ),
                                                  ),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: SizeConfig
                                                              .kDefaultSize *
                                                          02,
                                                    ),
                                                    child: MediaQuery(
                                                      data:
                                                          MediaQuery.of(context)
                                                              .copyWith(
                                                        textScaleFactor: 1,
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            _replyTextEditingController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintStyle:
                                                              hintTextStyle
                                                                  .copyWith(
                                                            fontSize: SizeConfig
                                                                    .kDefaultSize *
                                                                3.5,
                                                          ),
                                                          hintText:
                                                              'Write your reply',
                                                        ),
                                                        style: labelTextStyle
                                                            .copyWith(
                                                          fontSize: SizeConfig
                                                                  .kDefaultSize *
                                                              3.5,
                                                        ),
                                                        onSubmitted: (value) {
                                                          Replies reply =
                                                              Replies();
                                                          User user = User();
                                                          var _userProvider =
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .user;
                                                          user.userId =
                                                              _userProvider
                                                                  .userId;
                                                          user.avatar =
                                                              _userProvider
                                                                  .avatar;
                                                          user.firstName =
                                                              _userProvider
                                                                  .firstName;
                                                          user.lastName =
                                                              _userProvider
                                                                  .lastName;
                                                          user.email =
                                                              _userProvider
                                                                  .email;
                                                          user.username =
                                                              _userProvider
                                                                  .username;
                                                          reply.user = user;

                                                          reply.text = value;
                                                          if (_timelineProvider
                                                                  .timelineData[
                                                                      timelineIndex]
                                                                  .comments[
                                                                      index]
                                                                  .replies !=
                                                              null) {
                                                            setState(() {
                                                              _timelineProvider
                                                                  .timelineData[
                                                                      timelineIndex]
                                                                  .comments[
                                                                      index]
                                                                  .replies
                                                                  .add(reply);
                                                            });
                                                          } else {
                                                            List<Replies>
                                                                replies = [];
                                                            setState(() {
                                                              replies
                                                                  .add(reply);
                                                              _timelineProvider
                                                                  .timelineData[
                                                                      timelineIndex]
                                                                  .comments[
                                                                      index]
                                                                  .replies = replies;
                                                            });
                                                          }

                                                          Provider.of<TimelineProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .addCommentReply(
                                                            context,
                                                            commentID:
                                                                _timelineProvider
                                                                    .timelineData[
                                                                        timelineIndex]
                                                                    .comments[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                            text: value,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .01,
                                  ),
                                  if (_timelineProvider
                                          .timelineData[timelineIndex]
                                          .comments[index]
                                          .user
                                          .userId ==
                                      _userProvider.user.userId)
                                    GestureDetector(
                                      onTap: () async {
                                        await _timelineProvider.deleteComment(
                                          context: context,
                                          commentId: _timelineProvider
                                              .timelineData[timelineIndex]
                                              .comments[index]
                                              .id
                                              .toString(),
                                          comment: _timelineProvider
                                              .timelineData[timelineIndex]
                                              .comments[index],
                                        );
                                        setState(() {
                                          _timelineProvider
                                              .timelineData[timelineIndex]
                                              .comments
                                              .remove(_timelineProvider
                                                  .timelineData[timelineIndex]
                                                  .comments[index]);
                                        });
                                        _timelineProvider.changeTimelineData(
                                            _timelineProvider.timelineData);
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: width * .05,
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_timelineProvider
                        .timelineData[timelineIndex].comments.length ==
                    0)
                  Spacer(),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      height: SizeConfig.kDefaultSize * 20,
                      color: searchContainerColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.kDefaultSize * 3,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: SizeConfig.kDefaultSize * 15,
                              height: SizeConfig.kDefaultSize * 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: _userProvider.user.avatar != null
                                  ? ClipOval(
                                      child: FadeInImage.memoryNetwork(
                                        image: _userProvider.user.avatar,
                                        placeholder: kTransparentImage,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.asset(
                                        Assets.PROFILE_AVATAR,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 03,
                            ),
                            Expanded(
                              child: Container(
                                width: SizeConfig.kDefaultSize * 70,
                                height: SizeConfig.kDefaultSize * 14,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 08,
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.kDefaultSize * 02,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                            textScaleFactor: 1,
                                          ),
                                          child: TextField(
                                            // readOnly: widget.isView ? true : false,
                                            controller:
                                                _commentTextEditingController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: hintTextStyle.copyWith(
                                                fontSize:
                                                    SizeConfig.kDefaultSize *
                                                        3.5,
                                              ),
                                              hintText: 'Write a comment',
                                            ),

                                            onSubmitted: (value) {
                                              TimelinePostComments com =
                                                  TimelinePostComments();
                                              if (value.isNotEmpty) {
                                                com.text = value;
                                                User user = User();
                                                user.userId =
                                                    _userProvider.user.userId;
                                                user.firstName = _userProvider
                                                    .user.firstName;
                                                user.lastName =
                                                    _userProvider.user.lastName;
                                                user.username =
                                                    _userProvider.user.username;
                                                user.email =
                                                    _userProvider.user.email;
                                                com.user = user;
                                                user.avatar =
                                                    _userProvider.user.avatar;

                                                setState(() {
                                                  _timelineProvider
                                                      .timelineData[
                                                          timelineIndex]
                                                      .comments
                                                      .add(com);
                                                  _commentTextEditingController
                                                      .text = "";
                                                  comment = "";
                                                });

                                                BotToast.showText(
                                                  text: "Comments updated!",
                                                  textStyle:
                                                      labelTextStyle.copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .03,
                                                    color: Colors.black,
                                                  ),
                                                  contentColor: Colors.white,
                                                );
                                                _timelineProvider.addComment(
                                                  context: context,
                                                  comment: com.text,
                                                  postID: postID,
                                                  userID: _userProvider
                                                      .user.userId
                                                      .toString(),
                                                );
                                                Navigator.pop(context);
                                              }
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                comment = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 1.5,
                                      ),
                                      if (comment.isEmpty)
                                        GestureDetector(
                                          onTap: () async {
                                            TimelinePostComments com =
                                                TimelinePostComments();

                                            User user = User();

                                            // await ImagePicker.pickImage(source: ImageSource.gallery)
                                            //     .then((value) async {

                                            // });
                                            await ImagePicker.platform
                                                .pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 70,
                                            )
                                                .then((value) async {
                                              setState(() {
                                                user.userId =
                                                    _userProvider.user.userId;
                                                user.firstName = _userProvider
                                                    .user.firstName;
                                                user.lastName =
                                                    _userProvider.user.lastName;
                                                user.username =
                                                    _userProvider.user.username;
                                                user.email =
                                                    _userProvider.user.email;
                                                user.avatar =
                                                    _userProvider.user.avatar;
                                                com.user = user;
                                                com.imageFile =
                                                    File(value.path);
                                                _timelineProvider
                                                    .timelineData[timelineIndex]
                                                    .comments
                                                    .add(com);
                                              });

                                              await uploader.enqueue(
                                                url:
                                                    "https://api.youonline.site/api/add-comment",
                                                files: [
                                                  FileItem(
                                                    filename: path
                                                        .basename(value.path),
                                                    savedDir: path
                                                        .dirname(value.path),
                                                    fieldname: "image",
                                                  )
                                                ],
                                                method: UploadMethod.POST,
                                                headers: <String, String>{
                                                  "Accept": "application/json",
                                                  "Authorization":
                                                      "Bearer ${_userProvider.userAuthenticationToken}",
                                                },
                                                data: {
                                                  "post_id": postID,
                                                  "text": "",
                                                },
                                                showNotification: true,
                                                tag: "Uploading Image",
                                              );
                                            });
                                          },
                                          child: SizedBox(
                                            width: SizeConfig.kDefaultSize * 05,
                                            height:
                                                SizeConfig.kDefaultSize * 05,
                                            child: Image.asset(
                                              Assets.UPLOAD_IMAGE_ICON,
                                            ),
                                          ),
                                        )
                                      else if (comment.isNotEmpty)
                                        GestureDetector(
                                          onTap: () {
                                            TimelinePostComments com =
                                                TimelinePostComments();
                                            if (_commentTextEditingController
                                                .text.isNotEmpty) {
                                              com.text =
                                                  _commentTextEditingController
                                                      .text;
                                              User user = User();
                                              user.userId =
                                                  _userProvider.user.userId;
                                              user.firstName =
                                                  _userProvider.user.firstName;
                                              user.lastName =
                                                  _userProvider.user.lastName;
                                              user.username =
                                                  _userProvider.user.username;
                                              user.email =
                                                  _userProvider.user.email;
                                              com.user = user;
                                              user.avatar =
                                                  _userProvider.user.avatar;

                                              setState(() {
                                                _timelineProvider
                                                    .timelineData[timelineIndex]
                                                    .comments
                                                    .add(com);
                                                _commentTextEditingController
                                                    .text = "";
                                                comment = "";
                                              });

                                              BotToast.showText(
                                                text: "Comments updated!",
                                                textStyle:
                                                    labelTextStyle.copyWith(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .03,
                                                  color: Colors.black,
                                                ),
                                                contentColor: Colors.white,
                                              );
                                              _timelineProvider.addComment(
                                                context: context,
                                                comment: com.text,
                                                postID: postID,
                                                userID: _userProvider
                                                    .user.userId
                                                    .toString(),
                                              );
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Icon(
                                            Icons.send,
                                            size: SizeConfig.kDefaultSize * 05,
                                            color: primaryColor,
                                          ),
                                        ),
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 01.5,
                                      ),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     if (!isView) {
                                      //       Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (_) => TagFriendsScreen(),
                                      //         ),
                                      //       );
                                      //     }
                                      //   },
                                      //   child: SizedBox(
                                      //     width: SizeConfig.kDefaultSize * 05,
                                      //     height: SizeConfig.kDefaultSize * 06,
                                      //     child: Image.asset(
                                      //       Assets.TAG_ICON,
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   width: SizeConfig.kDefaultSize * 01.5,
                                      // ),
                                      // SizedBox(
                                      //   width: SizeConfig.kDefaultSize * 05,
                                      //   height: SizeConfig.kDefaultSize * 06,
                                      //   child: Image.asset(
                                      //     Assets.FEELINGS_ICON,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   width: SizeConfig.kDefaultSize * 1.5,
                                      // ),
                                      // SizedBox(
                                      //   width: SizeConfig.kDefaultSize * 05,
                                      //   height: SizeConfig.kDefaultSize * 06,
                                      //   child: Image.asset(
                                      //     Assets.LOCATION_ICON,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 03,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
