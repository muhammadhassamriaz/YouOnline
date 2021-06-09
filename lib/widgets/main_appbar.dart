import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_list/flutter_story_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:story/story.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/create_post_screen.dart';
import 'package:youonline/route/create_user_story.dart';
import 'package:youonline/route/main_screen.dart';
import 'package:youonline/route/search_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/text_button.dart';

class MainAppBar extends StatefulWidget {
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  TextEditingController _postTextEditingController = TextEditingController();
  List videoFiles = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    var _timelineProvider = Provider.of<TimelineProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * .05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YouOnline',
                style: headingTextStyle.copyWith(
                  fontSize: width * .06,
                  color: primaryColor,
                ),
                textScaleFactor: 1,
              ),
              Spacer(),
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * .14,
                height: width * .14,
                child: _userProvider.user?.avatar != null
                    ? Container(
                        width: width * .14,
                        height: width * .14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: FadeInImage.memoryNetwork(
                            image: _userProvider.user.avatar,
                            placeholder: kTransparentImage,
                            imageScale: 0.5,
                          ),
                        ),
                      )
                    : Image.asset(
                        Assets.PROFILE_AVATAR,
                      ),
              ),
              SizedBox(
                width: width * .02,
              ),
              Flexible(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1,
                  ),
                  child: TextField(
                    onTap: () {
                      Provider.of<PostProvider>(context, listen: false)
                          .changeFeelings(null);
                      Provider.of<PostProvider>(context, listen: false)
                          .changeGIFurl(null);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreatePostScreen(),
                        ),
                      );
                    },
                    autofocus: false,
                    readOnly: true,
                    controller: _postTextEditingController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle.copyWith(
                        fontSize: width * .04,
                      ),
                      hintText: 'What\'s going on?',
                      border: InputBorder.none,
                    ),
                    style: labelTextStyle.copyWith(
                      fontSize: width * .04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Divider(
          color: Colors.grey[300],
          height: height * .003,
        ),
        Row(
          children: [
            Expanded(
              child: YouOnlineTextButton(
                assetImage: Assets.UPLOAD_IMAGE_ICON,
                title: 'Photo',
                color: searchContainerColor,
                callback: () async {
                  FilePickerResult result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.image,
                  );

                  if (result != null) {
                    List<File> files =
                        result.paths.map((path) => File(path)).toList();

                    uploadMultipleImage(
                      files: files,
                      authenticationToken:
                          _userProvider.userAuthenticationToken,
                      context: context,
                    );
                  }
                },
              ),
            ),
            Container(
              height: height * .03,
              width: width * .002,
              color: Colors.grey[300],
            ),
            Expanded(
              child: YouOnlineTextButton(
                assetImage: Assets.UPLOAD_VIDEO_ICON,
                title: 'Video',
                color: searchContainerColor,
                callback: () async {
                  double sizeInMB;
                  FilePickerResult selectedFile;
                  await FilePicker.platform
                      .pickFiles(
                    allowCompression: true,
                    allowMultiple: false,
                    type: FileType.video,
                  )
                      .then((value) {
                    if (value != null) {
                      double sizeInKB = value.files.first.size / 1024;

                      setState(() {
                        sizeInMB = sizeInKB / 1024;
                      });
                      if (sizeInMB.toInt() < 21) {
                        setState(() {
                          videoFiles =
                              value.paths.map((path) => File(path)).toList();
                        });
                      } else {
                        BotToast.showText(
                          text:
                              "The size of the video must be less than 20 Mbs.",
                          textStyle: labelTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          contentColor: Colors.white,
                        );
                      }
                    }
                  });
                  if (videoFiles != null && videoFiles.length > 0) {
                    if (sizeInMB.toInt() < 21) {
                      BotToast.showLoading();
                      await videoUploader(
                        files: videoFiles,
                        authenticationToken:
                            _userProvider.userAuthenticationToken,
                        context: context,
                      );
                    } else {
                      BotToast.showText(
                        text: "The size of the video must be less than 20 Mbs.",
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        contentColor: Colors.white,
                      );
                    }
                  }
                },
              ),
            ),
            Container(
              height: height * .03,
              width: width * .002,
              color: Colors.grey[300],
            ),
            Expanded(
              child: YouOnlineTextButton(
                title: 'Activity',
                assetImage: Assets.FEELINGS_ICON,
                color: yellowColor,
                callback: () {
                  Provider.of<PostProvider>(context, listen: false)
                      .changeFeelings(null);
                  Provider.of<PostProvider>(context, listen: false)
                      .changeGIFurl(null);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreatePostScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: height * .01,
        // ),
        // ProfilePictures(),
        SizedBox(
          height: height * .005,
        ),
        StoryList(
          iconBackgroundColor: primaryColor,
          addItemBackgroundColor: Colors.white,
          borderColor: Colors.white,
          backgroundColor: Colors.white,
          addItemWidth: width * .25,
          height: width * .45,
          onPressedIcon: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateUserStories(),
              ),
            );
          },
          image: FadeInImage.memoryNetwork(
            image: _userProvider.user?.cover,
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            imageScale: 0.5,
          ),
          text: Text(
            "",
            maxLines: 1,
            style: labelTextStyle.copyWith(
              fontSize: width * .032,
              color: primaryColor,
            ),
          ),
          itemCount: _userProvider.storyModel.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return Scaffold(
                        body: SafeArea(
                          child: StoryPageView(
                            initialPage: selectedIndex,
                            itemBuilder: (
                              context,
                              pageIndex,
                              storyIndex,
                            ) {
                              final user =
                                  _userProvider.storyModel.data[pageIndex];
                              final story = _userProvider.storyModel
                                  .data[pageIndex].stories[storyIndex];
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(color: Colors.black),
                                  ),
                                  Positioned.fill(
                                    child: Image.network(
                                      story.storyMediaImage.filename,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 44, left: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: width * .15,
                                          width: width * .15,
                                          decoration: BoxDecoration(
                                            // image:
                                            //     DecorationImage(
                                            //   image: CachedNetworkImageProvider(
                                            //     user.avatar,
                                            //   ),
                                            //   fit: BoxFit.cover,
                                            // ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: FadeInImage.memoryNetwork(
                                              placeholder: kTransparentImage,
                                              image: user?.avatar,
                                              imageScale: 0.5,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          user.firstName + " " + user.lastName,
                                          style: TextStyle(
                                            fontSize: width * .032,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            gestureItemBuilder:
                                (context, pageIndex, storyIndex) {
                              return Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 32),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            },
                            pageLength: _userProvider.storyModel.data.length,
                            storyLength: (int pageIndex) {
                              return _userProvider
                                  .storyModel.data[pageIndex].stories.length;
                            },
                            onPageLimitReached: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: width * .25,
                height: height * .2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      _userProvider.storyModel.data[index].stories.first
                          .storyMediaImage.filename,
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: searchContainerColor,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            );
          },
        ),
      ],
    );
  }
}

Future<void> uploadMultipleImage({
  @required List<File> files,
  @required String authenticationToken,
  @required BuildContext context,
}) async {
  var uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().createPost);

  var request = new http.MultipartRequest("POST", uri);
  var _timelineProvider = Provider.of<TimelineProvider>(context, listen: false);

  for (var file in files) {
    String fileName = file.path.split("/").last;
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print("File lenght - $length");
    print("fileName - $fileName");
    var multipartFileSign;
    multipartFileSign = new http.MultipartFile('postPhotos[]', stream, length,
        filename: fileName);

    print(multipartFileSign);

    request.files.add(multipartFileSign);
  }

  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer $authenticationToken"
  };
  request.headers.addAll(headers);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => MainScreen(
          isMainScreen: false,
        ),
      ),
      (route) => false);

  var response = await request.send();

  var res = await http.Response.fromStream(response);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseDecode = json.decode(res.body);

    BotToast.showText(
      text: "Image Uploaded",
      textStyle: labelTextStyle.copyWith(
        fontSize: 12,
        color: Colors.black,
      ),
      contentColor: Colors.white,
    );

    if (responseDecode['success'] != null && responseDecode['success']) {
      TimelineData post = TimelineData.fromJson(responseDecode['post']);
      _timelineProvider.timelineData.insert(0, post);
      _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

      BotToast.showText(
        text: "Post successfully created.",
        contentColor: Colors.white,
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.black,
        ),
      );
    }
    return res.body;
  }
}

Future<void> videoUploader({
  @required List files,
  @required String authenticationToken,
  @required BuildContext context,
  @required String text,
  String feelings,
}) async {
  var uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().createPost);
  var _timelineProvider = Provider.of<TimelineProvider>(context, listen: false);
  var request = new http.MultipartRequest("POST", uri);

  for (var file in files) {
    String fileName = file.path.split("/").last;
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print("File lenght - $length");
    print("fileName - $fileName");
    var multipartFileSign;
    multipartFileSign =
        new http.MultipartFile('postVideo', stream, length, filename: fileName);

    print(multipartFileSign);

    request.files.add(multipartFileSign);
  }
  if (text != null && text.isNotEmpty) {
    request.fields['postText'] = text;
  }
  if (feelings != null && feelings.isNotEmpty) {
    request.fields["feeling_type"] = "feelings";
    request.fields["feeling"] = feelings;
  }
  print(request.fields);

  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer $authenticationToken"
  };
  request.headers.addAll(headers);
  var response = await request.send();

  var res = await http.Response.fromStream(response);
  BotToast.closeAllLoading();

  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseDecode = json.decode(res.body);

    BotToast.showText(
      text: "Video will be uploaded shortly",
      textStyle: labelTextStyle.copyWith(
        fontSize: 12,
        color: Colors.black,
      ),
      contentColor: Colors.white,
    );

    if (responseDecode['success'] != null && responseDecode['success']) {
      TimelineData post = TimelineData.fromJson(responseDecode['post']);
      _timelineProvider.timelineData.insert(0, post);
      _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

      BotToast.showText(
        text: "Video is uploaded.",
        contentColor: Colors.white,
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.black,
        ),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
    }
    return res.body;
  } else if (response.statusCode == 400 || response.statusCode == 500) {
    if (response.statusCode == 400) {
      BotToast.showText(
        text: "Bad Request",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        contentColor: Colors.red,
      );
    } else {
      BotToast.showText(
        text: "Internal Server Error",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        contentColor: Colors.red,
      );
    }
  }
}
