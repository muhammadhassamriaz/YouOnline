import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  HeaderTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 4,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                width: SizeConfig.kDefaultSize * 6,
                height: SizeConfig.kDefaultSize * 6.6,
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
            title,
            style: headingTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 6,
            ),
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }
}
