import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldIcon extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Color iconColor;
  final String imageURL;

  TextFieldIcon({
    Key key,
    @required this.textEditingController,
    @required this.hintText,
    @required this.iconColor,
    @required this.imageURL,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Container(
      width: double.infinity,
      height: height * .06,
      decoration: BoxDecoration(
        color: searchContainerColor,
        borderRadius: BorderRadius.circular(
          width * .03,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: width * .03,
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
          ),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintStyle: hintTextStyle.copyWith(
                fontSize: width * .035,
              ),
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: SizedBox(
                width: width * .05,
                height: width * .05,
                child: Padding(
                  padding: EdgeInsets.all(
                    width * .035,
                  ),
                  child: Image.asset(
                    imageURL,
                    color: iconColor ?? primaryColor,
                  ),
                ),
              ),
              labelStyle: labelTextStyle.copyWith(
                fontSize: width * .035,
              ),
            ),
            style: labelTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 4,
            ),
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}
