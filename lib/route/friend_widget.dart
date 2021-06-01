import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class FriendWidget extends StatelessWidget {
  final bool isBlocked;
  final VoidCallback callback;

  FriendWidget({
    Key key,
    @required this.isBlocked,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Container(
          width: SizeConfig.kDefaultSize * 18,
          height: SizeConfig.kDefaultSize * 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                Assets.PROFILE_AVATAR,
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ali Awais Nadeem',
              style: subheadingTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 4.5,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            // Text(
            //   'Manners maketh man',
            //   style: hintTextStyle.copyWith(
            //     fontSize: SizeConfig.kDefaultSize * 3,
            //   ),
            //   textScaleFactor: 1,
            // ),
          ],
        ),
        Spacer(),
        if (isBlocked)
          InkWell(
            onTap: () {},
            child: Text(
              'Un-Block',
              style: hintTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 3,
              ),
              textScaleFactor: 1,
            ),
          )
        else
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
              size: SizeConfig.kDefaultSize * 5,
              color: hintTextColor,
            ),
          ),
      ],
    );
  }
}
