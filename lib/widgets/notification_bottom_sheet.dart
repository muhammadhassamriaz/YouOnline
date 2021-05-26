import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'menu_tile.dart';

notificationBottomSheet(BuildContext context) {
  SizeConfig().init(context);
  double height = SizeConfig.kDefaultSize * 100 * 2;
  double width = SizeConfig.kDefaultSize * 100;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.kDefaultSize * 4),
        topRight: Radius.circular(SizeConfig.kDefaultSize * 4),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height * .02,
          ),
          Center(
            child: Container(
              height: height * .006,
              width: width * .2,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  width * .03,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: hidePost,
                title: "Remove this notification",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: hideAllIcon,
                title: "Turn on  notifications for this post",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: supportIcon,
                title: "Report issues to notification team",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      );
    },
  );
}
