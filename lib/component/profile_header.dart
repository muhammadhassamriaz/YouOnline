import 'package:transparent_image/transparent_image.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/create_user_story.dart';
import 'package:youonline/route/edit_profile_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileHeader extends StatefulWidget {
  final String fullname, profileAvatar, profileCover, username;
  final int userId;

  ProfileHeader({
    Key key,
    @required this.fullname,
    @required this.profileAvatar,
    @required this.profileCover,
    @required this.username,
    @required this.userId,
  }) : super(key: key);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    Orientation orientation = MediaQuery.of(context).orientation;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    _userProvider.timelineUserProfile.followers.forEach((element) {
      if (element.userId == _userProvider.user.userId) {
        isFollowed = true;
      } else {
        isFollowed = false;
      }
    });
    return Container(
      color: Colors.white,
      child: Column(
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
                      borderRadius: BorderRadius.circular(
                        orientation == Orientation.portrait
                            ? width * .03
                            : width * .08,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: widget.profileCover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: orientation == Orientation.portrait
                        ? width * .26
                        : SizeConfig.kDefaultSize * 75,
                    child: Container(
                      width: width * .4,
                      height: width * .4,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.profileAvatar,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: width * .015,
                          color: Colors.white,
                        ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.fullname ?? "",
                style: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 03.2,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              )
            ],
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .04,
            ),
            child: Row(
              children: [
                if (widget.userId != _userProvider.user.userId) Spacer(),
                if (widget.userId == _userProvider.user.userId)
                  Container(
                    width: width * .75,
                    height: height * .06,
                    child: YouOnlineButton(
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateUserStories(),
                          ),
                        );
                      },
                      title: "Add Story",
                      textSize: width * .045,
                    ),
                  )
                else
                  Container(
                    width: width * .75,
                    height: height * .06,
                    child: YouOnlineButton(
                      callback: () async {
                        if (isFollowed) {
                          await _userProvider.unfollowUser(context,
                              userId: widget.userId.toString());
                          setState(() {});
                        } else {
                          await _userProvider.followUser(context,
                              userId: widget.userId.toString());
                          setState(() {});
                        }
                      },
                      title: isFollowed ? "Unfollow" : "Follow",
                      textSize: width * .045,
                    ),
                  ),
                Spacer(),
                if (widget.userId == _userProvider.user.userId)
                  Container(
                    width: width * .14,
                    height: height * .06,
                    child: YouOnlineButton(
                      callback: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditProfileScreen(),
                          ),
                        );
                      },
                      title: "•••",
                      textSize: width * .04,
                      textColor: Colors.black,
                      color: searchContainerColor,
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: height * .015,
          ),
          SizedBox(
            height: height * .02,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 4,
              ),
              child: Row(
                children: List.generate(
                  _widgetProvider.profileSections.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        _widgetProvider.changeProfileSelectedIndex(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                _widgetProvider.profileSectionIndex == index
                                    ? BorderRadius.circular(
                                        SizeConfig.kDefaultSize * 10,
                                      )
                                    : BorderRadius.circular(
                                        SizeConfig.kDefaultSize * 0,
                                      ),
                            color: _widgetProvider.profileSectionIndex == index
                                ? lightGreenColor
                                : Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.kDefaultSize * 3,
                            vertical: SizeConfig.kDefaultSize * 2,
                          ),
                          child: Text(
                            _widgetProvider.profileSections[index],
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 3.5,
                              color:
                                  _widgetProvider.profileSectionIndex == index
                                      ? primaryColor
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
