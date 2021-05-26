import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsTile extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final String imageURL;
  final Color color;
  bool isNew = false;
  final String comingSoonText;

  SettingsTile({
    @required this.callback,
    @required this.title,
    @required this.imageURL,
    @required this.color,
    this.isNew,
    @required this.comingSoonText,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.kDefaultSize * 100;
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: SizeConfig.kDefaultSize * 28,
        width: SizeConfig.kDefaultSize * 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.kDefaultSize * 4,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1.2,
              blurRadius: 14.2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 4,
            vertical: SizeConfig.kDefaultSize * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 6,
                    height: SizeConfig.kDefaultSize * 7,
                    child: Image.asset(
                      imageURL,
                    ),
                  ),
                  Text(
                    "      " + comingSoonText,
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 2,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Text(
                title,
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
              if (isNew != null)
                if (isNew)
                  Row(
                    children: [
                      Container(
                        width: width * .02,
                        height: width * .02,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: width * .01,
                      ),
                      Text(
                        "2 new",
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 3.5,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
            ],
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );
  }
}
