import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroupTile extends StatelessWidget {
  final String groupTitle, groupAvatar;
  final int groupId;
  final VoidCallback joinGroupFunction;

  const GroupTile({
    Key key,
    @required this.groupTitle,
    @required this.groupAvatar,
    @required this.groupId,
    @required this.joinGroupFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Container(
          height: SizeConfig.kDefaultSize * 17,
          width: SizeConfig.kDefaultSize * 17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeConfig.kDefaultSize * 5,
            ),
            image: DecorationImage(
              image: groupAvatar == null
                  ? AssetImage(
                      Assets.STORY_CARD_IMAGE_PLACEHOLDER,
                    )
                  : CachedNetworkImage(
                      imageUrl: groupAvatar,
                    ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                groupTitle ?? 'Essential Tips to Follow',
                overflow: TextOverflow.ellipsis,
                style: subheadingTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4.7,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Text(
                // '158 Members • 16 Posts a day',
                "",
                maxLines: 1,
                style: hintTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 3.5,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 2,
        ),
        Container(
          width: SizeConfig.kDefaultSize * 20,
          height: SizeConfig.kDefaultSize * 10,
          child: YouOnlineButton2(
            title: "Join",
            callback: () {
              joinGroupFunction();
            },
          ),
        ),
      ],
    );
  }
}
