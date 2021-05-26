import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String imageURL, title, subtitle;

  MenuTile({
    Key key,
    @required this.imageURL,
    @required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Row(
      children: [
        SizedBox(
          width: width * .05,
          height: width * .05,
          child: Image.asset(
            imageURL,
          ),
        ),
        SizedBox(
          width: width * .03,
          height: height * .05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null)
              Text(
                title,
                style: labelTextStyle.copyWith(
                  fontSize: width * .04,
                ),
                textScaleFactor: 1,
              )
            else
              Text(
                title,
                style: labelTextStyle.copyWith(
                  fontSize: width * .04,
                ),
                textScaleFactor: 1,
              ),
            if (subtitle != null)
              Text(
                subtitle,
                style: labelTextStyle.copyWith(
                  fontSize: width * .03,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              )
          ],
        ),
      ],
    );
  }
}
