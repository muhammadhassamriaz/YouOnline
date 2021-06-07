  // child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: height * .02,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(
  //               horizontal: width * .04,
  //             ),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'YouOnline',
  //                   style: headingTextStyle.copyWith(
  //                     fontSize: width * .06,
  //                     color: primaryColor,
  //                   ),
  //                   textScaleFactor: 1,
  //                 ),
  //                 Spacer(),
  //                 YouOnlineIconButton(
  //                   callback: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (_) => SearchScreen(),
  //                       ),
  //                     );
  //                   },
  //                   icon: Icons.search,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: height * .02,
  //           ),
  //           Container(
  //             color: Colors.white,
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: width * .04),
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(
  //                         width: width * .14,
  //                         height: width * .14,
  //                         child: _userProvider.user?.avatar != null
  //                             ? Container(
  //                                 width: width * .14,
  //                                 height: width * .14,
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                 ),
  //                                 child: ClipOval(
  //                                   child: FadeInImage.memoryNetwork(
  //                                     image: _userProvider.user.avatar,
  //                                     placeholder: kTransparentImage,
  //                                     imageScale: 0.5,
  //                                   ),
  //                                 ),
  //                               )
  //                             : Image.asset(
  //                                 Assets.PROFILE_AVATAR,
  //                               ),
  //                       ),
  //                       SizedBox(
  //                         width: width * .02,
  //                       ),
  //                       Flexible(
  //                         child: MediaQuery(
  //                           data: MediaQuery.of(context).copyWith(
  //                             textScaleFactor: 1,
  //                           ),
  //                           child: TextField(
  //                             onTap: () {
  //                               Provider.of<PostProvider>(context,
  //                                       listen: false)
  //                                   .changeFeelings(null);
  //                               Provider.of<PostProvider>(context,
  //                                       listen: false)
  //                                   .changeGIFurl(null);
  //                               Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                   builder: (_) => CreatePostScreen(),
  //                                 ),
  //                               );
  //                             },
  //                             autofocus: false,
  //                             readOnly: true,
  //                             controller: _postTextEditingController,
  //                             maxLines: 2,
  //                             decoration: InputDecoration(
  //                               hintStyle: hintTextStyle.copyWith(
  //                                 fontSize: width * .04,
  //                               ),
  //                               hintText: 'What\'s going on?',
  //                               border: InputBorder.none,
  //                             ),
  //                             style: labelTextStyle.copyWith(
  //                               fontSize: width * .04,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: height * .01,
  //                 ),
  //                 Divider(
  //                   color: Colors.grey[300],
  //                   height: height * .003,
  //                 ),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: YouOnlineTextButton(
  //                         assetImage: Assets.UPLOAD_IMAGE_ICON,
  //                         title: 'Photo',
  //                         color: searchContainerColor,
  //                         callback: () async {
  //                           FilePickerResult result =
  //                               await FilePicker.platform.pickFiles(
  //                             allowMultiple: true,
  //                             type: FileType.image,
  //                           );

  //                           if (result != null) {
  //                             List<File> files = result.paths
  //                                 .map((path) => File(path))
  //                                 .toList();

  //                             uploadMultipleImage(
  //                               files: files,
  //                               authenticationToken:
  //                                   _userProvider.userAuthenticationToken,
  //                               context: context,
  //                             );
  //                           }
  //                         },
  //                       ),
  //                     ),
  //                     Container(
  //                       height: height * .03,
  //                       width: width * .002,
  //                       color: Colors.grey[300],
  //                     ),
  //                     Expanded(
  //                       child: YouOnlineTextButton(
  //                         title: 'Activity',
  //                         assetImage: Assets.FEELINGS_ICON,
  //                         color: yellowColor,
  //                         callback: () {
  //                           Provider.of<PostProvider>(context, listen: false)
  //                               .changeFeelings(null);
  //                           Provider.of<PostProvider>(context, listen: false)
  //                               .changeGIFurl(null);
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                               builder: (_) => CreatePostScreen(),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // SizedBox(
  //           //   height: height * .01,
  //           // ),
  //           // ProfilePictures(),
  //           SizedBox(
  //             height: height * .005,
  //           ),
  //           if (widget.isMainScreen)
  //             FutureBuilder<StoryModel>(
  //               future: initStoryData,
  //               builder: (context, snapshot) {
  //                 if (snapshot.hasData) {
  //                   return StoryList(
  //                     iconBackgroundColor: primaryColor,
  //                     addItemBackgroundColor: Colors.white,
  //                     borderColor: Colors.transparent,
  //                     backgroundColor: Colors.white,
  //                     addItemWidth: width * .25,
  //                     onPressedIcon: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (_) => CreateUserStories(),
  //                         ),
  //                       );
  //                     },
  //                     image: FadeInImage.memoryNetwork(
  //                       image: _userProvider.user.cover,
  //                       fit: BoxFit.cover,
  //                       placeholder: kTransparentImage,
  //                       imageScale: 0.5,
  //                     ),
  //                     text: Text(
  //                       "",
  //                       maxLines: 1,
  //                       style: labelTextStyle.copyWith(
  //                         fontSize: width * .032,
  //                         color: primaryColor,
  //                       ),
  //                     ),
  //                     itemCount: _userProvider.storyModel.data.length,
  //                     itemBuilder: (context, index) => GestureDetector(
  //                       onTap: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (_) {
  //                               return Scaffold(
  //                                 body: StoryPageView(
  //                                   itemBuilder: (
  //                                     context,
  //                                     pageIndex,
  //                                     storyIndex,
  //                                   ) {
  //                                     final user = _userProvider
  //                                         .storyModel.data[pageIndex];
  //                                     final story = user.stories[storyIndex];
  //                                     return Stack(
  //                                       children: [
  //                                         Positioned.fill(
  //                                           child:
  //                                               Container(color: Colors.black),
  //                                         ),
  //                                         Positioned.fill(
  //                                           child: Image.network(
  //                                             story.storyMediaImage.filename,
  //                                           ),
  //                                         ),
  //                                         Padding(
  //                                           padding: const EdgeInsets.only(
  //                                               top: 44, left: 8),
  //                                           child: Row(
  //                                             children: [
  //                                               Container(
  //                                                 height: width * .15,
  //                                                 width: width * .15,
  //                                                 decoration: BoxDecoration(
  //                                                   // image:
  //                                                   //     DecorationImage(
  //                                                   //   image: CachedNetworkImageProvider(
  //                                                   //     user.avatar,
  //                                                   //   ),
  //                                                   //   fit: BoxFit.cover,
  //                                                   // ),
  //                                                   shape: BoxShape.circle,
  //                                                 ),
  //                                                 child: ClipOval(
  //                                                   child: FadeInImage
  //                                                       .memoryNetwork(
  //                                                     placeholder:
  //                                                         kTransparentImage,
  //                                                     image: user?.avatar,
  //                                                     imageScale: 0.5,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               const SizedBox(
  //                                                 width: 8,
  //                                               ),
  //                                               Text(
  //                                                 user.username,
  //                                                 style: TextStyle(
  //                                                   fontSize: width * .032,
  //                                                   color: Colors.white,
  //                                                   fontWeight: FontWeight.bold,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     );
  //                                   },
  //                                   gestureItemBuilder:
  //                                       (context, pageIndex, storyIndex) {
  //                                     return Align(
  //                                       alignment: Alignment.topRight,
  //                                       child: Padding(
  //                                         padding:
  //                                             const EdgeInsets.only(top: 32),
  //                                         child: IconButton(
  //                                           padding: EdgeInsets.zero,
  //                                           color: Colors.white,
  //                                           icon: Icon(Icons.close),
  //                                           onPressed: () {
  //                                             Navigator.pop(context);
  //                                           },
  //                                         ),
  //                                       ),
  //                                     );
  //                                   },
  //                                   pageLength:
  //                                       _userProvider.storyModel.data.length,
  //                                   storyLength: (int pageIndex) {
  //                                     return _userProvider.storyModel
  //                                         .data[pageIndex].stories.length;
  //                                   },
  //                                   onPageLimitReached: () {
  //                                     Navigator.pop(context);
  //                                   },
  //                                 ),
  //                               );
  //                             },
  //                           ),
  //                         );
  //                       },
  //                       child: Container(
  //                         width: width * .25,
  //                         child: FadeInImage.memoryNetwork(
  //                           placeholder: kTransparentImage,
  //                           image: _userProvider.storyModel.data[index].stories
  //                               .first.storyMediaImage.filename,
  //                           imageScale: 0.5,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 } else {
  //                   return Center(
  //                     child: CircularProgressIndicator(),
  //                   );
  //                 }
  //               },
  //             )
  //           else
  //             StoryList(
  //               iconBackgroundColor: primaryColor,
  //               addItemBackgroundColor: Colors.white,
  //               borderColor: Colors.transparent,
  //               backgroundColor: Colors.white,
  //               addItemWidth: width * .25,
  //               onPressedIcon: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) => CreateUserStories(),
  //                   ),
  //                 );
  //               },
  //               image: FadeInImage.memoryNetwork(
  //                 image: _userProvider.user.cover,
  //                 fit: BoxFit.cover,
  //                 imageScale: 0.5,
  //                 placeholder: kTransparentImage,
  //               ),
  //               text: Text(
  //                 "",
  //                 maxLines: 1,
  //                 style: labelTextStyle.copyWith(
  //                   fontSize: width * .032,
  //                   color: primaryColor,
  //                 ),
  //               ),
  //               itemCount: _userProvider.storyModel.data.length,
  //               itemBuilder: (context, index) => GestureDetector(
  //                 onTap: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (_) {
  //                         return Scaffold(
  //                           body: StoryPageView(
  //                             itemBuilder: (
  //                               context,
  //                               pageIndex,
  //                               storyIndex,
  //                             ) {
  //                               final user =
  //                                   _userProvider.storyModel.data[pageIndex];
  //                               final story = user.stories[storyIndex];
  //                               return Stack(
  //                                 children: [
  //                                   Positioned.fill(
  //                                     child: Container(color: Colors.black),
  //                                   ),
  //                                   Positioned.fill(
  //                                     child: Image.network(
  //                                       story.storyMediaImage.filename,
  //                                     ),
  //                                   ),
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(
  //                                         top: 44, left: 8),
  //                                     child: Row(
  //                                       children: [
  //                                         Container(
  //                                           height: width * .15,
  //                                           width: width * .15,
  //                                           child: ClipOval(
  //                                             child: FadeInImage.memoryNetwork(
  //                                               placeholder: kTransparentImage,
  //                                               image: user.avatar,
  //                                               imageScale: 0.5,
  //                                               fit: BoxFit.cover,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         const SizedBox(
  //                                           width: 8,
  //                                         ),
  //                                         Text(
  //                                           user.username,
  //                                           style: TextStyle(
  //                                             fontSize: width * .032,
  //                                             color: Colors.white,
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ],
  //                               );
  //                             },
  //                             gestureItemBuilder:
  //                                 (context, pageIndex, storyIndex) {
  //                               return Align(
  //                                 alignment: Alignment.topRight,
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.only(top: 32),
  //                                   child: IconButton(
  //                                     padding: EdgeInsets.zero,
  //                                     color: Colors.white,
  //                                     icon: Icon(Icons.close),
  //                                     onPressed: () {
  //                                       Navigator.pop(context);
  //                                     },
  //                                   ),
  //                                 ),
  //                               );
  //                             },
  //                             pageLength: _userProvider.storyModel.data.length,
  //                             storyLength: (int pageIndex) {
  //                               return _userProvider
  //                                   .storyModel.data[pageIndex].stories.length;
  //                             },
  //                             onPageLimitReached: () {
  //                               Navigator.pop(context);
  //                             },
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 },
  //                 child: Container(
  //                   width: width * .25,
  //                   child: FadeInImage.memoryNetwork(
  //                     image: _userProvider.storyModel.data[index].stories.first
  //                         .storyMediaImage.filename,
  //                     imageScale: 0.5,
  //                     fit: BoxFit.cover,
  //                     placeholder: kTransparentImage,
  //                   ),
  //                 ),
  //               ),
  //             ),

  //           FutureBuilder(
  //             future: _timelineProvider.getTimeLinePosts(
  //               context: context,
  //               pageNo: pageNo,
  //             ),
  //             builder: (context, snapshot) {
  //               if (snapshot.hasData) {
  //                 return Expanded(
  //                   child: ListView.builder(
  //                     // separatorBuilder: (context, index) {
  //                     //   return Container(
  //                     //     height: height * .003,
  //                     //     color: Colors.grey[300],
  //                     //     width: double.infinity,
  //                     //   );
  //                     // },
  //                     controller: scrollController,
  //                     cacheExtent: 99999999,
  //                     shrinkWrap: true,
  //                     physics: const AlwaysScrollableScrollPhysics(),
  //                     itemCount: _timelineProvider.timelineData.length,
  //                     itemBuilder: (context, timelineIndex) {
  //                       List<TimelinePostComments> comments = [];

  //                       comments = _timelineProvider
  //                               .timelineData[timelineIndex]?.comments ??
  //                           [];

  //                       String imageURL;
  //                       String iframe;
  //                       String videoURL;
  //                       String postText;

  //                       bool shared = false;

  //                       if (_timelineProvider
  //                               .timelineData[timelineIndex].sharedBy !=
  //                           null) {
  //                         shared = true;
  //                       } else {
  //                         shared = false;
  //                       }

  //                       List<Album> album = [];

  //                       if (shared) {
  //                         if (_timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.postText !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .sharedBy.postText.isNotEmpty) {
  //                           postText = _timelineProvider
  //                                   .timelineData[timelineIndex]
  //                                   .sharedBy
  //                                   .postText ??
  //                               "";
  //                         }
  //                         if (_timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.postYoutube !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .sharedBy.postYoutube.isNotEmpty) {
  //                           iframe = _timelineProvider
  //                               .timelineData[timelineIndex]
  //                               .sharedBy
  //                               .postYoutube;
  //                         }
  //                         if (_timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.album !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.album.length >
  //                                 0) {
  //                           album = _timelineProvider
  //                               .timelineData[timelineIndex].sharedBy.album;
  //                         }
  //                         if (_timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.postFile !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .sharedBy.postFile.isNotEmpty) {
  //                           if (_timelineProvider
  //                               .timelineData[timelineIndex].sharedBy.postFile
  //                               .contains(".mp4")) {
  //                             videoURL = _timelineProvider
  //                                 .timelineData[timelineIndex]
  //                                 .sharedBy
  //                                 .postFile;
  //                           } else {
  //                             imageURL = _timelineProvider
  //                                 .timelineData[timelineIndex]
  //                                 .sharedBy
  //                                 .postFile;
  //                           }
  //                         } else if (_timelineProvider
  //                                     .timelineData[timelineIndex]
  //                                     .sharedBy
  //                                     .postLink !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .sharedBy.postLink.isNotEmpty) {
  //                           {
  //                             if (_timelineProvider
  //                                 .timelineData[timelineIndex].sharedBy.postLink
  //                                 .contains(".mp4")) {
  //                               videoURL = _timelineProvider
  //                                   .timelineData[timelineIndex]
  //                                   .sharedBy
  //                                   .postLink;
  //                             } else if (_timelineProvider
  //                                         .timelineData[timelineIndex]
  //                                         .sharedBy
  //                                         .postLinkImage !=
  //                                     null &&
  //                                 _timelineProvider.timelineData[timelineIndex]
  //                                     .sharedBy.postLinkImage.isNotEmpty) {
  //                               imageURL = _timelineProvider
  //                                   .timelineData[timelineIndex]
  //                                   .sharedBy
  //                                   .postLinkImage;
  //                             } else {
  //                               imageURL = _timelineProvider
  //                                   .timelineData[timelineIndex]
  //                                   .sharedBy
  //                                   .postLink;
  //                             }
  //                           }
  //                         } else if (_timelineProvider
  //                                     .timelineData[timelineIndex]
  //                                     .sharedBy
  //                                     .postYoutube !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .sharedBy.postYoutube.isNotEmpty) {
  //                           iframe = _timelineProvider
  //                               .timelineData[timelineIndex]
  //                               .sharedBy
  //                               .postYoutube;
  //                         }
  //                       } else {
  //                         if (_timelineProvider.timelineData[timelineIndex]
  //                                     .postYoutube !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .postYoutube.isNotEmpty) {
  //                           iframe = _timelineProvider
  //                               .timelineData[timelineIndex].postYoutube;
  //                         }
  //                         if (_timelineProvider
  //                                     .timelineData[timelineIndex].album !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                     .album.length >
  //                                 0) {
  //                           album = _timelineProvider
  //                               .timelineData[timelineIndex].album;
  //                         }
  //                         if (_timelineProvider
  //                                     .timelineData[timelineIndex].postFile !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .postFile.isNotEmpty) {
  //                           if (_timelineProvider
  //                               .timelineData[timelineIndex].postFile
  //                               .contains("mp4")) {
  //                             videoURL = _timelineProvider
  //                                 .timelineData[timelineIndex].postFile;
  //                           } else {
  //                             imageURL = _timelineProvider
  //                                 .timelineData[timelineIndex].postFile;
  //                           }
  //                         } else if (_timelineProvider
  //                                     .timelineData[timelineIndex].postLink !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .postLink.isNotEmpty) {
  //                           if (_timelineProvider
  //                               .timelineData[timelineIndex].postLink
  //                               .contains("mp4")) {
  //                             videoURL = _timelineProvider
  //                                 .timelineData[timelineIndex].postLink;
  //                           } else if (_timelineProvider
  //                                       .timelineData[timelineIndex]
  //                                       .postLinkImage !=
  //                                   null &&
  //                               _timelineProvider.timelineData[timelineIndex]
  //                                   .postLinkImage.isNotEmpty) {
  //                             imageURL = _timelineProvider
  //                                 .timelineData[timelineIndex].postLinkImage;
  //                           } else {
  //                             imageURL = _timelineProvider
  //                                 .timelineData[timelineIndex].postLink;
  //                           }
  //                         } else if (_timelineProvider
  //                                     .timelineData[timelineIndex]
  //                                     .postYoutube !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .postYoutube.isNotEmpty) {
  //                           iframe = _timelineProvider
  //                               .timelineData[timelineIndex].postYoutube;
  //                         }
  //                         if (_timelineProvider
  //                                     .timelineData[timelineIndex].postText !=
  //                                 null &&
  //                             _timelineProvider.timelineData[timelineIndex]
  //                                 .postText.isNotEmpty) {
  //                           postText = _timelineProvider
  //                               .timelineData[timelineIndex].postText;
  //                         }
  //                       }

  //                       List<Reactions> reactions = [];

  //                       if (_timelineProvider
  //                                   .timelineData[timelineIndex].reactions !=
  //                               null &&
  //                           _timelineProvider.timelineData[timelineIndex]
  //                                   .reactions.length >
  //                               0) {
  //                         reactions = _timelineProvider
  //                             .timelineData[timelineIndex].reactions;
  //                         likeReaction = reactions[reactionIndex ?? 0].reaction;
  //                       } else {
  //                         reactions = [];
  //                       }

  //                       return HomePostWidget(
  //                         page: _timelineProvider
  //                             .timelineData[timelineIndex].page,
  //                         user: _timelineProvider
  //                             .timelineData[timelineIndex].user,
  //                         group: _timelineProvider
  //                             .timelineData[timelineIndex].group,
  //                         isPostShared: shared,
  //                         time: _timelineProvider
  //                             .timelineData[timelineIndex].time,
  //                         postColor: _timelineProvider
  //                                     .timelineData[timelineIndex].colored !=
  //                                 null
  //                             ? _timelineProvider
  //                                 .timelineData[timelineIndex].colored
  //                             : null,
  //                         likedButtonOnPressed: () {
  //                           SizeConfig().init(context);

  //                           showDialog(
  //                             context: context,
  //                             useSafeArea: false,
  //                             builder: (context) {
  //                               return AlertDialog(
  //                                 contentPadding: EdgeInsets.all(0),
  //                                 actionsPadding: EdgeInsets.all(0),
  //                                 buttonPadding: EdgeInsets.all(0),
  //                                 insetPadding: EdgeInsets.all(0),
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(
  //                                     SizeConfig.kDefaultSize * 18,
  //                                   ),
  //                                 ),
  //                                 clipBehavior: Clip.antiAliasWithSaveLayer,
  //                                 titlePadding: EdgeInsets.all(0),
  //                                 content: Container(
  //                                   height: SizeConfig.kDefaultSize * 20,
  //                                   width:
  //                                       MediaQuery.of(context).size.width - 20,
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                   ),
  //                                   clipBehavior: Clip.antiAliasWithSaveLayer,
  //                                   child: Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceEvenly,
  //                                     children: List.generate(
  //                                       emojis.length,
  //                                       (emojiIndex) {
  //                                         return GestureDetector(
  //                                           onTap: () async {
  //                                             if (reactions == null) {
  //                                               reactions = [];
  //                                             } else if (reactions.length > 0) {
  //                                               reactions.forEach((element) {
  //                                                 if (element.postId ==
  //                                                         _timelineProvider
  //                                                             .timelineData[
  //                                                                 timelineIndex]
  //                                                             .id &&
  //                                                     element.user.userId ==
  //                                                         _userProvider
  //                                                             .user.userId) {
  //                                                   setState(() {
  //                                                     reactionIndex = reactions
  //                                                         .indexOf(element);
  //                                                   });
  //                                                 }
  //                                               });
  //                                             }
  //                                             Reactions reaction = Reactions();
  //                                             User user = User();
  //                                             reaction.postId =
  //                                                 _timelineProvider
  //                                                     .timelineData[
  //                                                         timelineIndex]
  //                                                     .id;
  //                                             user.userId =
  //                                                 _userProvider.user.userId;
  //                                             user.email =
  //                                                 _userProvider.user.email;

  //                                             user.avatar =
  //                                                 _userProvider.user.avatar;
  //                                             user.username =
  //                                                 _userProvider.user.username;
  //                                             if (_userProvider
  //                                                         .user.firstName !=
  //                                                     null &&
  //                                                 _userProvider.user.lastName !=
  //                                                     null) {
  //                                               user.firstName = _userProvider
  //                                                   .user.firstName;
  //                                               user.lastName =
  //                                                   _userProvider.user.lastName;
  //                                             }

  //                                             reaction.user = user;
  //                                             reaction.reaction =
  //                                                 emojis[emojiIndex]
  //                                                     .replaceAll(
  //                                                         "assets/images/", "")
  //                                                     .replaceAll(".gif", "");

  //                                             if (reactionIndex != null) {
  //                                               if (reactions.length > 0) {
  //                                                 setState(() {
  //                                                   reactions.removeAt(
  //                                                       reactionIndex);
  //                                                   reactions.insert(
  //                                                       reactionIndex,
  //                                                       reaction);
  //                                                   _timelineProvider
  //                                                       .timelineData[
  //                                                           timelineIndex]
  //                                                       .reactions = reactions;
  //                                                 });
  //                                               } else {
  //                                                 setState(() {
  //                                                   reactions.add(reaction);
  //                                                   _timelineProvider
  //                                                       .timelineData[
  //                                                           timelineIndex]
  //                                                       .reactions = reactions;
  //                                                 });
  //                                               }
  //                                             } else {
  //                                               setState(() {
  //                                                 reactions.add(reaction);
  //                                                 _timelineProvider
  //                                                     .timelineData[
  //                                                         timelineIndex]
  //                                                     .reactions = reactions;
  //                                               });
  //                                             }
  //                                             Navigator.pop(context);
  //                                             _timelineProvider.likePost(
  //                                               context,
  //                                               postID:
  //                                                   reaction.postId.toString(),
  //                                               reaction: reaction.reaction,
  //                                             );
  //                                           },
  //                                           child: SizedBox(
  //                                             width:
  //                                                 SizeConfig.kDefaultSize * 10,
  //                                             height:
  //                                                 SizeConfig.kDefaultSize * 10,
  //                                             child: Image.asset(
  //                                               emojis[emojiIndex],
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                     ),
  //                                   ),
  //                                 ),
  //                               );
  //                             },
  //                           );
  //                         },
  //                         comments: _timelineProvider
  //                             .timelineData[timelineIndex].comments,
  //                         comment: comments != null
  //                             ? comments.length > 0
  //                                 ? comments[0]
  //                                 : TimelinePostComments()
  //                             : TimelinePostComments(),
  //                         commentButtonCallback: () {
  //                           commentBottomSheet(
  //                             context,
  //                             comments: comments ?? [],
  //                             postID: _timelineProvider
  //                                 .timelineData[timelineIndex].postId
  //                                 .toString(),
  //                             timelineIndex: timelineIndex,
  //                             totalLikes: reactions.length,
  //                           );
  //                         },
  //                         feelings: _timelineProvider
  //                             .timelineData[timelineIndex].postFeeling,
  //                         timelineIndex: timelineIndex,
  //                         shareButtonCallback: () {
  //                           shareBottomSheet(
  //                             context,
  //                             postID: _timelineProvider
  //                                 .timelineData[timelineIndex].postId
  //                                 .toString(),
  //                           );
  //                         },
  //                         postSticker: _timelineProvider
  //                             .timelineData[timelineIndex].postSticker,
  //                         postID: _timelineProvider
  //                             .timelineData[timelineIndex].id
  //                             .toString(),
  //                         moreButtonCallback: () {
  //                           print(
  //                               _timelineProvider.timelineData[timelineIndex]);
  //                           showPostMenuBottomSheet(
  //                             context,
  //                             postID: _timelineProvider
  //                                 .timelineData[timelineIndex].id
  //                                 .toString(),
  //                             timelineData:
  //                                 _timelineProvider.timelineData[timelineIndex],
  //                           );
  //                         },
  //                         reactionCount:
  //                             reactions.length == 0 ? null : reactions.length,
  //                         description: postText,
  //                         iframe: iframe,
  //                         album: album,
  //                         videoURL: videoURL,
  //                         imageURL: _timelineProvider
  //                                     .timelineData[timelineIndex].album !=
  //                                 null
  //                             ? imageURL
  //                             : null,
  //                         name: _timelineProvider
  //                                     .timelineData[timelineIndex].page !=
  //                                 null
  //                             ? _timelineProvider
  //                                 .timelineData[timelineIndex].page.pageTitle
  //                             : _timelineProvider
  //                                         .timelineData[timelineIndex].user !=
  //                                     null
  //                                 ? _timelineProvider
  //                                                 .timelineData[timelineIndex]
  //                                                 .user
  //                                                 .firstName !=
  //                                             null &&
  //                                         _timelineProvider
  //                                                 .timelineData[timelineIndex]
  //                                                 .user
  //                                                 .lastName !=
  //                                             null
  //                                     ? _timelineProvider
  //                                             .timelineData[timelineIndex]
  //                                             .user
  //                                             .firstName +
  //                                         " " +
  //                                         _timelineProvider
  //                                             .timelineData[timelineIndex]
  //                                             .user
  //                                             .lastName
  //                                     : _timelineProvider
  //                                                 .timelineData[timelineIndex]
  //                                                 .user
  //                                                 .username !=
  //                                             null
  //                                         ? _timelineProvider
  //                                             .timelineData[timelineIndex]
  //                                             .user
  //                                             .username
  //                                         : " "
  //                                 : " ",
  //                         profileAvatar: _timelineProvider
  //                                     .timelineData[timelineIndex].page !=
  //                                 null
  //                             ? _timelineProvider
  //                                 .timelineData[timelineIndex].page.avatar
  //                             : _timelineProvider
  //                                         .timelineData[timelineIndex].user !=
  //                                     null
  //                                 ? _timelineProvider
  //                                     .timelineData[timelineIndex].user.avatar
  //                                 : null,
  //                         reaction: likeReaction,
  //                         postType: _timelineProvider
  //                                 .timelineData[timelineIndex].type ??
  //                             "",
  //                         option: _timelineProvider
  //                                 .timelineData[timelineIndex].options ??
  //                             [],
  //                         showCommentBottomSheet: () {
  //                           commentBottomSheet(
  //                             context,
  //                             comments: comments ?? [],
  //                             postID: _timelineProvider
  //                                 .timelineData[timelineIndex].postId
  //                                 .toString(),
  //                             timelineIndex: timelineIndex,
  //                             totalLikes: reactions.length,
  //                           );
  //                         },
  //                       );
  //                     },
  //                   ),
  //                 );
  //               } else {
  //                 return Container();
  //               }
  //             },
  //           ),
  //           // if (_timelineProvider.timelineData != null)
  //           //   Expanded(
  //           //     child: SmartRefresher(
  //           //       physics: const AlwaysScrollableScrollPhysics(),
  //           //       scrollDirection: Axis.vertical,
  //           //       controller: _refreshController,
  //           //       onLoading: () async {
  //           //         // print(_refreshController.position);
  //           //         setState(() {
  //           //           pageNo = pageNo + 1;
  //           //         });
  //           //         await _timelineProvider.getTimeLinePosts(
  //           //           context: context,
  //           //           pageNo: pageNo,
  //           //         );

  //           //         _refreshController.loadComplete();
  //           //       },
  //           //       scrollController: scrollController,
  //           //       enablePullDown: true,
  //           //       onRefresh: () async {
  //           //         setState(() {
  //           //           pageNo = 1;
  //           //           _timelineProvider.timelineData = [];
  //           //         });

  //           //         await _timelineProvider.getTimeLinePosts(
  //           //           context: context,
  //           //           pageNo: pageNo,
  //           //         );
  //           //         _refreshController.refreshCompleted();
  //           //       },
  //           //       enablePullUp: true,
  //           //       footer: CustomFooter(
  //           //         builder: (BuildContext context, LoadStatus mode) {
  //           //           Widget body;
  //           //           if (mode == LoadStatus.idle) {
  //           //             body = Text(
  //           //               "",
  //           //               style: labelTextStyle.copyWith(
  //           //                 fontSize: width * .04,
  //           //               ),
  //           //               textScaleFactor: 1,
  //           //             );
  //           //           } else if (mode == LoadStatus.loading) {
  //           //             body = Column(
  //           //               mainAxisSize: MainAxisSize.min,
  //           //               crossAxisAlignment: CrossAxisAlignment.start,
  //           //               children: [
  //           //                 Center(
  //           //                   child: CircularProgressIndicator(),
  //           //                 ),
  //           //                 Center(
  //           //                   child: Text(
  //           //                     'Getting new posts',
  //           //                     style: labelTextStyle.copyWith(
  //           //                       fontSize: width * .024,
  //           //                     ),
  //           //                   ),
  //           //                 ),
  //           //               ],
  //           //             );
  //           //           } else if (mode == LoadStatus.failed) {
  //           //             body = Text(
  //           //               "",
  //           //               textScaleFactor: 1,
  //           //             );
  //           //           } else if (mode == LoadStatus.canLoading) {
  //           //             body = Text(
  //           //               "",
  //           //               style: labelTextStyle.copyWith(
  //           //                 fontSize: width * .04,
  //           //               ),
  //           //               textScaleFactor: 1,
  //           //             );
  //           //           } else {
  //           //             body = Text(
  //           //               "",
  //           //               textScaleFactor: 1,
  //           //             );
  //           //           }
  //           //           return Container(
  //           //             height: 55.0,
  //           //             child: Center(child: body),
  //           //           );
  //           //         },
  //           //       ),
  //           //       child: SingleChildScrollView(
  //           //         // physics: const BouncingScrollPhysics(),
  //           //         child: Container(
  //           //           width: double.infinity,
  //           //           color: Color(0xffE0E0E0),
  //           //           child: Column(
  //           //             crossAxisAlignment: CrossAxisAlignment.start,
  //           //             children: [
  //           //               Container(
  //           //                 color: Colors.white,
  //           //                 child: Column(
  //           //                   children: [
  //           //                     Padding(
  //           //                       padding: EdgeInsets.symmetric(
  //           //                           horizontal: width * .04),
  //           //                       child: Row(
  //           //                         crossAxisAlignment:
  //           //                             CrossAxisAlignment.start,
  //           //                         children: [
  //           //                           SizedBox(
  //           //                             width: width * .14,
  //           //                             height: width * .14,
  //           //                             child: _userProvider.user?.avatar !=
  //           //                                     null
  //           //                                 ? Container(
  //           //                                     width: width * .14,
  //           //                                     height: width * .14,
  //           //                                     decoration: BoxDecoration(
  //           //                                       shape: BoxShape.circle,
  //           //                                     ),
  //           //                                     child: ClipOval(
  //           //                                       child:
  //           //                                           FadeInImage.memoryNetwork(
  //           //                                         image: _userProvider
  //           //                                             .user.avatar,
  //           //                                         placeholder:
  //           //                                             kTransparentImage,
  //           //                                         imageScale: 0.5,
  //           //                                       ),
  //           //                                     ),
  //           //                                   )
  //           //                                 : Image.asset(
  //           //                                     Assets.PROFILE_AVATAR,
  //           //                                   ),
  //           //                           ),
  //           //                           SizedBox(
  //           //                             width: width * .02,
  //           //                           ),
  //           //                           Flexible(
  //           //                             child: MediaQuery(
  //           //                               data: MediaQuery.of(context).copyWith(
  //           //                                 textScaleFactor: 1,
  //           //                               ),
  //           //                               child: TextField(
  //           //                                 onTap: () {
  //           //                                   Provider.of<PostProvider>(context,
  //           //                                           listen: false)
  //           //                                       .changeFeelings(null);
  //           //                                   Provider.of<PostProvider>(context,
  //           //                                           listen: false)
  //           //                                       .changeGIFurl(null);
  //           //                                   Navigator.push(
  //           //                                     context,
  //           //                                     MaterialPageRoute(
  //           //                                       builder: (_) =>
  //           //                                           CreatePostScreen(),
  //           //                                     ),
  //           //                                   );
  //           //                                 },
  //           //                                 autofocus: false,
  //           //                                 readOnly: true,
  //           //                                 controller:
  //           //                                     _postTextEditingController,
  //           //                                 maxLines: 2,
  //           //                                 decoration: InputDecoration(
  //           //                                   hintStyle: hintTextStyle.copyWith(
  //           //                                     fontSize: width * .04,
  //           //                                   ),
  //           //                                   hintText: 'What\'s going on?',
  //           //                                   border: InputBorder.none,
  //           //                                 ),
  //           //                                 style: labelTextStyle.copyWith(
  //           //                                   fontSize: width * .04,
  //           //                                 ),
  //           //                               ),
  //           //                             ),
  //           //                           ),
  //           //                         ],
  //           //                       ),
  //           //                     ),
  //           //                     SizedBox(
  //           //                       height: height * .01,
  //           //                     ),
  //           //                     Divider(
  //           //                       color: Colors.grey[300],
  //           //                       height: height * .003,
  //           //                     ),
  //           //                     Row(
  //           //                       children: [
  //           //                         Expanded(
  //           //                           child: YouOnlineTextButton(
  //           //                             assetImage: Assets.UPLOAD_IMAGE_ICON,
  //           //                             title: 'Photo',
  //           //                             color: searchContainerColor,
  //           //                             callback: () async {
  //           //                               FilePickerResult result =
  //           //                                   await FilePicker.platform
  //           //                                       .pickFiles(
  //           //                                 allowMultiple: true,
  //           //                                 type: FileType.image,
  //           //                               );

  //           //                               if (result != null) {
  //           //                                 List<File> files = result.paths
  //           //                                     .map((path) => File(path))
  //           //                                     .toList();

  //           //                                 uploadMultipleImage(
  //           //                                   files: files,
  //           //                                   authenticationToken: _userProvider
  //           //                                       .userAuthenticationToken,
  //           //                                   context: context,
  //           //                                 );
  //           //                               }
  //           //                             },
  //           //                           ),
  //           //                         ),
  //           //                         Container(
  //           //                           height: height * .03,
  //           //                           width: width * .002,
  //           //                           color: Colors.grey[300],
  //           //                         ),
  //           //                         Expanded(
  //           //                           child: YouOnlineTextButton(
  //           //                             title: 'Activity',
  //           //                             assetImage: Assets.FEELINGS_ICON,
  //           //                             color: yellowColor,
  //           //                             callback: () {
  //           //                               Provider.of<PostProvider>(context,
  //           //                                       listen: false)
  //           //                                   .changeFeelings(null);
  //           //                               Provider.of<PostProvider>(context,
  //           //                                       listen: false)
  //           //                                   .changeGIFurl(null);
  //           //                               Navigator.push(
  //           //                                 context,
  //           //                                 MaterialPageRoute(
  //           //                                   builder: (_) =>
  //           //                                       CreatePostScreen(),
  //           //                                 ),
  //           //                               );
  //           //                             },
  //           //                           ),
  //           //                         ),
  //           //                       ],
  //           //                     ),
  //           //                   ],
  //           //                 ),
  //           //               ),
  //           //               // SizedBox(
  //           //               //   height: height * .01,
  //           //               // ),
  //           //               // ProfilePictures(),
  //           //               SizedBox(
  //           //                 height: height * .005,
  //           //               ),
  //           //               if (widget.isMainScreen)
  //           //                 FutureBuilder<StoryModel>(
  //           //                   future: initStoryData,
  //           //                   builder: (context, snapshot) {
  //           //                     if (snapshot.hasData) {
  //           //                       return StoryList(
  //           //                         iconBackgroundColor: primaryColor,
  //           //                         addItemBackgroundColor: Colors.white,
  //           //                         borderColor: Colors.transparent,
  //           //                         backgroundColor: Colors.white,
  //           //                         addItemWidth: width * .25,
  //           //                         onPressedIcon: () {
  //           //                           Navigator.push(
  //           //                             context,
  //           //                             MaterialPageRoute(
  //           //                               builder: (_) => CreateUserStories(),
  //           //                             ),
  //           //                           );
  //           //                         },
  //           //                         image: FadeInImage.memoryNetwork(
  //           //                           image: _userProvider.user.cover,
  //           //                           fit: BoxFit.cover,
  //           //                           placeholder: kTransparentImage,
  //           //                           imageScale: 0.5,
  //           //                         ),
  //           //                         text: Text(
  //           //                           "",
  //           //                           maxLines: 1,
  //           //                           style: labelTextStyle.copyWith(
  //           //                             fontSize: width * .032,
  //           //                             color: primaryColor,
  //           //                           ),
  //           //                         ),
  //           //                         itemCount:
  //           //                             _userProvider.storyModel.data.length,
  //           //                         itemBuilder: (context, index) =>
  //           //                             GestureDetector(
  //           //                           onTap: () {
  //           //                             Navigator.push(
  //           //                               context,
  //           //                               MaterialPageRoute(
  //           //                                 builder: (_) {
  //           //                                   return Scaffold(
  //           //                                     body: StoryPageView(
  //           //                                       itemBuilder: (
  //           //                                         context,
  //           //                                         pageIndex,
  //           //                                         storyIndex,
  //           //                                       ) {
  //           //                                         final user = _userProvider
  //           //                                             .storyModel
  //           //                                             .data[pageIndex];
  //           //                                         final story = user
  //           //                                             .stories[storyIndex];
  //           //                                         return Stack(
  //           //                                           children: [
  //           //                                             Positioned.fill(
  //           //                                               child: Container(
  //           //                                                   color:
  //           //                                                       Colors.black),
  //           //                                             ),
  //           //                                             Positioned.fill(
  //           //                                               child: Image.network(
  //           //                                                 story
  //           //                                                     .storyMediaImage
  //           //                                                     .filename,
  //           //                                               ),
  //           //                                             ),
  //           //                                             Padding(
  //           //                                               padding:
  //           //                                                   const EdgeInsets
  //           //                                                           .only(
  //           //                                                       top: 44,
  //           //                                                       left: 8),
  //           //                                               child: Row(
  //           //                                                 children: [
  //           //                                                   Container(
  //           //                                                     height:
  //           //                                                         width * .15,
  //           //                                                     width:
  //           //                                                         width * .15,
  //           //                                                     decoration:
  //           //                                                         BoxDecoration(
  //           //                                                       // image:
  //           //                                                       //     DecorationImage(
  //           //                                                       //   image: CachedNetworkImageProvider(
  //           //                                                       //     user.avatar,
  //           //                                                       //   ),
  //           //                                                       //   fit: BoxFit.cover,
  //           //                                                       // ),
  //           //                                                       shape: BoxShape
  //           //                                                           .circle,
  //           //                                                     ),
  //           //                                                     child: ClipOval(
  //           //                                                       child: FadeInImage
  //           //                                                           .memoryNetwork(
  //           //                                                         placeholder:
  //           //                                                             kTransparentImage,
  //           //                                                         image: user
  //           //                                                             ?.avatar,
  //           //                                                         imageScale:
  //           //                                                             0.5,
  //           //                                                       ),
  //           //                                                     ),
  //           //                                                   ),
  //           //                                                   const SizedBox(
  //           //                                                     width: 8,
  //           //                                                   ),
  //           //                                                   Text(
  //           //                                                     user.username,
  //           //                                                     style:
  //           //                                                         TextStyle(
  //           //                                                       fontSize:
  //           //                                                           width *
  //           //                                                               .032,
  //           //                                                       color: Colors
  //           //                                                           .white,
  //           //                                                       fontWeight:
  //           //                                                           FontWeight
  //           //                                                               .bold,
  //           //                                                     ),
  //           //                                                   ),
  //           //                                                 ],
  //           //                                               ),
  //           //                                             ),
  //           //                                           ],
  //           //                                         );
  //           //                                       },
  //           //                                       gestureItemBuilder: (context,
  //           //                                           pageIndex, storyIndex) {
  //           //                                         return Align(
  //           //                                           alignment:
  //           //                                               Alignment.topRight,
  //           //                                           child: Padding(
  //           //                                             padding:
  //           //                                                 const EdgeInsets
  //           //                                                     .only(top: 32),
  //           //                                             child: IconButton(
  //           //                                               padding:
  //           //                                                   EdgeInsets.zero,
  //           //                                               color: Colors.white,
  //           //                                               icon:
  //           //                                                   Icon(Icons.close),
  //           //                                               onPressed: () {
  //           //                                                 Navigator.pop(
  //           //                                                     context);
  //           //                                               },
  //           //                                             ),
  //           //                                           ),
  //           //                                         );
  //           //                                       },
  //           //                                       pageLength: _userProvider
  //           //                                           .storyModel.data.length,
  //           //                                       storyLength: (int pageIndex) {
  //           //                                         return _userProvider
  //           //                                             .storyModel
  //           //                                             .data[pageIndex]
  //           //                                             .stories
  //           //                                             .length;
  //           //                                       },
  //           //                                       onPageLimitReached: () {
  //           //                                         Navigator.pop(context);
  //           //                                       },
  //           //                                     ),
  //           //                                   );
  //           //                                 },
  //           //                               ),
  //           //                             );
  //           //                           },
  //           //                           child: Container(
  //           //                             width: width * .25,
  //           //                             child: FadeInImage.memoryNetwork(
  //           //                               placeholder: kTransparentImage,
  //           //                               image: _userProvider
  //           //                                   .storyModel
  //           //                                   .data[index]
  //           //                                   .stories
  //           //                                   .first
  //           //                                   .storyMediaImage
  //           //                                   .filename,
  //           //                               imageScale: 0.5,
  //           //                               fit: BoxFit.cover,
  //           //                             ),
  //           //                           ),
  //           //                         ),
  //           //                       );
  //           //                     } else {
  //           //                       return Center(
  //           //                         child: CircularProgressIndicator(),
  //           //                       );
  //           //                     }
  //           //                   },
  //           //                 )
  //           //               else
  //           //                 StoryList(
  //           //                   iconBackgroundColor: primaryColor,
  //           //                   addItemBackgroundColor: Colors.white,
  //           //                   borderColor: Colors.transparent,
  //           //                   backgroundColor: Colors.white,
  //           //                   addItemWidth: width * .25,
  //           //                   onPressedIcon: () {
  //           //                     Navigator.push(
  //           //                       context,
  //           //                       MaterialPageRoute(
  //           //                         builder: (_) => CreateUserStories(),
  //           //                       ),
  //           //                     );
  //           //                   },
  //           //                   image: FadeInImage.memoryNetwork(
  //           //                     image: _userProvider.user.cover,
  //           //                     fit: BoxFit.cover,
  //           //                     imageScale: 0.5,
  //           //                     placeholder: kTransparentImage,
  //           //                   ),
  //           //                   text: Text(
  //           //                     "",
  //           //                     maxLines: 1,
  //           //                     style: labelTextStyle.copyWith(
  //           //                       fontSize: width * .032,
  //           //                       color: primaryColor,
  //           //                     ),
  //           //                   ),
  //           //                   itemCount: _userProvider.storyModel.data.length,
  //           //                   itemBuilder: (context, index) => GestureDetector(
  //           //                     onTap: () {
  //           //                       Navigator.push(
  //           //                         context,
  //           //                         MaterialPageRoute(
  //           //                           builder: (_) {
  //           //                             return Scaffold(
  //           //                               body: StoryPageView(
  //           //                                 itemBuilder: (
  //           //                                   context,
  //           //                                   pageIndex,
  //           //                                   storyIndex,
  //           //                                 ) {
  //           //                                   final user = _userProvider
  //           //                                       .storyModel.data[pageIndex];
  //           //                                   final story =
  //           //                                       user.stories[storyIndex];
  //           //                                   return Stack(
  //           //                                     children: [
  //           //                                       Positioned.fill(
  //           //                                         child: Container(
  //           //                                             color: Colors.black),
  //           //                                       ),
  //           //                                       Positioned.fill(
  //           //                                         child: Image.network(
  //           //                                           story.storyMediaImage
  //           //                                               .filename,
  //           //                                         ),
  //           //                                       ),
  //           //                                       Padding(
  //           //                                         padding:
  //           //                                             const EdgeInsets.only(
  //           //                                                 top: 44, left: 8),
  //           //                                         child: Row(
  //           //                                           children: [
  //           //                                             Container(
  //           //                                               height: width * .15,
  //           //                                               width: width * .15,
  //           //                                               child: ClipOval(
  //           //                                                 child: FadeInImage
  //           //                                                     .memoryNetwork(
  //           //                                                   placeholder:
  //           //                                                       kTransparentImage,
  //           //                                                   image:
  //           //                                                       user.avatar,
  //           //                                                   imageScale: 0.5,
  //           //                                                   fit: BoxFit.cover,
  //           //                                                 ),
  //           //                                               ),
  //           //                                             ),
  //           //                                             const SizedBox(
  //           //                                               width: 8,
  //           //                                             ),
  //           //                                             Text(
  //           //                                               user.username,
  //           //                                               style: TextStyle(
  //           //                                                 fontSize:
  //           //                                                     width * .032,
  //           //                                                 color: Colors.white,
  //           //                                                 fontWeight:
  //           //                                                     FontWeight.bold,
  //           //                                               ),
  //           //                                             ),
  //           //                                           ],
  //           //                                         ),
  //           //                                       ),
  //           //                                     ],
  //           //                                   );
  //           //                                 },
  //           //                                 gestureItemBuilder: (context,
  //           //                                     pageIndex, storyIndex) {
  //           //                                   return Align(
  //           //                                     alignment: Alignment.topRight,
  //           //                                     child: Padding(
  //           //                                       padding:
  //           //                                           const EdgeInsets.only(
  //           //                                               top: 32),
  //           //                                       child: IconButton(
  //           //                                         padding: EdgeInsets.zero,
  //           //                                         color: Colors.white,
  //           //                                         icon: Icon(Icons.close),
  //           //                                         onPressed: () {
  //           //                                           Navigator.pop(context);
  //           //                                         },
  //           //                                       ),
  //           //                                     ),
  //           //                                   );
  //           //                                 },
  //           //                                 pageLength: _userProvider
  //           //                                     .storyModel.data.length,
  //           //                                 storyLength: (int pageIndex) {
  //           //                                   return _userProvider
  //           //                                       .storyModel
  //           //                                       .data[pageIndex]
  //           //                                       .stories
  //           //                                       .length;
  //           //                                 },
  //           //                                 onPageLimitReached: () {
  //           //                                   Navigator.pop(context);
  //           //                                 },
  //           //                               ),
  //           //                             );
  //           //                           },
  //           //                         ),
  //           //                       );
  //           //                     },
  //           //                     child: Container(
  //           //                       width: width * .25,
  //           //                       child: FadeInImage.memoryNetwork(
  //           //                         image: _userProvider.storyModel.data[index]
  //           //                             .stories.first.storyMediaImage.filename,
  //           //                         imageScale: 0.5,
  //           //                         fit: BoxFit.cover,
  //           //                         placeholder: kTransparentImage,
  //           //                       ),
  //           //                     ),
  //           //                   ),
  //           //                 ),
  //           //               // ProfileStoryRow(),
  //           //               // ListView.separated(
  //           //               // separatorBuilder: (context, index) {
  //           //               //   return Divider(
  //           //               //     color: Colors.grey[300],
  //           //               //     height: SizeConfig.kDefaultSize * .03,
  //           //               //   );
  //           //               // },
  //           //               ListView.builder(
  //           //                 // separatorBuilder: (context, index) {
  //           //                 //   return Container(
  //           //                 //     height: height * .003,
  //           //                 //     color: Colors.grey[300],
  //           //                 //     width: double.infinity,
  //           //                 //   );
  //           //                 // },
  //           //                 cacheExtent: 99999999,
  //           //                 shrinkWrap: true,
  //           //                 physics: const NeverScrollableScrollPhysics(),
  //           //                 itemCount: _timelineProvider.timelineData.length,
  //           //                 itemBuilder: (context, timelineIndex) {
  //           //                   List<TimelinePostComments> comments = [];

  //           //                   comments = _timelineProvider
  //           //                           .timelineData[timelineIndex]?.comments ??
  //           //                       [];

  //           //                   String imageURL;
  //           //                   String iframe;
  //           //                   String videoURL;
  //           //                   String postText;

  //           //                   bool shared = false;

  //           //                   if (_timelineProvider
  //           //                           .timelineData[timelineIndex].sharedBy !=
  //           //                       null) {
  //           //                     shared = true;
  //           //                   } else {
  //           //                     shared = false;
  //           //                   }

  //           //                   List<Album> album = [];

  //           //                   if (shared) {
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postText !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postText
  //           //                             .isNotEmpty) {
  //           //                       postText = _timelineProvider
  //           //                               .timelineData[timelineIndex]
  //           //                               .sharedBy
  //           //                               .postText ??
  //           //                           "";
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postYoutube !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postYoutube
  //           //                             .isNotEmpty) {
  //           //                       iframe = _timelineProvider
  //           //                           .timelineData[timelineIndex]
  //           //                           .sharedBy
  //           //                           .postYoutube;
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .album !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .album
  //           //                                 .length >
  //           //                             0) {
  //           //                       album = _timelineProvider
  //           //                           .timelineData[timelineIndex]
  //           //                           .sharedBy
  //           //                           .album;
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postFile !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postFile
  //           //                             .isNotEmpty) {
  //           //                       if (_timelineProvider
  //           //                           .timelineData[timelineIndex]
  //           //                           .sharedBy
  //           //                           .postFile
  //           //                           .contains(".mp4")) {
  //           //                         videoURL = _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postFile;
  //           //                       } else {
  //           //                         imageURL = _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postFile;
  //           //                       }
  //           //                     } else if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postLink !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postLink
  //           //                             .isNotEmpty) {
  //           //                       {
  //           //                         if (_timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postLink
  //           //                             .contains(".mp4")) {
  //           //                           videoURL = _timelineProvider
  //           //                               .timelineData[timelineIndex]
  //           //                               .sharedBy
  //           //                               .postLink;
  //           //                         } else if (_timelineProvider
  //           //                                     .timelineData[timelineIndex]
  //           //                                     .sharedBy
  //           //                                     .postLinkImage !=
  //           //                                 null &&
  //           //                             _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postLinkImage
  //           //                                 .isNotEmpty) {
  //           //                           imageURL = _timelineProvider
  //           //                               .timelineData[timelineIndex]
  //           //                               .sharedBy
  //           //                               .postLinkImage;
  //           //                         } else {
  //           //                           imageURL = _timelineProvider
  //           //                               .timelineData[timelineIndex]
  //           //                               .sharedBy
  //           //                               .postLink;
  //           //                         }
  //           //                       }
  //           //                     } else if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .sharedBy
  //           //                                 .postYoutube !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .sharedBy
  //           //                             .postYoutube
  //           //                             .isNotEmpty) {
  //           //                       iframe = _timelineProvider
  //           //                           .timelineData[timelineIndex]
  //           //                           .sharedBy
  //           //                           .postYoutube;
  //           //                     }
  //           //                   } else {
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .postYoutube !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postYoutube
  //           //                             .isNotEmpty) {
  //           //                       iframe = _timelineProvider
  //           //                           .timelineData[timelineIndex].postYoutube;
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .album !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .album
  //           //                                 .length >
  //           //                             0) {
  //           //                       album = _timelineProvider
  //           //                           .timelineData[timelineIndex].album;
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .postFile !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postFile
  //           //                             .isNotEmpty) {
  //           //                       if (_timelineProvider
  //           //                           .timelineData[timelineIndex].postFile
  //           //                           .contains("mp4")) {
  //           //                         videoURL = _timelineProvider
  //           //                             .timelineData[timelineIndex].postFile;
  //           //                       } else {
  //           //                         imageURL = _timelineProvider
  //           //                             .timelineData[timelineIndex].postFile;
  //           //                       }
  //           //                     } else if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .postLink !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postLink
  //           //                             .isNotEmpty) {
  //           //                       if (_timelineProvider
  //           //                           .timelineData[timelineIndex].postLink
  //           //                           .contains("mp4")) {
  //           //                         videoURL = _timelineProvider
  //           //                             .timelineData[timelineIndex].postLink;
  //           //                       } else if (_timelineProvider
  //           //                                   .timelineData[timelineIndex]
  //           //                                   .postLinkImage !=
  //           //                               null &&
  //           //                           _timelineProvider
  //           //                               .timelineData[timelineIndex]
  //           //                               .postLinkImage
  //           //                               .isNotEmpty) {
  //           //                         imageURL = _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postLinkImage;
  //           //                       } else {
  //           //                         imageURL = _timelineProvider
  //           //                             .timelineData[timelineIndex].postLink;
  //           //                       }
  //           //                     } else if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .postYoutube !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postYoutube
  //           //                             .isNotEmpty) {
  //           //                       iframe = _timelineProvider
  //           //                           .timelineData[timelineIndex].postYoutube;
  //           //                     }
  //           //                     if (_timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .postText !=
  //           //                             null &&
  //           //                         _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .postText
  //           //                             .isNotEmpty) {
  //           //                       postText = _timelineProvider
  //           //                           .timelineData[timelineIndex].postText;
  //           //                     }
  //           //                   }

  //           //                   List<Reactions> reactions = [];

  //           //                   if (_timelineProvider.timelineData[timelineIndex]
  //           //                               .reactions !=
  //           //                           null &&
  //           //                       _timelineProvider.timelineData[timelineIndex]
  //           //                               .reactions.length >
  //           //                           0) {
  //           //                     reactions = _timelineProvider
  //           //                         .timelineData[timelineIndex].reactions;
  //           //                     likeReaction =
  //           //                         reactions[reactionIndex ?? 0].reaction;
  //           //                   } else {
  //           //                     reactions = [];
  //           //                   }

  //           //                   return HomePostWidget(
  //           //                     page: _timelineProvider
  //           //                         .timelineData[timelineIndex].page,
  //           //                     user: _timelineProvider
  //           //                         .timelineData[timelineIndex].user,
  //           //                     group: _timelineProvider
  //           //                         .timelineData[timelineIndex].group,
  //           //                     isPostShared: shared,
  //           //                     time: _timelineProvider
  //           //                         .timelineData[timelineIndex].time,
  //           //                     postColor: _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .colored !=
  //           //                             null
  //           //                         ? _timelineProvider
  //           //                             .timelineData[timelineIndex].colored
  //           //                         : null,
  //           //                     likedButtonOnPressed: () {
  //           //                       SizeConfig().init(context);

  //           //                       showDialog(
  //           //                         context: context,
  //           //                         useSafeArea: false,
  //           //                         builder: (context) {
  //           //                           return AlertDialog(
  //           //                             contentPadding: EdgeInsets.all(0),
  //           //                             actionsPadding: EdgeInsets.all(0),
  //           //                             buttonPadding: EdgeInsets.all(0),
  //           //                             insetPadding: EdgeInsets.all(0),
  //           //                             shape: RoundedRectangleBorder(
  //           //                               borderRadius: BorderRadius.circular(
  //           //                                 SizeConfig.kDefaultSize * 18,
  //           //                               ),
  //           //                             ),
  //           //                             clipBehavior:
  //           //                                 Clip.antiAliasWithSaveLayer,
  //           //                             titlePadding: EdgeInsets.all(0),
  //           //                             content: Container(
  //           //                               height: SizeConfig.kDefaultSize * 20,
  //           //                               width: MediaQuery.of(context)
  //           //                                       .size
  //           //                                       .width -
  //           //                                   20,
  //           //                               decoration: BoxDecoration(
  //           //                                 color: Colors.white,
  //           //                               ),
  //           //                               clipBehavior:
  //           //                                   Clip.antiAliasWithSaveLayer,
  //           //                               child: Row(
  //           //                                 mainAxisAlignment:
  //           //                                     MainAxisAlignment.spaceEvenly,
  //           //                                 children: List.generate(
  //           //                                   emojis.length,
  //           //                                   (emojiIndex) {
  //           //                                     return GestureDetector(
  //           //                                       onTap: () async {
  //           //                                         if (reactions == null) {
  //           //                                           reactions = [];
  //           //                                         } else if (reactions
  //           //                                                 .length >
  //           //                                             0) {
  //           //                                           reactions
  //           //                                               .forEach((element) {
  //           //                                             if (element.postId ==
  //           //                                                     _timelineProvider
  //           //                                                         .timelineData[
  //           //                                                             timelineIndex]
  //           //                                                         .id &&
  //           //                                                 element.user
  //           //                                                         .userId ==
  //           //                                                     _userProvider
  //           //                                                         .user
  //           //                                                         .userId) {
  //           //                                               setState(() {
  //           //                                                 reactionIndex =
  //           //                                                     reactions
  //           //                                                         .indexOf(
  //           //                                                             element);
  //           //                                               });
  //           //                                             }
  //           //                                           });
  //           //                                         }
  //           //                                         Reactions reaction =
  //           //                                             Reactions();
  //           //                                         User user = User();
  //           //                                         reaction.postId =
  //           //                                             _timelineProvider
  //           //                                                 .timelineData[
  //           //                                                     timelineIndex]
  //           //                                                 .id;
  //           //                                         user.userId = _userProvider
  //           //                                             .user.userId;
  //           //                                         user.email = _userProvider
  //           //                                             .user.email;

  //           //                                         user.avatar = _userProvider
  //           //                                             .user.avatar;
  //           //                                         user.username =
  //           //                                             _userProvider
  //           //                                                 .user.username;
  //           //                                         if (_userProvider.user
  //           //                                                     .firstName !=
  //           //                                                 null &&
  //           //                                             _userProvider.user
  //           //                                                     .lastName !=
  //           //                                                 null) {
  //           //                                           user.firstName =
  //           //                                               _userProvider
  //           //                                                   .user.firstName;
  //           //                                           user.lastName =
  //           //                                               _userProvider
  //           //                                                   .user.lastName;
  //           //                                         }

  //           //                                         reaction.user = user;
  //           //                                         reaction.reaction = emojis[
  //           //                                                 emojiIndex]
  //           //                                             .replaceAll(
  //           //                                                 "assets/images/",
  //           //                                                 "")
  //           //                                             .replaceAll(".gif", "");

  //           //                                         if (reactionIndex != null) {
  //           //                                           if (reactions.length >
  //           //                                               0) {
  //           //                                             setState(() {
  //           //                                               reactions.removeAt(
  //           //                                                   reactionIndex);
  //           //                                               reactions.insert(
  //           //                                                   reactionIndex,
  //           //                                                   reaction);
  //           //                                               _timelineProvider
  //           //                                                       .timelineData[
  //           //                                                           timelineIndex]
  //           //                                                       .reactions =
  //           //                                                   reactions;
  //           //                                             });
  //           //                                           } else {
  //           //                                             setState(() {
  //           //                                               reactions
  //           //                                                   .add(reaction);
  //           //                                               _timelineProvider
  //           //                                                       .timelineData[
  //           //                                                           timelineIndex]
  //           //                                                       .reactions =
  //           //                                                   reactions;
  //           //                                             });
  //           //                                           }
  //           //                                         } else {
  //           //                                           setState(() {
  //           //                                             reactions.add(reaction);
  //           //                                             _timelineProvider
  //           //                                                     .timelineData[
  //           //                                                         timelineIndex]
  //           //                                                     .reactions =
  //           //                                                 reactions;
  //           //                                           });
  //           //                                         }
  //           //                                         Navigator.pop(context);
  //           //                                         _timelineProvider.likePost(
  //           //                                           context,
  //           //                                           postID: reaction.postId
  //           //                                               .toString(),
  //           //                                           reaction:
  //           //                                               reaction.reaction,
  //           //                                         );
  //           //                                       },
  //           //                                       child: SizedBox(
  //           //                                         width: SizeConfig
  //           //                                                 .kDefaultSize *
  //           //                                             10,
  //           //                                         height: SizeConfig
  //           //                                                 .kDefaultSize *
  //           //                                             10,
  //           //                                         child: Image.asset(
  //           //                                           emojis[emojiIndex],
  //           //                                         ),
  //           //                                       ),
  //           //                                     );
  //           //                                   },
  //           //                                 ),
  //           //                               ),
  //           //                             ),
  //           //                           );
  //           //                         },
  //           //                       );
  //           //                     },
  //           //                     comments: _timelineProvider
  //           //                         .timelineData[timelineIndex].comments,
  //           //                     comment: comments != null
  //           //                         ? comments.length > 0
  //           //                             ? comments[0]
  //           //                             : TimelinePostComments()
  //           //                         : TimelinePostComments(),
  //           //                     commentButtonCallback: () {
  //           //                       commentBottomSheet(
  //           //                         context,
  //           //                         comments: comments ?? [],
  //           //                         postID: _timelineProvider
  //           //                             .timelineData[timelineIndex].postId
  //           //                             .toString(),
  //           //                         timelineIndex: timelineIndex,
  //           //                         totalLikes: reactions.length,
  //           //                       );
  //           //                     },
  //           //                     feelings: _timelineProvider
  //           //                         .timelineData[timelineIndex].postFeeling,
  //           //                     timelineIndex: timelineIndex,
  //           //                     shareButtonCallback: () {
  //           //                       shareBottomSheet(
  //           //                         context,
  //           //                         postID: _timelineProvider
  //           //                             .timelineData[timelineIndex].postId
  //           //                             .toString(),
  //           //                       );
  //           //                     },
  //           //                     postSticker: _timelineProvider
  //           //                         .timelineData[timelineIndex].postSticker,
  //           //                     postID: _timelineProvider
  //           //                         .timelineData[timelineIndex].id
  //           //                         .toString(),
  //           //                     moreButtonCallback: () {
  //           //                       print(_timelineProvider
  //           //                           .timelineData[timelineIndex]);
  //           //                       showPostMenuBottomSheet(
  //           //                         context,
  //           //                         postID: _timelineProvider
  //           //                             .timelineData[timelineIndex].id
  //           //                             .toString(),
  //           //                         timelineData: _timelineProvider
  //           //                             .timelineData[timelineIndex],
  //           //                       );
  //           //                     },
  //           //                     reactionCount: reactions.length == 0
  //           //                         ? null
  //           //                         : reactions.length,
  //           //                     description: postText,
  //           //                     iframe: iframe,
  //           //                     album: album,
  //           //                     videoURL: videoURL,
  //           //                     imageURL: _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .album !=
  //           //                             null
  //           //                         ? imageURL
  //           //                         : null,
  //           //                     name: _timelineProvider
  //           //                                 .timelineData[timelineIndex].page !=
  //           //                             null
  //           //                         ? _timelineProvider
  //           //                             .timelineData[timelineIndex]
  //           //                             .page
  //           //                             .pageTitle
  //           //                         : _timelineProvider
  //           //                                     .timelineData[timelineIndex]
  //           //                                     .user !=
  //           //                                 null
  //           //                             ? _timelineProvider
  //           //                                             .timelineData[
  //           //                                                 timelineIndex]
  //           //                                             .user
  //           //                                             .firstName !=
  //           //                                         null &&
  //           //                                     _timelineProvider
  //           //                                             .timelineData[
  //           //                                                 timelineIndex]
  //           //                                             .user
  //           //                                             .lastName !=
  //           //                                         null
  //           //                                 ? _timelineProvider
  //           //                                         .timelineData[timelineIndex]
  //           //                                         .user
  //           //                                         .firstName +
  //           //                                     " " +
  //           //                                     _timelineProvider
  //           //                                         .timelineData[timelineIndex]
  //           //                                         .user
  //           //                                         .lastName
  //           //                                 : _timelineProvider
  //           //                                             .timelineData[
  //           //                                                 timelineIndex]
  //           //                                             .user
  //           //                                             .username !=
  //           //                                         null
  //           //                                     ? _timelineProvider
  //           //                                         .timelineData[timelineIndex]
  //           //                                         .user
  //           //                                         .username
  //           //                                     : " "
  //           //                             : " ",
  //           //                     profileAvatar: _timelineProvider
  //           //                                 .timelineData[timelineIndex].page !=
  //           //                             null
  //           //                         ? _timelineProvider
  //           //                             .timelineData[timelineIndex].page.avatar
  //           //                         : _timelineProvider
  //           //                                     .timelineData[timelineIndex]
  //           //                                     .user !=
  //           //                                 null
  //           //                             ? _timelineProvider
  //           //                                 .timelineData[timelineIndex]
  //           //                                 .user
  //           //                                 .avatar
  //           //                             : null,
  //           //                     reaction: likeReaction,
  //           //                     postType: _timelineProvider
  //           //                             .timelineData[timelineIndex].type ??
  //           //                         "",
  //           //                     option: _timelineProvider
  //           //                             .timelineData[timelineIndex].options ??
  //           //                         [],
  //           //                     showCommentBottomSheet: () {
  //           //                       commentBottomSheet(
  //           //                         context,
  //           //                         comments: comments ?? [],
  //           //                         postID: _timelineProvider
  //           //                             .timelineData[timelineIndex].postId
  //           //                             .toString(),
  //           //                         timelineIndex: timelineIndex,
  //           //                         totalLikes: reactions.length,
  //           //                       );
  //           //                     },
  //           //                   );
  //           //                 },
  //           //               ),
  //           //             ],
  //           //           ),
  //           //         ),
  //           //       ),
  //           //     ),
  //           //   )
  //         ],
  //       ),
      