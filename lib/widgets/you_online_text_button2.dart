import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class YouOnlineButton2 extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color buttonColor;
  final TextStyle textStyle;
  final Color textColor;

  YouOnlineButton2({
    Key key,
    @required this.title,
    @required this.callback,
    this.buttonColor,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.kDefaultSize * 12,
      child: TextButton(
        child: Text(
          title,
          style: textStyle ??
              labelTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.black,
                fontSize: SizeConfig.kDefaultSize * 4,
              ),
          textScaleFactor: 1,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.kDefaultSize * 3,
                ),
              );
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => buttonColor ?? searchContainerColor,
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.black26,
          ),
        ),
        onPressed: () {
          callback();
        },
      ),
    );
  }
}
