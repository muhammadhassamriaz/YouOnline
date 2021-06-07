import 'package:youonline/model/page.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/group_detail_screen.dart';
import 'package:youonline/route/profile_screen.dart';
import 'package:youonline/route/single_page_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class PostCardHeader extends StatelessWidget {
  final String profileAvatar;
  final String name;
  final bool isView;
  bool isPostShared;
  final String time;
  final String feelings;
  final VoidCallback callback;
  final User user;
  final TimelinePage page;
  final Group group;

  PostCardHeader({
    Key key,
    @required this.profileAvatar,
    @required this.name,
    @required this.isView,
    this.isPostShared = false,
    @required this.time,
    @required this.feelings,
    @required this.callback,
    @required this.user,
    @required this.group,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.kDefaultSize * 03,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (user != null) {
                BotToast.showLoading();
                await _userProvider.getTimelineUserProfile(
                  userId: user.userId.toString(),
                );

                BotToast.closeAllLoading();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(
                      userId: user.userId.toString(),
                      profileCover: user.cover,
                      fullName: user.firstName + " " + user.lastName,
                      profileAvatar: user.avatar,
                      username: user.username,
                    ),
                  ),
                );
              } else if (group != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GroupDetailScreen(
                      groupTitle: group.groupTitle,
                      groupAvatar: group.avatar,
                      groupCoverPhoto: group.cover,
                      groupInfo: group.about,
                      groupId: group.id,
                    ),
                  ),
                );
              } else if (page != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SinglePageScreen(
                      pageId: page.pageId.toString(),
                      pageName: page.pageTitle,
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: SizeConfig.kDefaultSize * 15,
              height: SizeConfig.kDefaultSize * 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: SizedBox(
                  width: SizeConfig.kDefaultSize * 15,
                  height: SizeConfig.kDefaultSize * 15,
                  child: profileAvatar != null
                      ? FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: profileAvatar,
                          fit: BoxFit.cover,
                          imageScale: 0.5,
                          excludeFromSemantics: true,
                        )
                      : Image.asset(
                          Assets.PROFILE_AVATAR,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.kDefaultSize * 03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (user != null) {
                      BotToast.showLoading();
                      await _userProvider.getTimelineUserProfile(
                        userId: _userProvider.user.userId.toString(),
                      );

                      BotToast.closeAllLoading();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileScreen(
                            userId: user.userId.toString(),
                            profileCover: user.cover,
                            fullName: user.firstName + " " + user.lastName,
                            profileAvatar: user.avatar,
                            username: user.username,
                          ),
                        ),
                      );
                    } else if (group != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GroupDetailScreen(
                            groupTitle: group.groupTitle,
                            groupAvatar: group.avatar,
                            groupCoverPhoto: group.cover,
                            groupInfo: group.about,
                            groupId: group.id,
                          ),
                        ),
                      );
                    } else if (page != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SinglePageScreen(
                            pageId: page.pageId.toString(),
                            pageName: page.pageTitle,
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                name.replaceFirst(" ", "") ??
                                    'YouOnline Prizes Egypt',
                                style: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 4,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                textScaleFactor: 1,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.kDefaultSize * 1,
                            ),
                            Flexible(
                              child: SizedBox(
                                width: SizeConfig.kDefaultSize * 04,
                                height: SizeConfig.kDefaultSize * 04,
                                child: Image.asset(
                                  Assets.VERIFIED_ICON,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          callback();
                        },
                        child: SizedBox(
                          width: SizeConfig.kDefaultSize * 04,
                          height: SizeConfig.kDefaultSize * 04,
                          child: Image.asset(
                            Assets.OPTION_ICON,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (feelings != null && feelings.isNotEmpty)
                  Row(
                    children: [
                      Text(
                        time ?? "",
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 3.2,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                      Text(
                        " - ",
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 03,
                        height: SizeConfig.kDefaultSize * 03,
                        child: Image.asset(
                          "assets/images/" + feelings + ".png",
                        ),
                      ),
                      Text(
                        " feeling $feelings",
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 3.2,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  )
                else
                  Text(
                    time ?? "",
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 3.2,
                      color: hintTextColor,
                    ),
                    textScaleFactor: 1,
                  ),
                if (isPostShared)
                  Text(
                    'Shared a post',
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 3,
                      color: hintTextColor,
                    ),
                    textScaleFactor: 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
