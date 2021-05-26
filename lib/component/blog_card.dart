import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title, description;

  BlogCard({
    @required this.title,
    @required this.description,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      elevation: SizeConfig.kDefaultSize * 02.5,
      shadowColor: searchContainerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 05,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.kDefaultSize * 06,
          vertical: SizeConfig.kDefaultSize * 06,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ??
                  '',
              style: labelTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 05,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 06,
            ),
            Text(
              description ??
                  '',
              style: labelTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 04,
                color: Colors.grey,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 6.4,
            ),
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.kDefaultSize * 04,
                  height: SizeConfig.kDefaultSize * 04,
                  child: Image.asset(
                    Assets.WATCH_LATER,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 02,
                ),
                Text(
                  '08 Dec 2020',
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 03.5,
                    color: primaryColor,
                  ),
                  textScaleFactor: 1,
                ),
                Spacer(),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 04,
                  height: SizeConfig.kDefaultSize * 04,
                  child: Image.asset(
                    Assets.PERSON_ICON,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 02,
                ),
                Text(
                  'By Chocolate Melangeur',
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 03.5,
                    color: primaryColor,
                  ),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
