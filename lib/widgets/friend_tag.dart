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
          child: imageURL != null
              ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageURL,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipOval(
                  child: Image.asset(
                    friendProfileAvatar,
                  ),
                ),
        ),
        SizedBox(
          height: height * .01,
        ),
        if (username != null && username.isNotEmpty)
          Container(
            width: width * .2,
            child: Center(
              child: Text(
                username,
                maxLines: 1,
                style: labelTextStyle.copyWith(
                  color: hintTextColor,
                  fontSize: width * .032,
                ),
                textScaleFactor: 1,
              ),
            ),
          )
        else if (name != null && name.isNotEmpty)
          Container(
            width: width * .2,
            child: Center(
              child: Text(
                name,
                maxLines: 1,
                style: labelTextStyle.copyWith(
                  color: hintTextColor,
                  fontSize: width * .032,
                ),
                textScaleFactor: 1,
              ),
            ),
          )
        else
          Container(
            width: width * .2,
            child: Center(
              child: Text(
                "YouOnline",
                maxLines: 1,
                style: labelTextStyle.copyWith(
                  color: hintTextColor,
                  fontSize: width * .032,
                ),
                textScaleFactor: 1,
              ),
            ),
          ),
      ],
    );
  }
}
