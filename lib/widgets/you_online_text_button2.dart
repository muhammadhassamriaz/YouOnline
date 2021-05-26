import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class YouOnlineButton2 extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  YouOnlineButton2({
    Key key,
    @required this.title,
    @required this.callback,
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
          style: labelTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
            (states) => searchContainerColor,
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
