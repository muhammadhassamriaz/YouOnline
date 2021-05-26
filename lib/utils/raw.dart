// String simpleText = _parseHtmlString(
//     timelineData[index].postText);
// List<String> splitString = [];
// String imageURL;

// if (simpleText.contains("http")) {
//   if (!simpleText.contains("you")) {
//     RegExp exp = RegExp(
//         r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
//     imageURL = exp.stringMatch(
//         timelineData[index].postText);
//     print(imageURL);
//     List<String> postText = [];
//     splitString = simpleText.split(imageURL);
//     splitString.forEach((element) {
//       if (element != imageURL) {
//         postText.add(element);
//         text = postText.join();
//       }
//     });
//   }
// } else if (timelineData[index]
//     .postText
//     .contains('-')) {
//   if (timelineData[index].postYoutube !=
//       null) {
//     if (timelineData[index]
//         .postYoutube
//         .isNotEmpty) {
//       String splitString =
//           simpleText.split("-").first;
//       text = splitString;
//     }
//   } else {
//     text = simpleText;
//   }
// } else {
//   if (simpleText.contains("&")) {
//     if (simpleText.contains("channel")) {
//       text = simpleText.split("&").first;
//     } else {
//       text = simpleText;
//     }
//   } else {
//     text = simpleText;
//   }
// }

// Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: height * .02,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: width * .04,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'YouOnline',
//                           style: headingTextStyle.copyWith(
//                             fontSize: width * .06,
//                             color: primaryColor,
//                           ),
//                           textScaleFactor: 1,
//                         ),
//                         Spacer(),
//                         YouOnlineIconButton(
//                           callback: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => SearchScreen(),
//                               ),
//                             );
//                           },
//                           icon: Icons.search,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * .02,
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       physics: BouncingScrollPhysics(),
//                       child: Container(
//                         width: double.infinity,
//                         color: Color(0xffE0E0E0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               color: Colors.white,
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: width * .04),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           width: width * .14,
//                                           height: width * .14,
//                                           child: _userProvider.user?.avatar !=
//                                                   null
//                                               ? Container(
//                                                   width: width * .14,
//                                                   height: width * .14,
//                                                   decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: ClipOval(
//                                                     child: Image.network(
//                                                       _userProvider.user.avatar,
//                                                     ),
//                                                   ),
//                                                 )
//                                               : Image.asset(
//                                                   Assets.PROFILE_AVATAR,
//                                                 ),
//                                         ),
//                                         SizedBox(
//                                           width: width * .02,
//                                         ),
//                                         Flexible(
//                                           child: MediaQuery(
//                                             data:
//                                                 MediaQuery.of(context).copyWith(
//                                               textScaleFactor: 1,
//                                             ),
//                                             child: TextField(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (_) =>
//                                                         CreatePostScreen(),
//                                                   ),
//                                                 );
//                                               },
//                                               autofocus: false,
//                                               readOnly: true,
//                                               controller:
//                                                   _postTextEditingController,
//                                               maxLines: 2,
//                                               decoration: InputDecoration(
//                                                 hintStyle:
//                                                     hintTextStyle.copyWith(
//                                                   fontSize: width * .04,
//                                                 ),
//                                                 hintText: 'What\'s going on?',
//                                                 border: InputBorder.none,
//                                               ),
//                                               style: labelTextStyle.copyWith(
//                                                 fontSize: width * .04,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: height * .01,
//                                   ),
//                                   Divider(
//                                     color: Colors.grey[300],
//                                     height: height * .003,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: YouOnlineTextButton(
//                                           assetImage: Assets.UPLOAD_IMAGE_ICON,
//                                           title: 'Photo',
//                                           color: searchContainerColor,
//                                           callback: () {},
//                                         ),
//                                       ),
//                                       Container(
//                                         height: height * .03,
//                                         width: width * .002,
//                                         color: Colors.grey[300],
//                                       ),
//                                       Expanded(
//                                         child: YouOnlineTextButton(
//                                           title: 'Activity',
//                                           assetImage: Assets.FEELINGS_ICON,
//                                           color: yellowColor,
//                                           callback: () {},
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: height * .01,
//                             ),
//                             ProfilePictures(),
//                             SizedBox(
//                               height: height * .01,
//                             ),
//                             ProfileStoryRow(),
//                             Wrap(
//                               children: List.generate(
//                                 snapshot.data.posts.data.length,
//                                 (timelineIndex) {
//                                   List<TimelinePostComments> comments = [];

//                                   comments = snapshot.data?.posts
//                                           ?.data[timelineIndex]?.comments ??
//                                       [];

//                                   String imageURL;
//                                   String iframe;

//                                   bool shared;

//                                   if(timelineData.posts.data[timelineIndex].sharedBy != null){
//                                     shared = true;
//                                   }
//                                   else {
//                                     shared = false;
//                                   }

//                                   bool urlExist = false;

//                                   if(shared){
//                                     if(timelineData.posts.data[timelineIndex].sharedBy.postFile != null  && timelineData.posts.data[timelineIndex].sharedBy.postFile.isNotEmpty ){
//                                       imageURL = timelineData.posts.data[timelineIndex].sharedBy.postFile;
//                                     } else if(timelineData.posts.data[timelineIndex].sharedBy.postLink != null && timelineData.posts.data[timelineIndex].sharedBy.postLink.isNotEmpty){
//                                       {imageURL = timelineData.posts.data[timelineIndex].sharedBy.postLink;
//                                       urlExist = true;}
//                                     } else if(timelineData.posts.data[timelineIndex].sharedBy.postYoutube != null && timelineData.posts.data[timelineIndex].sharedBy.postYoutube.isNotEmpty){
//                                       {iframe = timelineData.posts.data[timelineIndex].sharedBy.postYoutube;
//                                       urlExist = true;}
//                                     }
//                                   } else {
//                                     if(timelineData.posts.data[timelineIndex].postFile != null  && timelineData.posts.data[timelineIndex].postFile.isNotEmpty ){
//                                       imageURL = timelineData.posts.data[timelineIndex].postFile;
//                                     } else if(timelineData.posts.data[timelineIndex].postLink != null && timelineData.posts.data[timelineIndex].postLink.isNotEmpty){
//                                       {imageURL = timelineData.posts.data[timelineIndex].postLink;
//                                       urlExist = true;}
//                                     } else if(timelineData.posts.data[timelineIndex].postYoutube != null && timelineData.posts.data[timelineIndex].postYoutube.isNotEmpty){
//                                       {iframe = timelineData.posts.data[timelineIndex].postYoutube;
//                                       urlExist = true;}
//                                     }
//                                   }

//                                   List<Reactions> reactions = [];

//                                   if (timelineData.posts.data[timelineIndex]
//                                               .reactions !=
//                                           null &&
//                                       timelineData.posts.data[timelineIndex]
//                                               .reactions.length >
//                                           0) {
//                                     reactions = timelineData
//                                         .posts.data[timelineIndex].reactions;
//                                     likeReaction =
//                                         reactions[reactionIndex ?? 0].reaction;
//                                   } else {
//                                     reactions = [];
//                                   }

//                                   return HomePostWidget(
//                                     likedButtonOnPressed: () {
//                                       SizeConfig().init(context);

//                                       showDialog(
//                                         context: context,
//                                         useSafeArea: false,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             contentPadding: EdgeInsets.all(0),
//                                             actionsPadding: EdgeInsets.all(0),
//                                             buttonPadding: EdgeInsets.all(0),
//                                             insetPadding: EdgeInsets.all(0),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                 SizeConfig.kDefaultSize * 18,
//                                               ),
//                                             ),
//                                             clipBehavior:
//                                                 Clip.antiAliasWithSaveLayer,
//                                             titlePadding: EdgeInsets.all(0),
//                                             content: Container(
//                                               height:
//                                                   SizeConfig.kDefaultSize * 20,
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width -
//                                                   20,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                               ),
//                                               clipBehavior:
//                                                   Clip.antiAliasWithSaveLayer,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: List.generate(
//                                                   emojis.length,
//                                                   (emojiIndex) {
//                                                     return GestureDetector(
//                                                       onTap: () async {
//                                                         if (reactions == null) {
//                                                           reactions = [];
//                                                         } else if (reactions
//                                                                 .length >
//                                                             0) {
//                                                           reactions.forEach(
//                                                               (element) {
//                                                             if (element.postId ==
//                                                                     timelineData
//                                                                         .posts
//                                                                         .data[
//                                                                             timelineIndex]
//                                                                         .postId &&
//                                                                 element.user
//                                                                         .userId ==
//                                                                     _userProvider
//                                                                         .user
//                                                                         .userId) {
//                                                               setState(() {
//                                                                 reactionIndex =
//                                                                     reactions
//                                                                         .indexOf(
//                                                                             element);
//                                                               });
//                                                             }
//                                                           });
//                                                         }
//                                                         Reactions reaction =
//                                                             Reactions();
//                                                         User user = User();
//                                                         reaction.postId =
//                                                             timelineData
//                                                                 .posts
//                                                                 .data[
//                                                                     timelineIndex]
//                                                                 .postId;
//                                                         user.userId =
//                                                             _userProvider
//                                                                 .user.userId;
//                                                         user.email =
//                                                             _userProvider
//                                                                 .user.email;
//                                                         user.firstName =
//                                                             _userProvider
//                                                                 .user.firstName;
//                                                         user.lastName =
//                                                             _userProvider
//                                                                 .user.lastName;
//                                                         user.avatar =
//                                                             _userProvider
//                                                                 .user.avatar;
//                                                         user.username =
//                                                             _userProvider
//                                                                 .user.username;

//                                                         reaction.user = user;
//                                                         reaction
//                                                             .reaction = emojis[
//                                                                 emojiIndex]
//                                                             .replaceAll(
//                                                                 "assets/images/",
//                                                                 "")
//                                                             .replaceAll(
//                                                                 ".gif", "");

//                                                         if (reactionIndex !=
//                                                             null) {
//                                                           if (reactions.length >
//                                                               0) {
//                                                             setState(() {
//                                                               reactions.removeAt(
//                                                                   reactionIndex);
//                                                               reactions.insert(
//                                                                   reactionIndex,
//                                                                   reaction);
//                                                               timelineData
//                                                                       .posts
//                                                                       .data[
//                                                                           timelineIndex]
//                                                                       .reactions =
//                                                                   reactions;
//                                                             });
//                                                           } else {
//                                                             setState(() {
//                                                               reactions.add(
//                                                                   reaction);
//                                                               timelineData
//                                                                       .posts
//                                                                       .data[
//                                                                           timelineIndex]
//                                                                       .reactions =
//                                                                   reactions;
//                                                             });
//                                                           }
//                                                         } else {
//                                                           setState(() {
//                                                             reactions
//                                                                 .add(reaction);
//                                                             timelineData
//                                                                     .posts
//                                                                     .data[
//                                                                         timelineIndex]
//                                                                     .reactions =
//                                                                 reactions;
//                                                           });
//                                                         }

//                                                         await _timelineProvider
//                                                             .likePost(
//                                                           context,
//                                                           postID: reaction
//                                                               .postId
//                                                               .toString(),
//                                                           reaction:
//                                                               reaction.reaction,
//                                                         );
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child: SizedBox(
//                                                         width: SizeConfig
//                                                                 .kDefaultSize *
//                                                             10,
//                                                         height: SizeConfig
//                                                                 .kDefaultSize *
//                                                             10,
//                                                         child: Image.asset(
//                                                           emojis[emojiIndex],
//                                                         ),
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     },
//                                     comments: timelineData
//                                         .posts.data[timelineIndex].comments,
//                                     comment: comments != null
//                                         ? comments.length > 0
//                                             ? comments[0]
//                                             : TimelinePostComments()
//                                         : TimelinePostComments(),
//                                     commentButtonCallback: () {
//                                       commentBottomSheet(
//                                         context,
//                                         comments: comments ?? [],
//                                       );
//                                     },
//                                     shareButtonCallback: () {
//                                       shareBottomSheet(
//                                         context,
//                                         postID: timelineData
//                                             .posts.data[timelineIndex].postId
//                                             .toString(),
//                                       );
//                                     },
//                                     postID: snapshot
//                                         .data.posts.data[timelineIndex].postId
//                                         .toString(),
//                                     moreButtonCallback: () {
//                                       showPostMenuBottomSheet(context);
//                                     },
//                                     reactionCount: reactions.length == 0
//                                         ? null
//                                         : reactions.length,
//                                     description:
//                                     !urlExist ?
//                                     timelineData
//                                         .posts.data[timelineIndex].postText : null,
//                                     iframe: iframe,
//                                     imageURL: imageURL,
//                                     name: timelineData.posts.data[timelineIndex]
//                                             .user.firstName +
//                                         " " +
//                                         timelineData.posts.data[timelineIndex]
//                                             .user.lastName,
//                                     profileAvatar: timelineData
//                                         .posts.data[timelineIndex].user.avatar,
//                                     colors: timelineData
//                                         .posts.data[timelineIndex].colored,
//                                     reaction: likeReaction,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
