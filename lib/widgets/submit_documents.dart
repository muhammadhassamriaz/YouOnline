import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class VerifyProfileSubmitDocs extends StatelessWidget {
  const VerifyProfileSubmitDocs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Wrap(
        spacing: SizeConfig.kDefaultSize * 5,
        children: [
          Container(
            height: SizeConfig.kDefaultSize * 43,
            width: SizeConfig.kDefaultSize * 43,
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 10,
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 18,
                  width: SizeConfig.kDefaultSize * 18,
                  child: Image.asset(
                    passportIcon,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 0,
                ),
                Text(
                  "Passport/ID Card",
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 3,
                  ),
                  maxLines: 1,
                  textScaleFactor: 1,
                )
              ],
            ),
          ),
          Container(
            height: SizeConfig.kDefaultSize * 43,
            width: SizeConfig.kDefaultSize * 43,
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 10,
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 16,
                  width: SizeConfig.kDefaultSize * 18,
                  child: Image.asset(
                    person2Icon,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                Text(
                  "Your Photo",
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 3,
                  ),
                  maxLines: 1,
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
