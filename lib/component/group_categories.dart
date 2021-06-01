import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GroupCategory extends StatelessWidget {
  final String title;
  final String groupAvatar;

  GroupCategory({
    Key key,
    @required this.title,
    @required this.groupAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.kDefaultSize * 28.5,
      width: SizeConfig.kDefaultSize * 28.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 3,
        ),
        image: DecorationImage(
          image: groupAvatar == null
              ? AssetImage(
                  Assets.STORY_CARD_IMAGE_PLACEHOLDER,
                )
              : NetworkImage(
                  groupAvatar,
                ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Spacer(),
          Container(
            width: SizeConfig.kDefaultSize * 28.5,
            height: SizeConfig.kDefaultSize * 10.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12.withAlpha(10),
                  Colors.black38,
                  Colors.black45,
                  Colors.black54,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 5,
                  ),
                  child: Center(
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: labelTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 3,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 1.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
