import 'package:youonline/component/profile_header.dart';
import 'package:youonline/component/profile_post_section_rich_text.dart';
import 'package:youonline/model/follower.dart';
import 'package:youonline/model/following.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/friend_tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    // PostRichTextSpan(
                    //   firstText: "Founder at",
                    //   secondText: " Hashed System",
                    //   imageURL: workIcon,
                    // ),
                    // SizedBox(
                    //   height: height * .01,
                    // ),
                    // PostRichTextSpan(
                    //   firstText: "Lives in",
                    //   secondText: " Dubai,UAE",
                    //   imageURL: homeTownIcon,
                    // ),
                    // SizedBox(
                    //   height: height * .01,
                    // ),
                    // PostRichTextSpan(
                    //   firstText: "From",
                    //   secondText: " Lahore, Pakistan",
                    //   imageURL: migrationIcon,
                    // ),
                    // SizedBox(
                    //   height: height * .01,
                    // ),
                    // PostRichTextSpan(
                    //   firstText: "",
                    //   secondText: "Married",
                    //   imageURL: relationStatusIcon,
                    // ),
                    // SizedBox(
                    //   height: height * .03,
                    // ),
                    if (_userProvider.followingData != null &&
                        _userProvider.followingData.followings != null &&
                        _userProvider.followingData.followings.length > 0)
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
                                    "${_userProvider.followingData.followings.length}",
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
                              _userProvider.followingData.followings.length > 5
                                  ? _userProvider.followingData.followings
                                      .sublist(0, 4)
                                      .length
                                  : _userProvider
                                      .followingData.followings.length,
                              (index) {
                                return FriendTag(
                                  imageURL: _userProvider
                                      .followingData.followings[index].avatar,
                                  name: _userProvider.followingData
                                          .followings[index].firstName +
                                      " " +
                                      _userProvider.followingData
                                          .followings[index].lastName,
                                  username: _userProvider
                                      .followingData.followings[index].username,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: height * .03,
                    ),
                    if (_userProvider.followerData.followers != null &&
                        _userProvider.followerData.followers.length > 0)
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
                                    "${_userProvider.followerData.followers.length}",
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
                              _userProvider.followerData.followers.length > 5 ?
                              _userProvider.followerData.followers
                                  .sublist(0, 4)
                                  .length : _userProvider.followerData.followers.length,
                              (index) {
                                return FriendTag(
                                  imageURL: _userProvider
                                      .followerData.followers[index].avatar,
                                  username: _userProvider
                                      .followerData.followers[index].username,
                                  name: _userProvider.followerData
                                          .followers[index].firstName +
                                      " " +
                                      _userProvider.followerData
                                          .followers[index].lastName,
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
