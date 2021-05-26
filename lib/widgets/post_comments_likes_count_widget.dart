import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostCommentsLikesWidget extends StatelessWidget {
  final bool isView;
  final Function commentButtonCallback;
  final int reactionCount;
  final int commentCount;
  String reaction;

  PostCommentsLikesWidget({
    Key key,
    @required this.isView,
    @required this.commentButtonCallback,
    @required this.commentCount,
    @required this.reactionCount,
    @required this.reaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 02,
      ),
      child: InkWell(
        onTap: () {
          if (!isView) {
            commentButtonCallback();
          }
        },
        child: Row(
          children: [
            if (reaction != null)
              if (reactionCount != null)
                SizedBox(
                  width: SizeConfig.kDefaultSize * 05,
                  height: SizeConfig.kDefaultSize * 05,
                  child: Image.asset(
                    "assets/images/" + reaction + ".gif",
                  ),
                ),
            SizedBox(
              width: SizeConfig.kDefaultSize * 01,
            ),
            if (reactionCount != null)
              if (reactionCount != null)
                Text(
                  "${reactionCount ?? 0}",
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 03.6,
                    color: hintTextColor,
                  ),
                  textScaleFactor: 1,
                ),
            Spacer(),
            if (commentCount != null)
              Text(
                '${commentCount ?? 0} Comments',
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 03.6,
                  color: hintTextColor,
                ),
                textScaleFactor: 1,
              ),
            SizedBox(
              width: SizeConfig.kDefaultSize * 02,
            ),
            Container(
              width: SizeConfig.kDefaultSize * 05,
              height: SizeConfig.kDefaultSize * 05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    _userProvider.user.avatar,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
