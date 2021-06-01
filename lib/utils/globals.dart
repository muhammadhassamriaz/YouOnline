import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youonline/bloc/connectivity.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/blog_screen.dart';
import 'package:youonline/route/event_screen.dart';
import 'package:youonline/route/friend_request_screen.dart';
import 'package:youonline/route/group_screen.dart';
import 'package:youonline/route/page_screen.dart';
import 'package:youonline/route/save_post_screen.dart';
import 'package:youonline/route/videos_screen.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

import 'assets.dart';

final List<Color> colors = [
  Color(0xffFDF4FF),
  Color(0xffECFBF0),
  Color(0xffECFBF0),
  Color(0xffFEF8EE),
  Color(0xffEDFAFC),
  Color(0xffECF0FA),
  Color(0xffECFBF0),
  Color(0xffFEEBEB),
  Color(0xffFEEBEB),
];

Future menuRoute({
  @required BuildContext context,
  @required String menu,
}) async {
  if (menu.toLowerCase().contains("friends")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FriendRequestScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("group")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GroupScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("blog")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlogScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("event")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("videos")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideosScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("pages")) {
    BotToast.showLoading();
    await Provider.of<UserProvider>(context, listen: false).getUserPages();
    BotToast.closeAllLoading();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PageScreen(),
      ),
    );
  } else if (menu.toLowerCase().contains("save")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SavedPostScreen(),
      ),
    );
  }
}

BlocClass myBloc;

final List<String> titles = [
  "Events",
  "Groups",
  "Friends",
  "Blog",
  "View Profile",
  "Pages",
  "Videos",
  "Market Place",
  "News Feed",
];

final List<String> feelingsText = [
  'Happy',
  'Loved',
  'Sad',
  'So Sad',
  'Angry',
  'Confused',
  'Smirk',
  'Broke',
  'Expressionless',
  'Cool',
  'Funny',
  'Tired',
  'Lovely',
  'Blessed',
  'Shocked',
  'Sleepy',
  'Pretty',
  'Bored',
];

final List<String> images = [
  calendarIcon,
  groupsIcon,
  friendsIcon,
  blogIcon2,
  profileIcon,
  pageIcon2,
  videoIcon2,
  savedPostsIcon,
  newsFeedIcon,
];

final List<String> images2 = [
  albumIcon,
  pokeIcon,
  articleIcon,
  // classifiedIcon,
  // directoryIcon,
  // automotiveIcon,
  // popularPostsIcon,
  exploreIcon,
  commonThingsIcon,
];

final List<String> settingTileTitles = [
  "Edit Profile",
  // "Security",
  // "Social Accounts",
  // "Design",
  // "Block Users",
  // "Notification Settings",
  // "Verification",
  // "Earnings",
  // "My Information",
  "Delete Account",
];

final List<String> settingTileImages = [
  profileIcon,
  // securityIcon,
  // socialIcon,
  // designIcon,
  // blockIcon,
  // notificationIcon,
  // verificationIcon,
  // earningIcon,
  // informationIcon,
  deleteIcon,
];

final List<bool> showTileDownArrow = [
  false,
  // // true,
  // false,
  // true,
  // false,
  // false,
  // false,
  // true,
  // false,
  false,
];

final List<String> informationTileImages = [
  informationIcon,
  postsIcon,
  pagesIcon,
  groupsIcon2,
  followingIcon,
  followerIcon,
];

final List<String> informationTilesTitle = [
  "My Info",
  "Posts",
  "Pages",
  "Groups",
  "Following",
  "Followers"
];

final List<String> settingTitles = [
  "Albums",
  "Pokes",
  "My Articles",
  // "Classifieds",
  // "Business Directory",
  // "Automotives",
  // "Popular Posts",
  "Explore",
  "Common Things",
];

class Globals {
  // ignore: close_sinks
  static BlocClass blocClass;

  static playShareNowNotificationSound() async {
    AudioCache _audioCache = AudioCache(
        prefix: "assets/sounds/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    _audioCache.play("share.mp3");
  }

  static Future<void> likeButtonFunction({
    @required BuildContext context,
    @required VoidCallback callback,
  }) async {
    SizeConfig().init(context);

    List<String> emojis = [
      likeGIF,
      loveGIF,
      happyGIF,
      sadGIF,
      angryGIF,
      wowGIF,
    ];
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.all(0),
          buttonPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.kDefaultSize * 18,
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          titlePadding: EdgeInsets.all(0),
          content: Container(
            height: SizeConfig.kDefaultSize * 20,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                emojis.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      callback();
                    },
                    child: SizedBox(
                      width: SizeConfig.kDefaultSize * 10,
                      height: SizeConfig.kDefaultSize * 10,
                      child: Image.asset(
                        emojis[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
