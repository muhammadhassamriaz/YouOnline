import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class YouOnlineText extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;

  YouOnlineText({
    Key key,
    @required this.text,
    this.color,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Text(
      text.toUpperCase(),
      style: textStyle ??
          titleTextStyle.copyWith(
            color: color ?? Color(0xff88888B),
            fontSize: SizeConfig.kDefaultSize * 3,
          ),
      textScaleFactor: 1,
    );
  }
}
