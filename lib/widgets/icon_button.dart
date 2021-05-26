import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YouOnlineIconButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color color;
  String imageURL;
  double buttonWidth;
  double buttonheight;
  bool isIcon;
  YouOnlineIconButton({
    Key key,
    @required this.callback,
    @required this.icon,
    this.color,
    this.iconColor,
    this.iconSize,
    this.isIcon = true,
    this.imageURL,
    this.buttonWidth,
    this.buttonheight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return 
    Container(
      width: buttonWidth ?? SizeConfig.kDefaultSize * 10,
      height: buttonheight ?? SizeConfig.kDefaultSize * 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: searchContainerColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                (Set<MaterialState> states) {
              return EdgeInsets.all(0);
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.black26;
                return color ?? searchContainerColor;
              },
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.kDefaultSize * 3,
                  ),
                );
              },
            ),
          ),
          child: Center(
            child: isIcon
                ? Icon(
                    icon,
                    size: iconSize ?? SizeConfig.kDefaultSize * 6,
                  )
                : SizedBox(
                    width: SizeConfig.kDefaultSize * 7,
                    height: SizeConfig.kDefaultSize * 7,
                    child: Image.asset(
                      imageURL,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
