import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class PostRichTextSpan extends StatelessWidget {
  final String firstText, secondText, imageURL;

  const PostRichTextSpan({
    Key key,
    @required this.firstText,
    @required this.secondText,
    @required this.imageURL,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.kDefaultSize * 100;
    return Row(
      children: [
        SizedBox(
          width: width * .055,
          height: width * .055,
          child: Image.asset(
            imageURL,
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        RichText(
          textScaleFactor: 1,
          text: TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: labelTextStyle.copyWith(
                  fontSize: width * .035,
                ),
              ),
              TextSpan(
                text: secondText,
                style: labelTextStyle.copyWith(
                  fontSize: width * .035,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
