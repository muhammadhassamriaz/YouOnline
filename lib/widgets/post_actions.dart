import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCallbackActions extends StatelessWidget {
  final Function likedButtonOnPressed;
  final Function commentButtonCallback;
  final Function shareButtonCallback;
  final bool isView;

  const PostCallbackActions({
    Key key,
    @required this.likedButtonOnPressed,
    @required this.commentButtonCallback,
    @required this.shareButtonCallback,
    @required this.isView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 01,
          ),
          onPressed: () {
            _widgetProvider.changeReaction(likeGIF);
          },
          onLongPress: () {
            if (!isView) {
              likedButtonOnPressed();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: SizeConfig.kDefaultSize * 04,
                height: SizeConfig.kDefaultSize * 04,
                child: Image.asset(
                  Assets.LIKE_BUTTON_ICON,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: SizeConfig.kDefaultSize * 02,
              ),
              Text(
                'Like',
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 04,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 01,
          ),
          onPressed: () {
            commentButtonCallback();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: SizeConfig.kDefaultSize * 05,
                height: SizeConfig.kDefaultSize * 05,
                child: Image.asset(
                  Assets.MESSAGE_ICON,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: SizeConfig.kDefaultSize * 02,
              ),
              Text(
                'Comment',
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 04,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 01,
          ),
          onPressed: () {
            if (!isView) {
              shareButtonCallback();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: SizeConfig.kDefaultSize * 04,
                height: SizeConfig.kDefaultSize * 04,
                child: Image.asset(
                  Assets.SHARE_ICON,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: SizeConfig.kDefaultSize * 02,
              ),
              Text(
                'Share',
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 04,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
