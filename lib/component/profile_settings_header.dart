import 'dart:io';

import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileSettingsHeader extends StatelessWidget {
  const ProfileSettingsHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
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
                'Profile Settings',
                style: subheadingTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 6,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
