import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class ActivityHistoryTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1 April 2021',
          style: subheadingTextStyle.copyWith(
            fontSize: width * .05,
          ),
          textScaleFactor: 1,
        ),
        SizedBox(
          height: height * .02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * .2,
              height: width * .2,
              child: Stack(
                children: [
                  SizedBox(
                    width: width * .18,
                    height: width * .18,
                    child: Image.asset(
                      Assets.PROFILE_AVATAR,
                    ),
                  ),
                  Positioned(
                    right: width * .005,
                    bottom: width * .005,
                    child: Container(
                      width: width * .08,
                      height: width * .08,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            appLogo,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width * .01,
            ),
            Expanded(
              child: Column(
                children: [
                  RichText(
                    textScaleFactor: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sara Tailor reacted to John Smith’s ',
                          style: labelTextStyle.copyWith(
                            fontSize: width * .038,
                          ),
                        ),
                        TextSpan(
                          text: 'Photo.',
                          style: labelTextStyle.copyWith(
                            fontSize: width * .038,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .003,
                  ),
                  Text(
                    'The activity log shows your YouOnline activity, such as posts you’ve created and things you’ve liked.',
                    style: labelTextStyle.copyWith(
                      fontSize: width * .038,
                      color: hintTextColor,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width * .01,
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                size: width * .05,
                color: hintTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
