import 'package:youonline/utils/assets.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  Widget icon;
  changeIcon(Widget _icon) {
    icon = _icon;
    notifyListeners();
  }

  int genderIndex = 10;
  changeGenderIndex(int index) {
    genderIndex = index;
    notifyListeners();
  }

  int pageNo = 0;
  changePageNo(int _index) {
    pageNo = _index;
    notifyListeners();
  }

  int reactionIndex;
  changeReactionIndex(int _index) {
    reactionIndex = _index;
    notifyListeners();
  }

  bool twoFactorAuthenticationValue = false;
  changeTwoFactorAuthenticationValue(bool value) {
    twoFactorAuthenticationValue = value;
    notifyListeners();
  }

  int selectedDate = 0;
  changeSelectedDate(int date) {
    selectedDate = date;
    notifyListeners();
  }

  int postPrivacyIndex = 0;
  changePostPrivacyPolicyIndex(int _index) {
    postPrivacyIndex = _index;
    notifyListeners();
  }

  List<String> dates = [
    'All',
    'Today',
    'Tomorrow',
    'This Week',
    'This Month',
    'This Year',
  ];

  List<String> relations = [
    "None",
    "Single",
    "Married",
    "Separated",
    "Divorced"
  ];

  List<String> collection = [
    "Photos of you",
    "Uploads",
    "Albums",
  ];

  int collectionIndex = 0;
  changeCollectionIndex(int index) {
    collectionIndex = index;
    notifyListeners();
  }

  int profileSectionIndex = 0;
  changeProfileSelectedIndex(int index) {
    profileSectionIndex = index;
    notifyListeners();
  }

  List<String> profileSections = [
    "About",
    "Posts",
    "Photos",
    "Videos",
  ];

  String relation = "None";
  changeRelation(String relate) {
    relation = relate;
    notifyListeners();
  }

  int groupTypeIndex = 1;
  changeGroupTypeIndex(int index) {
    groupTypeIndex = index;
    notifyListeners();
  }

  int selectedColorIndex = 5;
  changeSelectedColorIndex(int index) {
    selectedColorIndex = index;
    notifyListeners();
  }

  String reaction = likeGIF;
  changeReaction(String _reaction) {
    reaction = _reaction;
    notifyListeners();
  }

  WidgetProvider() {
    icon = Icon(
      Icons.visibility_off_outlined,
    );
  }
}
