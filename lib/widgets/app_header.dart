import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback callback;

  ScreenHeader({
    Key key,
    @required this.title,
    @required this.buttonTitle,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 3,
      ),
      child: Row(
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
            title,
            maxLines: 1,
            style: headingTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 6),
            textScaleFactor: 1,
          ),
          Spacer(),
          Container(
            width: SizeConfig.kDefaultSize * 28,
            height: SizeConfig.kDefaultSize * 11,
            child: ElevatedButton(
              child: Text(
                buttonTitle,
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 3.8,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (states) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.kDefaultSize * 5,
                      ),
                    );
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => primaryColor,
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.black26,
                ),
              ),
              onPressed: () {
                callback();
              },
            ),
          )
        ],
      ),
    );
  }
}
