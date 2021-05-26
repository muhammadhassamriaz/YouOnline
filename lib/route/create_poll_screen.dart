import 'dart:io';

import 'package:youonline/component/post_header.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/poll_duration.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

import 'main_screen.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  _CreatePollScreenState createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  TextEditingController _postTextEditingController = TextEditingController(),
      _addPollOptionTextEditingController = TextEditingController();

  List<String> polls = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 1,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Create Poll',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  Container(
                    width: width / 4,
                    height: height * .06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        width * .07,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: YouOnlineButton(
                      callback: () async {
                        var _timelineProvider = Provider.of<TimelineProvider>(
                            context,
                            listen: false);

                        if (polls.length >= 3 &&
                            _postTextEditingController.text.isNotEmpty) {
                          BotToast.showLoading();

                          await _postProvider.createPoll(
                            context: context,
                            pollQuestion: _postTextEditingController.text,
                            answers: polls,
                            feeling:
                                Provider.of<PostProvider>(context).feelings,
                          );
                          _timelineProvider.changeTimelineData([]);
                          await _timelineProvider.getTimeLinePosts(
                            context: context,
                            pageNo: 1,
                          );
                          BotToast.closeAllLoading();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainScreen(),
                              ),
                              (route) => false);
                        } else {
                          BotToast.showText(
                            text: "Please enter 3 polls",
                            textStyle: labelTextStyle.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            contentColor: Colors.white,
                          );
                        }
                      },
                      title: "Done",
                      textSize: width * .04,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: AutoSizeTextField(
                              controller: _postTextEditingController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                  SizeConfig.kDefaultSize * 03,
                                ),
                                hintText: 'Enter your question here',
                                hintStyle: hintTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 4,
                                ),
                              ),
                              autocorrect: false,
                              style: labelTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Text(
                        'Poll options',
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      if (polls.length > 0)
                        Wrap(
                          runSpacing: width * .03,
                          children: List.generate(
                            polls.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width * .04,
                                      child: Text(
                                        '${index + 1}.',
                                        style: hintTextStyle.copyWith(
                                            fontSize: width * .04,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .03,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${polls[index]}',
                                        style: hintTextStyle.copyWith(
                                            fontSize: width * .04,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.kDefaultSize * 2,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          polls.remove(polls[index]);
                                        });
                                      },
                                      child: Container(
                                        width: SizeConfig.kDefaultSize * 7,
                                        height: SizeConfig.kDefaultSize * 7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.kDefaultSize * 1,
                                          ),
                                          color: Colors.red,
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: SizeConfig.kDefaultSize * 5,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: SizeConfig.kDefaultSize * 12,
                              width: SizeConfig.kDefaultSize * 60,
                              decoration: BoxDecoration(
                                color: searchContainerColor,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.kDefaultSize * 3,
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
                                  child: Center(
                                    child: TextField(
                                      controller:
                                          _addPollOptionTextEditingController,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(
                                          SizeConfig.kDefaultSize * 02.6,
                                        ),
                                        hintText: 'Enter your answer here',
                                        hintStyle: hintTextStyle.copyWith(
                                          fontSize:
                                              SizeConfig.kDefaultSize * 3.5,
                                        ),
                                      ),
                                      autocorrect: false,
                                      style: labelTextStyle.copyWith(
                                        fontSize: SizeConfig.kDefaultSize * 3.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.kDefaultSize * 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_addPollOptionTextEditingController
                                  .text.isNotEmpty) {
                                setState(() {
                                  polls.add(
                                      _addPollOptionTextEditingController.text);
                                  _addPollOptionTextEditingController.text = "";
                                });
                              }
                            },
                            child: Container(
                              width: SizeConfig.kDefaultSize * 7,
                              height: SizeConfig.kDefaultSize * 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.kDefaultSize * 1,
                                ),
                                color: primaryColor,
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: SizeConfig.kDefaultSize * 5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        children: [
                          Text(
                            'Poll Duration',
                            style: subheadingTextStyle.copyWith(
                              fontSize: width * .045,
                            ),
                            textScaleFactor: 1,
                          ),
                          Spacer(),
                          PollDuration(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
