import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FriendTag extends StatelessWidget {
  final String imageURL;
  final String name;
  final String username;

  const FriendTag({
    Key key,
    @required this.imageURL,
    @required this.name,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Column(
      children: [
        Container(
          width: width * .2,
          height: width * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageURL != null
                  ? CachedNetworkImage(
                      imageUrl: imageURL,
                    )
                  : AssetImage(friendProfileAvatar),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(
            //   width * .05,
            // ),
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Container(
          width: width * .2,
          child: Center(
            child: Text(
              name != null ? name : username,
              maxLines: 1,
              style: labelTextStyle.copyWith(
                color: hintTextColor,
                fontSize: width * .032,
              ),
              textScaleFactor: 1,
            ),
          ),
        )
      ],
    );
  }
}
