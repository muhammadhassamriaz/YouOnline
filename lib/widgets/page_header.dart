import 'package:flutter/material.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';
import 'package:provider/provider.dart';

class PageHeader extends StatelessWidget {
  final String fullname, profileAvatar, profileCover, username;
  final int pageId;

  PageHeader({
    Key key,
    @required this.fullname,
    @required this.profileAvatar,
    @required this.profileCover,
    @required this.username,
    @required this.pageId,
  }) : super(key: key);

  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    Orientation orientation = MediaQuery.of(context).orientation;
    var _userProvider = Provider.of<UserProvider>(context);
    if (_userProvider.allPages.pages != null &&
        _userProvider.allPages.pages.length > 0) {
      _userProvider.allPages.pages.forEach((element) {
        if (element.page.pageId == pageId) {
          isFollowed = true;
        }
      });
    } else if (_userProvider.allPages.suggestions != null &&
        _userProvider.allPages.suggestions.length > 0) {
      _userProvider.allPages.suggestions.forEach((element) {
        if (element.page.pageId == pageId) {
          isFollowed = true;
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * .03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
          ),
          child: Container(
            height: height * .35,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: height * .25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        profileCover,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(
                      orientation == Orientation.portrait
                          ? width * .03
                          : width * .08,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
                Positioned(
                  bottom: 0,
                  left: width * .0,
                  child: Container(
                    width: width * .4,
                    height: width * .4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          profileAvatar,
                        ),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        width: width * .015,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: height * .01,
                  right: width * .02,
                  child: Container(
                    width: width * .23,
                    child: YouOnlineButton2(
                      callback: () async {
                        if (isFollowed) {
                          await _userProvider.unfollowPage(context,
                              pageId: pageId.toString());
                        } else {
                          await _userProvider.followPage(
                            context,
                            pageId: pageId.toString(),
                            pageName: fullname,
                            pageScreen: true,
                          );
                        }
                      },
                      title: isFollowed ? "Unfollow" : "Follow",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .03,
            ),
            Text(
              fullname ?? "",
              style: labelTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 03.2,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            )
          ],
        ),
      ],
    );
  }
}
