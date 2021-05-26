import 'dart:io';

import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/activity_log_history_tile.dart';
import 'package:flutter/material.dart';

class ActivityLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
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
                      'Activity Log',
                      style: subheadingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 5,
                        ),
                        child: Text(
                          'Welcome to Activity Log',
                          style: subheadingTextStyle.copyWith(
                            fontSize: width * .045,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 5,
                        ),
                        child: Text(
                          'The activity log shows your YouOnline activity, such as posts you’ve created and things you’ve liked. You can select “Manage activity” to manage posts you’ve created including saving posts you no longer want to appear on your profile in your archive, or moving posts to the Recycle bin where they will be deleted after 30 days.',
                          style: labelTextStyle.copyWith(
                            fontSize: width * .038,
                            color: hintTextColor,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Wrap(
                        runSpacing: height * .03,
                        children: List.generate(
                          2,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.kDefaultSize * 5,
                              ),
                              child: ActivityHistoryTile(),
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
      ),
    );
  }
}
