import 'dart:io';

import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/review_post_widget.dart';
import 'package:flutter/material.dart';

class ReviewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    'Review Posts',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 5,
                  ),
                  child: Text(
                    'Review posts you’re tagged in',
                    maxLines: 1,
                    style: subheadingTextStyle.copyWith(
                      fontSize: width * .04,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                ReviewPostWidget(
                  description: "",
                  imageURL: "",
                  profileAvatar: "",
                  name: "Muhammd Hassam",
                  iframe: "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
