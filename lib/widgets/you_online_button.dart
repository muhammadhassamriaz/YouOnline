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
  final TextStyle textStyle;
  final Icon icon;

  YouOnlineButton({
    @required this.callback,
    @required this.title,
    this.textSize,
    this.color,
    this.textColor,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (icon == null) {
      return Container(
        width: double.infinity,
        height: SizeConfig.kDefaultSize * 12,
        child: TextButton(
          child: Text(
            title,
            style: textStyle ??
                labelTextStyle.copyWith(
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
    } else {
      double width = MediaQuery.of(context).size.width;
      return Container(
        width: double.infinity,
        height: SizeConfig.kDefaultSize * 12,
        child: TextButton(
          child: Row(
            children: [
              icon,
              SizedBox(
                width: width * .02,
              ),
              Text(
                title,
                style: textStyle ??
                    labelTextStyle.copyWith(
                      fontSize: textSize ?? SizeConfig.kDefaultSize * 4.2,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textScaleFactor: 1,
              ),
            ],
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
}
