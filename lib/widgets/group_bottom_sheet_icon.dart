import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class GroupBottomSheetIconButton extends StatelessWidget {
  final String imageURL, title;
  final Color color;
  final VoidCallback callback;
  const GroupBottomSheetIconButton({
    Key key,
    @required this.imageURL,
    @required this.title,
    this.callback,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * .14,
          height: width * .14,
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
                    return searchContainerColor;
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
                child: SizedBox(
                  width: SizeConfig.kDefaultSize * 7,
                  height: SizeConfig.kDefaultSize * 7,
                  child: color != null
                      ? Image.asset(imageURL, color: color)
                      : Image.asset(
                          imageURL,
                        ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Center(
          child: Container(
            width: width * .22,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: subheadingTextStyle.copyWith(
                fontSize: width * .035,
              ),
              textScaleFactor: 1,
            ),
          ),
        ),
      ],
    );
  }
}
