import 'package:provider/provider.dart';
import 'package:youonline/component/photo_section.dart';
import 'package:youonline/component/post_section.dart';
import 'package:youonline/component/video_section.dart';
import 'package:youonline/model/post_reaction.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/automotive/automotive.dart';
import 'package:youonline/route/login_registration_route.dart';
import 'package:youonline/route/profile_screen.dart';
import 'package:youonline/route/settings_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/prefs.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/expandable_settings_panel.dart';
import 'package:youonline/widgets/settings_route_tile.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:transparent_image/transparent_image.dart';

import 'edit_profile_screen.dart';

class MenuScreen extends StatelessWidget {
  List<PostReaction> postReactions = [];

  int reactionIndex;

  String likeReaction;

  List<String> emojis = [
    likeGIF,
    loveGIF,
    happyGIF,
    sadGIF,
    angryGIF,
    wowGIF,
  ];

  @override
  Widget build(BuildContext context) {
    var _userProvider = Provider.of<UserProvider>(context);
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 4,
              ),
              child: Row(
                children: [
                  Text(
                    'Menu',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                  // Spacer(),
                  // YouOnlineIconButton(
                  //   callback: () {},
                  //   icon: Icons.add,
                  // ),
                  // SizedBox(
                  //   width: SizeConfig.kDefaultSize * 3,
                  // ),
                  // YouOnlineIconButton(
                  //   callback: () {},
                  //   icon: Icons.settings,
                  // ),
                  // SizedBox(
                  //   width: SizeConfig.kDefaultSize * 3,
                  // ),
                  // YouOnlineIconButton(
                  //   callback: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (_) => SearchScreen(),
                  //       ),
                  //     );
                  //   },
                  //   icon: Icons.search,
                  // ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 4,
              ),
              child: GestureDetector(
                onTap: () async {
                  BotToast.showLoading();
                  await _userProvider.getTimelineUserProfile(
                    userId: _userProvider.user.userId.toString(),
                  );

                  BotToast.closeAllLoading();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                        userId: _userProvider.user.userId.toString(),
                        profileCover: _userProvider.user.cover,
                        profileAvatar: _userProvider.user.avatar,
                        fullName: _userProvider.user.firstName +
                            " " +
                            _userProvider.user.lastName,
                        username: _userProvider.user.username,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.kDefaultSize * 15,
                      height: SizeConfig.kDefaultSize * 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: _userProvider.user?.avatar != null
                          ? ClipOval(
                              child: FadeInImage.memoryNetwork(
                                image: _userProvider.user.avatar,
                                placeholder: kTransparentImage,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                Assets.PROFILE_AVATAR,
                              ),
                            ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_userProvider.user.firstName != null &&
                            _userProvider.user.lastName != null)
                          Text(
                            _userProvider.user.firstName.replaceFirst(" ", "") +
                                " " +
                                _userProvider.user.lastName,
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 4,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          )
                        else
                          Text(
                            _userProvider.user.username,
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 03.2,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          ),
                        // Text(
                        //   'Manners maketh man',
                        //   style: hintTextStyle.copyWith(
                        //     fontSize: SizeConfig.kDefaultSize * 3.5,
                        //   ),
                        //   textScaleFactor: 1,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Center(
                      child: Wrap(
                        spacing: SizeConfig.kDefaultSize * 3,
                        runSpacing: SizeConfig.kDefaultSize * 5,
                        children: List.generate(
                          titles.length,
                          (index) {
                            String text;
                            if (titles[index].toLowerCase().contains("group") ||
                                titles[index].toLowerCase().contains("page") ||
                                titles[index]
                                    .toLowerCase()
                                    .contains("profile")) {
                              text = "";
                            } else {
                              text = "Coming Soon";
                            }
                            return SettingsTile(
                              callback: () async {
                                if (titles[index]
                                    .toLowerCase()
                                    .contains("view")) {
                                  BotToast.showLoading();
                                  await _userProvider.getTimelineUserProfile(
                                    userId:
                                        _userProvider.user.userId.toString(),
                                  );
                                  BotToast.closeAllLoading();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                        userId: _userProvider.user.userId
                                            .toString(),
                                        profileCover: _userProvider.user.cover,
                                        profileAvatar:
                                            _userProvider.user.avatar,
                                        fullName: _userProvider.user.firstName +
                                            " " +
                                            _userProvider.user.lastName,
                                        username: _userProvider.user.username,
                                      ),
                                    ),
                                  );
                                } else if (titles[index]
                                    .toLowerCase()
                                    .contains("video")) {
                                  BotToast.showLoading();
                                  await _userProvider.getTimelineUserProfile(
                                    userId:
                                        _userProvider.user.userId.toString(),
                                  );
                                  _widgetProvider.changeProfileSelectedIndex(3);
                                  BotToast.closeAllLoading();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                        userId: _userProvider.user.userId
                                            .toString(),
                                        profileCover: _userProvider.user.cover,
                                        profileAvatar:
                                            _userProvider.user.avatar,
                                        fullName: _userProvider.user.firstName +
                                            " " +
                                            _userProvider.user.lastName,
                                        username: _userProvider.user.username,
                                      ),
                                    ),
                                  );
                                } else if (titles[index]
                                    .toLowerCase()
                                    .contains("photo")) {
                                  BotToast.showLoading();
                                  await _userProvider.getTimelineUserProfile(
                                    userId:
                                        _userProvider.user.userId.toString(),
                                  );
                                  _widgetProvider.changeProfileSelectedIndex(2);
                                  BotToast.closeAllLoading();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                        userId: _userProvider.user.userId
                                            .toString(),
                                        profileCover: _userProvider.user.cover,
                                        profileAvatar:
                                            _userProvider.user.avatar,
                                        fullName: _userProvider.user.firstName +
                                            " " +
                                            _userProvider.user.lastName,
                                        username: _userProvider.user.username,
                                      ),
                                    ),
                                  );
                                } else if (titles[index]
                                    .toLowerCase()
                                    .contains("post")) {
                                  BotToast.showLoading();
                                  await _userProvider.getTimelineUserProfile(
                                    userId:
                                        _userProvider.user.userId.toString(),
                                  );
                                  _widgetProvider.changeProfileSelectedIndex(1);
                                  BotToast.closeAllLoading();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                        userId: _userProvider.user.userId
                                            .toString(),
                                        profileCover: _userProvider.user.cover,
                                        profileAvatar:
                                            _userProvider.user.avatar,
                                        fullName: _userProvider.user.firstName +
                                            " " +
                                            _userProvider.user.lastName,
                                        username: _userProvider.user.username,
                                      ),
                                    ),
                                  );
                                } else if (titles[index]
                                    .toLowerCase()
                                    .contains("edit")) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => EditProfileScreen(),
                                    ),
                                  );
                                } else if (titles[index]
                                    .toLowerCase()
                                    .contains("out")) {
                                  clearPrefs();
                                  Provider.of<TimelineProvider>(context,
                                          listen: false)
                                      .changeTimelineData([]);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginRegistrationScreen(),
                                    ),
                                    (route) => false,
                                  );
                                } else {
                                  menuRoute(
                                      context: context, menu: titles[index]);
                                }
                              },
                              title: titles[index],
                              imageURL: images[index],
                              color: colors[index],
                              // isNew: index == 4 ? true : ,
                              comingSoonText: text,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 5,
                    ),
                    // ExpandableSettingsPanel(),
                    // ListTile(
                    //   title: Text(
                    //     'Automotive',
                    //     textScaleFactor: 1,
                    //     style: labelTextStyle.copyWith(
                    //       fontSize: SizeConfig.kDefaultSize * 4,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => AutomotiveScreen(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // SizedBox(
                    //   height: SizeConfig.kDefaultSize * 2,
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'Settings',
                    //     textScaleFactor: 1,
                    //     style: labelTextStyle.copyWith(
                    //       fontSize: SizeConfig.kDefaultSize * 4,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => SettingsScreen(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // // ListTile(
                    // //   leading: Text(
                    // //     'Night Mode',
                    // //     textScaleFactor: 1,
                    // //     style: labelTextStyle.copyWith(
                    // //       fontSize: SizeConfig.kDefaultSize * 4,
                    // //     ),
                    // //   ),
                    // //   trailing: Icon(
                    // //     Icons.nights_stay_outlined,
                    // //     size: SizeConfig.kDefaultSize * 6,
                    // //   ),
                    // // ),
                    // ListTile(
                    //   title: Text(
                    //     'Log Out',
                    //     textScaleFactor: 1,
                    //     style: labelTextStyle.copyWith(
                    //       fontSize: SizeConfig.kDefaultSize * 4,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     clearPrefs();
                    //     Provider.of<TimelineProvider>(context, listen: false)
                    //         .changeTimelineData([]);
                    //     Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => LoginRegistrationScreen(),
                    //       ),
                    //       (route) => false,
                    //     );
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
