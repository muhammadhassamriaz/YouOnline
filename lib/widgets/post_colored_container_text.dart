import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PostColorContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color textColor;
  final String description;

  const PostColorContainer({
    Key key,
    @required this.color1,
    @required this.color2,
    @required this.textColor,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.kDefaultSize * 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: AutoSizeText(
            description,
            textAlign: TextAlign.center,
            style: labelTextStyle.copyWith(
              color: textColor,
              fontSize: 24,
            ),
            textScaleFactor: 1,
          ),
        ),
      ),
    );
  }
}
