import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/add_automotive.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';

class AutomotiveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.kDefaultSize * 0.5),
            child: SizedBox(
              width: SizeConfig.kDefaultSize * 5,
              height: SizeConfig.kDefaultSize * 5,
              child: Platform.isAndroid
                  ? Image.asset(
                      Assets.BACK_ARROW_ICON,
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                    ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 5,
        ),
        Text(
          "Automotive",
          maxLines: 1,
          style:
              headingTextStyle.copyWith(fontSize: SizeConfig.kDefaultSize * 6),
          textScaleFactor: 1,
        ),
        Spacer(),
        YouOnlineIconButton(
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddAutomotiveScreen(),
              ),
            );
          },
          icon: Icons.add,
        ),
        SizedBox(
          width: width * .02,
        ),
        YouOnlineIconButton(
          callback: () {},
          icon: Icons.bookmark,
        ),
        SizedBox(
          width: width * .02,
        ),
        YouOnlineIconButton(
          callback: () {},
          icon: Icons.search,
        ),
      ],
    );
  }
}
