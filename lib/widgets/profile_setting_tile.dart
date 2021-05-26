import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileSettingTile extends StatelessWidget {
  final String imageURL, title;
  final VoidCallback callback;

  const ProfileSettingTile({
    Key key,
    @required this.imageURL,
    @required this.title,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return InkWell(
      onTap: () {
        callback();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .06,
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * .05,
              height: width * .05,
              child: Image.asset(
                imageURL,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: width * .03,
              height: height * .05,
            ),
            Text(
              title,
              style: labelTextStyle.copyWith(
                fontSize: width * .04,
              ),
              textScaleFactor: 1,
            ),
          ],
        ),
      ),
    );
  }
}
