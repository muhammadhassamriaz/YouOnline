import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  List<String> shareWith = [
        "Everyone",
        "People I Follow",
        "People Follow Me",
        "Only Me",
      ],
      onlineStatus = ["Online", "Offline"],
      option = ["Yes", "No"];

  String followMe = "Everyone",
      messageMe = "Everyone",
      seeMyFriends = "Everyone",
      postOnMyTimeLine = "People I Follow",
      seeMyBirthday = "Everyone",
      request = "Yes",
      activity = "Yes",
      status = "Online",
      public = "Yes",
      searchEngine = "Yes";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            HeaderTitle(
              title: "Privacy Policy",
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Who can follow me ?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: shareWith.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: followMe,
                              onChanged: (valuee) {
                                setState(() {
                                  followMe = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Who can message me ?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: shareWith.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: messageMe,
                              onChanged: (valuee) {
                                setState(() {
                                  messageMe = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Who can see my friends?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: shareWith.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: seeMyFriends,
                              onChanged: (valuee) {
                                setState(() {
                                  seeMyFriends = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Who can post on my timeline ?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: shareWith.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: postOnMyTimeLine,
                              onChanged: (valuee) {
                                setState(() {
                                  postOnMyTimeLine = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Who can see my birthday?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: shareWith.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: seeMyBirthday,
                              onChanged: (valuee) {
                                setState(() {
                                  seeMyBirthday = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Confirm request when someone follows you ?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: option.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: request,
                              onChanged: (valuee) {
                                setState(() {
                                  request = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Show my activities ?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: option.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: activity,
                              onChanged: (valuee) {
                                setState(() {
                                  activity = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Status",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: onlineStatus.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: status,
                              onChanged: (valuee) {
                                setState(() {
                                  status = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Share my location with public?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: option.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: public,
                              onChanged: (valuee) {
                                setState(() {
                                  public = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text:
                            "Allow search engines to index my profile and posts?",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: option.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: searchContainerColor,
                              value: searchEngine,
                              onChanged: (valuee) {
                                setState(() {
                                  searchEngine = valuee;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: "Save",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
