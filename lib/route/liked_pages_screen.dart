import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/like_pages_tile.dart';
import 'package:flutter/material.dart';

class LikedPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Liked Pages',
          style: subheadingTextStyle.copyWith(
            fontSize: width * .06,
          ),
          textScaleFactor: 1,
        ),
        leadingWidth: width * .08,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .05,
              ),
              child: Text(
                'Changes to Pages',
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
                horizontal: width * .05,
              ),
              child: Text(
                'These Pages have changed their name since you liked them. When a Page makes these changes, that could mean that it changes what it posts about. You can decide if you want to saty connected to these Pages.',
                style: labelTextStyle.copyWith(
                  fontSize: width * .038,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Center(
              child: Wrap(
                runSpacing: height * .02,
                children: List.generate(
                  6,
                  (index) {
                    return LikedPageTile();
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
