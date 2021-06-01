import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
import 'package:youonline/component/post_header.dart';
import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/model/uploader.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/create_poll_screen.dart';
import 'package:youonline/route/feeling_activity.dart';
import 'package:youonline/route/gif_screen.dart';
import 'package:youonline/route/location_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/app_header.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import 'main_screen.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _postTextEditingController = TextEditingController();
  FlutterUploader uploader = FlutterUploader();
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  Map<String, UploadItem> _tasks = {};
  int selectedIndex = 5;

  List<FileItem> imageFiles = [];
  FileItem videoFile;

  List<String> bottomSheetItems = [
    Assets.UPLOAD_IMAGE_ICON,
    Assets.CREATE_POLL_ICON,
    Assets.UPLOAD_VIDEO_ICON,
    Assets.GIF_ICON,
    // Assets.RECORD_VOICE_ICON,
    Assets.FEELINGS_ICON,
    // Assets.UPLOAD_FILES_ICON,
    // Assets.COLOR_ICON,
    // Assets.LOCATION_ICON,
  ];

  List<String> bottomSheetItemTitle = [
    'Upload Images',
    'Create Poll',
    'Upload Video',
    'GIF',
    // 'Record Voice',
    'Feelings',
    // 'Upload Files',
    // 'Color',
    // 'Location',
  ];
  int selectedColorId;

  @override
  void initState() {
    super.initState();
    _progressSubscription = uploader.progress.listen((progress) {
      final task = _tasks[progress.tag];
      print("progress: ${progress.progress} , tag: ${progress.tag}");

      if (task == null) return;
      if (task.isCompleted()) {
        return;
      }
      setState(() {
        _tasks[progress.tag] =
            task.copyWith(progress: progress.progress, status: progress.status);
      });
    });
    _resultSubscription = uploader.result.listen((result) {
      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");

      final task = _tasks[result.tag];
      Provider.of<TimelineProvider>(context, listen: false)
          .changeTimelineData([]);
      // BotToast.closeAllLoading();
      BotToast.showText(
        text: "Post created",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.black,
        ),
        contentColor: Colors.white,
      );
      if (task == null) return;

      setState(() {
        _tasks[result.tag] = task.copyWith(status: result.status);
      });
    }, onError: (ex, stacktrace) {
      final exp = ex as UploadException;
      final task = _tasks[exp.tag];
      BotToast.closeAllLoading();

      if (task == null) return;

      setState(() {
        _tasks[exp.tag] = task.copyWith(status: exp.status);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _progressSubscription?.cancel();
    _resultSubscription?.cancel();
  }

  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _postProvider = Provider.of<PostProvider>(context);
    List<Color> colors1 = [];
    List<Color> colors2 = [];
    _postProvider.postColors.colorPostTypes.forEach((element) {
      colors1.add(Color(int.tryParse(element.color1.replaceAll("#", "0xff"))));
      colors2.add(Color(int.tryParse(element.color2.replaceAll("#", "0xff"))));
    });
    var _dataProvider = Provider.of<DataProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 03,
                ),
                ScreenHeader(
                  title: 'Create Post',
                  callback: () async {
                    var _timelineProvider =
                        Provider.of<TimelineProvider>(context, listen: false);
                    if (files != null && files.length > 0) {
                      await uploadMultipleImage(
                        files: files,
                        authenticationToken:
                            _userProvider.userAuthenticationToken,
                        context: context,
                        text: _postTextEditingController.text,
                        feelings: _postProvider.feelings,
                      );
                    } else if (_postTextEditingController.text.isNotEmpty &&
                        _postProvider.gifURL != null) {
                      if (_postProvider.feelings != null) {
                        await _postProvider.createGIFPostwithFeelings(
                          postText: _postTextEditingController.text ?? "",
                          gifURL: _postProvider.gifURL,
                          context: context,
                          feeling: _postProvider.feelings,
                        );
                      } else if (_postTextEditingController.text.isNotEmpty &&
                          _postProvider.feelings != null) {
                        await _postProvider.createFeelingsWithPosts(
                          postText: _postTextEditingController.text,
                          postColorID: selectedColorId.toString(),
                          context: context,
                          feelings: _postProvider.feelings,
                        );
                      } else {
                        await _postProvider.createGIFPost(
                          postText: _postTextEditingController.text,
                          gifURL: _postProvider.gifURL,
                          context: context,
                        );
                      }
                    } else if (_postTextEditingController.text.isNotEmpty) {
                      await _postProvider.createPost(
                        postText: _postTextEditingController.text,
                        postColorID: selectedColorId.toString(),
                        context: context,
                        feeling: _postProvider.feelings,
                      );
                    } else {
                      BotToast.showText(
                        text: 'Please write something.',
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  },
                  buttonTitle: 'Post',
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 04,
                  ),
                  child: Column(
                    children: [
                      PostHeader(),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 03,
                      ),
                      Container(
                        height: SizeConfig.kDefaultSize * 35,
                        decoration: BoxDecoration(
                          color: searchContainerColor,
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                          gradient: LinearGradient(
                            colors: _dataProvider.linearColor,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Padding(
                          padding: EdgeInsets.all(
                            SizeConfig.kDefaultSize * 03,
                          ),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              textScaleFactor: 1,
                            ),
                            child: TextField(
                              controller: _postTextEditingController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                  SizeConfig.kDefaultSize * 03,
                                ),
                                hintText: 'What\'s going on?',
                                hintStyle: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 4,
                                  color: _widgetProvider.selectedColorIndex == 5
                                      ? Colors.grey[500]
                                      : Colors.white60,
                                ),
                              ),
                              autocorrect: false,
                              cursorColor:
                                  _widgetProvider.selectedColorIndex == 5
                                      ? Colors.black
                                      : Colors.white,
                              style: labelTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 4,
                                color: _widgetProvider.selectedColorIndex == 5
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      if (_postProvider.gifURL == null)
                        Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 3,
                            ),
                            GestureDetector(
                                onTap: () {
                                  List<Color> temporaryColor = [
                                    searchContainerColor,
                                    searchContainerColor,
                                  ];
                                  _dataProvider.changeLinearGradientColor(
                                      temporaryColor);
                                  _dataProvider.changeTextColor(Colors.black);
                                  setState(() {
                                    selectedColorId = null;
                                  });
                                },
                                child: Container(
                                  width: SizeConfig.kDefaultSize * 8,
                                  height: SizeConfig.kDefaultSize * 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        Assets.CIRCLE_1,
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 1.5,
                            ),
                            Wrap(
                              runSpacing: SizeConfig.kDefaultSize * 1.5,
                              spacing: SizeConfig.kDefaultSize * 1.5,
                              children: List.generate(
                                _postProvider.postColors.colorPostTypes.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      List<Color> temporaryColor = [];
                                      temporaryColor.add(colors1[index]);
                                      temporaryColor.add(colors2[index]);
                                      _dataProvider.changeLinearGradientColor(
                                          temporaryColor);
                                      _dataProvider.changeTextColor(
                                        Color(
                                          int.tryParse(
                                            _postProvider.postColors
                                                .colorPostTypes[index].textColor
                                                .replaceAll("#", "0xff"),
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        selectedColorId = _postProvider
                                            .postColors
                                            .colorPostTypes[index]
                                            .id;
                                      });
                                    },
                                    child: Container(
                                      width: SizeConfig.kDefaultSize * 8,
                                      height: SizeConfig.kDefaultSize * 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            colors1[index],
                                            colors2[index],
                                          ],
                                        ),
                                      ),
                                      child: _widgetProvider
                                                  .selectedColorIndex ==
                                              index
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size:
                                                    SizeConfig.kDefaultSize * 4,
                                                color: Colors.white,
                                              ),
                                            )
                                          : SizedBox(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 3,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.kDefaultSize * 5,
                                  vertical: SizeConfig.kDefaultSize * 3,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("image")) {
                                      try {
                                        await FilePicker.platform
                                            .pickFiles(
                                          allowMultiple: true,
                                          type: FileType.image,
                                        )
                                            .then((value) async {
                                          if (value != null) {
                                            setState(() {
                                              files = value.paths
                                                  .map((path) => File(path))
                                                  .toList();
                                            });

                                            if (files != null &&
                                                files.length > 0) {
                                              files.length > 1
                                                  ? BotToast.showText(
                                                      text:
                                                          "${files.length} image is selected.",
                                                      textStyle: labelTextStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      contentColor:
                                                          Colors.white,
                                                    )
                                                  : BotToast.showText(
                                                      text:
                                                          "${files.length} images are selected.",
                                                      textStyle: labelTextStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      contentColor:
                                                          Colors.white,
                                                    );
                                            }
                                          }
                                        });
                                      } catch (ex) {
                                        print(ex);
                                      }
                                    } else if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("video")) {
                                      FilePickerResult result =
                                          await FilePicker.platform.pickFiles(
                                        allowCompression: true,
                                        allowMultiple: false,
                                        type: FileType.video,
                                      );
                                      if (result != null) {
                                        setState(() {
                                          videoFile = FileItem(
                                            filename: path
                                                .basename(result.files[0].path),
                                            savedDir: path
                                                .dirname(result.files[0].path),
                                            fieldname: "postVideo",
                                          );
                                        });

                                        // BotToast.showLoading();
                                        await uploader.enqueue(
                                          url: ApiNetwork.BASE_URL +
                                              ApiNetwork().createPost,
                                          files: [videoFile],
                                          method: UploadMethod.POST,
                                          headers: <String, String>{
                                            "Accept": "application/json",
                                            "Authorization":
                                                "Bearer ${_userProvider.userAuthenticationToken}",
                                          },
                                          data: {
                                            "postText":
                                                _postTextEditingController.text,
                                          },
                                          showNotification: true,
                                          tag: "Uploading Video",
                                        );
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => MainScreen(),
                                            ),
                                            (route) => false);
                                      }
                                    } else if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("gif")) {
                                      if (_postProvider.gifs != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SelectGIFScreen(),
                                          ),
                                        );
                                      } else {
                                        await _postProvider.getTrendingGIFs(
                                            context: context);
                                      }
                                    } else if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("feeling")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => FeelingScreen(),
                                        ),
                                      );
                                    } else if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("location")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LocationScreen(),
                                        ),
                                      );
                                    } else if (bottomSheetItemTitle[index]
                                        .toLowerCase()
                                        .contains("poll")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => CreatePollScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 5,
                                        height: SizeConfig.kDefaultSize * 5,
                                        child: Image.asset(
                                          bottomSheetItems[index],
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 4,
                                      ),
                                      Text(
                                        bottomSheetItemTitle[index],
                                        style: labelTextStyle.copyWith(
                                          fontSize: SizeConfig.kDefaultSize * 4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: bottomSheetItemTitle.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> uploadMultipleImage({
    @required List<File> files,
    @required String authenticationToken,
    @required BuildContext context,
    @required String text,
    @required String feelings,
  }) async {
    var uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().createPost);
    var _timelineProvider =
        Provider.of<TimelineProvider>(context, listen: false);
    var request = new http.MultipartRequest("POST", uri);

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
}
