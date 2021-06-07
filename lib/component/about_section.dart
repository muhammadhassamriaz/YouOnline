import 'package:youonline/component/profile_header.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/friend_tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

class AboutSection extends StatefulWidget {
  final String userId;

  final String username, fullName, profileAvatar, profileCover;

  const AboutSection(
      {Key key,
      this.userId,
      this.username,
      this.fullName,
      this.profileAvatar,
      this.profileCover})
      : super(key: key);
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  List<String> followers = [
    friendProfileAvatar,
    follower2,
    follower3,
    follower4,
  ];

  int followerCount = 4;
  int followingCount = 4;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                fullname: widget.fullName,
                profileAvatar: widget.profileAvatar,
                profileCover: widget.profileCover,
                username: widget.username,
                userId: int.tryParse(widget.userId),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Divider(
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_userProvider.timelineUserProfile != null &&
                        _userProvider.timelineUserProfile.following != null &&
                        _userProvider.timelineUserProfile.following.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * .07,
                                height: width * .07,
                                child: Image.asset(
                                  follower,
                                ),
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Text(
                                'Following',
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .04,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1,
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 10,
                                  ),
                                  color: searchContainerColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.kDefaultSize * 3,
                                    vertical: SizeConfig.kDefaultSize * 1.5,
                                  ),
                                  child: Text(
                                    "${_userProvider.timelineUserProfile.following.length}",
                                    style: labelTextStyle.copyWith(
                                      fontSize: SizeConfig.kDefaultSize * 3,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Wrap(
                            spacing: width * .035,
                            runSpacing: width * .02,
                            children: List.generate(
                              _userProvider.timelineUserProfile.following
                                          .length >
                                      5
                                  ? _userProvider.timelineUserProfile.following
                                      .sublist(0, 4)
                                      .length
                                  : _userProvider
                                      .timelineUserProfile.following.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () async {
                                    BotToast.showLoading();
                                    await _userProvider.getTimelineUserProfile(
                                      userId: _userProvider.timelineUserProfile
                                          .following[index].userId
                                          .toString(),
                                    );

                                    BotToast.closeAllLoading();
                                  },
                                  child: FriendTag(
                                    imageURL: _userProvider.timelineUserProfile
                                        .following[index].avatar,
                                    name: _userProvider.timelineUserProfile
                                            .following[index].firstName +
                                        " " +
                                        _userProvider.timelineUserProfile
                                            .following[index].lastName,
                                    username: _userProvider.timelineUserProfile
                                        .following[index].username,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: height * .03,
                    ),
                    if (_userProvider.timelineUserProfile != null &&
                        _userProvider.timelineUserProfile.followers != null &&
                        _userProvider.timelineUserProfile.followers.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * .07,
                                height: width * .07,
                                child: Image.asset(
                                  follower,
                                ),
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Text(
                                'Followers',
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .04,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1,
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 10,
                                  ),
                                  color: searchContainerColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.kDefaultSize * 3,
                                    vertical: SizeConfig.kDefaultSize * 1.5,
                                  ),
                                  child: Text(
                                    "${_userProvider.timelineUserProfile.followers.length}",
                                    style: labelTextStyle.copyWith(
                                      fontSize: SizeConfig.kDefaultSize * 3,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Wrap(
                            spacing: width * .035,
                            runSpacing: width * .02,
                            children: List.generate(
                              _userProvider.timelineUserProfile.followers
                                          .length >
                                      5
                                  ? _userProvider.timelineUserProfile.followers
                                      .sublist(0, 4)
                                      .length
                                  : _userProvider
                                      .timelineUserProfile.followers.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () async {
                                    BotToast.showLoading();
                                    await _userProvider.getTimelineUserProfile(
                                      userId: _userProvider.timelineUserProfile
                                          .following[index].userId
                                          .toString(),
                                    );

                                    BotToast.closeAllLoading();
                                  },
                                  child: FriendTag(
                                    imageURL: _userProvider.timelineUserProfile
                                        .followers[index].avatar,
                                    username: _userProvider.timelineUserProfile
                                        .followers[index].username,
                                    name: _userProvider.timelineUserProfile
                                            .followers[index].firstName +
                                        " " +
                                        _userProvider.timelineUserProfile
                                            .followers[index].lastName,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
