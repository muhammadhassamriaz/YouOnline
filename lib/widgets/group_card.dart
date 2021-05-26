import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroupCard extends StatelessWidget {
  final String groupName, groupMembers, groupAvatar;
  final int groupId;
  final VoidCallback joinGroupCallback;

  const GroupCard({
    Key key,
    @required this.groupName,
    @required this.groupMembers,
    @required this.groupAvatar,
    @required this.groupId,
    @required this.joinGroupCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 3,
      ),
      child: Container(
        height: SizeConfig.kDefaultSize * 82,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 3.2,
              blurRadius: 14.2,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            SizeConfig.kDefaultSize * 5,
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 50,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: groupAvatar ?? groupCover,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 4,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.kDefaultSize * 3,
              ),
              child: Text(
                groupName ?? 'Health Tips',
                style: subheadingTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 5,
                ),
                textScaleFactor: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.kDefaultSize * 3,
              ),
              child: Text(
                groupMembers ?? '158 Members • 16 Posts a day',
                style: hintTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 3.5,
                ),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 3,
              ),
              child: YouOnlineButton2(
                callback: () {
                  joinGroupCallback();
                },
                title: 'Join',
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
          ],
        ),
      ),
    );
  }
}
