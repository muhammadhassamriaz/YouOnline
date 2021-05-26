import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class YouOnlineButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final double textSize;
  final Color color;
  final Color textColor;

  YouOnlineButton({
    @required this.callback,
    @required this.title,
    this.textSize,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.kDefaultSize * 12,
      child: TextButton(
        child: Text(
          title,
          style: labelTextStyle.copyWith(
            fontSize: textSize ?? SizeConfig.kDefaultSize * 4.2,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
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
            (states) => color ?? primaryColor,
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
