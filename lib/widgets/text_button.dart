import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class YouOnlineTextButton extends StatelessWidget {
  final String assetImage;
  final String title;
  final Color color;
  final VoidCallback callback;

  YouOnlineTextButton({
    Key key,
    @required this.assetImage,
    @required this.title,
    @required this.color,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.kDefaultSize * 100;
    return TextButton(
      onPressed: () {
        callback();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width * .05,
            height: width * .05,
            child: Image.asset(
              assetImage,
            ),
          ),
          SizedBox(
            width: width * .02,
          ),
          Text(
            title,
            style: labelTextStyle.copyWith(
              fontSize: width * .038,
            ),
            textScaleFactor: 1,
          ),
        ],
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return searchContainerColor;
            return null;
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                width * .03,
              ),
            );
          },
        ),
      ),
    );
  }
}
