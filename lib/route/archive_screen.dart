import 'dart:io';

import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  TextEditingController _commentTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
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
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Archive',
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
                physics: BouncingScrollPhysics(),
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
                        'Welcome to Archive',
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
                        'Moving posts, photos or other items to achive is a way for  your to save things you no longer watnt to show on your profile. Items in your archive can only be seen by you. You can restore items to your profile at any time, or you can move them to recyle bin, where they will be stored for 30 days before being deleted.',
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
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: Text(
                        'Posts',
                        style: subheadingTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 6,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    HomePostWidget(
                      description: "",
                      imageURL: "",
                      profileAvatar: "",
                      name: "Muhammad Hassam",
                      iframe: "",
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
