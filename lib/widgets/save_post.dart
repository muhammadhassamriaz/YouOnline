import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class SavePostTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Row(
      children: [
        Container(
          width: width * .23,
          height: width * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                videoThumbnail,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Building Amazon FBA Business from Pakistan',
                style: subheadingTextStyle.copyWith(
                  fontSize: width * .035,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: height * .003,
              ),
              Text(
                'Video . Extreme Commerce',
                style: labelTextStyle.copyWith(
                  fontSize: width * .032,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: height * .003,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: width * .02,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  Text(
                    'Saved 7w ago',
                    style: labelTextStyle.copyWith(
                      fontSize: width * .032,
                      color: hintTextColor,
                    ),
                    textScaleFactor: 1,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * .02,
        ),
        Icon(
          Icons.more_horiz,
          size: width * .05,
          color: hintTextColor,
        ),
      ],
    );
  }
}
