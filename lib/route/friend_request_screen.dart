import 'dart:io';

import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/friend_req.dart';
import 'package:flutter/material.dart';

import 'friend_widget.dart';

class FriendRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Platform.isIOS ? 
              Icons.arrow_back_ios :
              Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    "Friend Requests",
                    style: headingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  Text(
                    "4",
                    style: headingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                      color: primaryColor,
                    ),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 1.5,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: SizeConfig.kDefaultSize * 8,
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                ],
              ),
              TabBar(
                indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 0.1,
                indicatorColor: Colors.transparent,
                labelStyle: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  color: Colors.black,
                  height: SizeConfig.kDefaultSize * 0.7,
                  fontWeight: FontWeight.bold,
                ),
                physics: BouncingScrollPhysics(),
                unselectedLabelStyle: labelTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.normal,
                  height: SizeConfig.kDefaultSize * 0.7,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Suggestions',
                  ),
                  Tab(
                    text: 'Friends',
                  ),
                ],
              ),
              Divider(
                thickness: SizeConfig.kDefaultSize * 0.3,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.kDefaultSize * 5,
                          ),
                          Wrap(
                            runSpacing: SizeConfig.kDefaultSize * 6,
                            children: List.generate(
                              5,
                              (index) {
                                return FriendRequestTile();
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.kDefaultSize * 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.kDefaultSize * 10,
                              vertical: SizeConfig.kDefaultSize * 2,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: SizeConfig.kDefaultSize * 12,
                              child: TextButton(
                                child: Text(
                                  "See All",
                                  style: labelTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: SizeConfig.kDefaultSize * 4,
                                  ),
                                  textScaleFactor: 1,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.resolveWith(
                                    (states) {
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          SizeConfig.kDefaultSize * 3,
                                        ),
                                      );
                                    },
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => searchContainerColor,
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Color(0xffADF0BE),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 5,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 5,
                            ),
                            Wrap(
                              runSpacing: SizeConfig.kDefaultSize * 6,
                              children: List.generate(
                                6,
                                (index) {
                                  return FriendWidget(
                                    isBlocked: false,
                                    callback: () {},
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
