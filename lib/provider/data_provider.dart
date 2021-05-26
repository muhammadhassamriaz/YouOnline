import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';

class DataProvider with ChangeNotifier {
  List<File> createPostImageFiles;
  List<File> createPostVideoFiles;
  init() {
    createPostImageFiles = [];
    createPostVideoFiles = [];
    notifyListeners();
  }

  List<String> notificationText = [
    "Someone liked my posts",
    "Someone commented on my posts",
    "Someone shared on my posts",
    "Someone followed me",
    "Someone liked my pages",
    "Someone visited my profile",
    "Someone mentioned me",
    "Someone joined my groups",
    "Someone accepted my friend/follow request",
    "Someone Posted on my timeline",
  ];

  List<String> selectedNotificationText = [];
  changeSelectedNotificationText(List<String> text) {
    selectedNotificationText = text;
    notifyListeners();
  }

  List<String> tagFriends = [
    "Zain Mehmood1",
    "Zain Mehmood2",
    "Zain Mehmood3",
    "Zain Mehmood4",
    "Zain Mehmood5",
    "Zain Mehmood6",
  ];

  List<String> taggedFriends = [];
  changeSelectedFriends(List<String> text) {
    taggedFriends = text;
    notifyListeners();
  }

  


  int selectedNotificationIndex = 200;
  changeSelectedNotificationIndex(int index) {
    selectedNotificationIndex = index;
    notifyListeners();
  }

  int selectTagIndex = 100;
  changeSelectedTaggedIndex(int index) {
    selectTagIndex = index;
    notifyListeners();
  }

  Future pickImagesFromGallery() async {
    init();
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result != null) {
      createPostImageFiles = result.paths.map((e) => File(e)).toList();
    } else {}
  }

  Future pickVideosFromGallery() async {
    init();
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.video,
    );
    if (result != null) {
      createPostVideoFiles = result.paths.map((e) => File(e)).toList();
    } else {}
  }

  List<Color> linearColor = [
    searchContainerColor,
    searchContainerColor,
  ];
  Color textColor = Colors.black;
  changeTextColor(Color _color) {
    textColor = _color;
    notifyListeners();
  }

  changeLinearGradientColor(List<Color> _linearColor) {
    linearColor = _linearColor;
    notifyListeners();
  }
}
