import 'package:youonline/component/profile_settings_header.dart';
import 'package:youonline/route/activity_log_screen.dart';
import 'package:youonline/route/archive_screen.dart';
import 'package:youonline/route/edit_profile_screen.dart';
import 'package:youonline/route/review_post_screen.dart';
import 'package:youonline/route/view_as_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/profile_setting_tile.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSettingsHeader(),
              SizedBox(
                height: height * .03,
              ),
              ProfileSettingTile(
                imageURL: editProfileIcon,
                title: "Edit Profile",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditProfileScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              ProfileSettingTile(
                imageURL: archiveIcon,
                title: "Archive",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArchiveScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              ProfileSettingTile(
                imageURL: viewAsIcon,
                title: "View As",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewAsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              ProfileSettingTile(
                imageURL: activityLogIcon,
                title: "Activity Log",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ActivityLogScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              ProfileSettingTile(
                imageURL: reviewPostsIcon,
                title: "Review Posts & Tags",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ReviewPostScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                width: double.infinity,
                height: height * .01,
                color: Colors.grey[200],
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .06,
                ),
                child: Text(
                  'Your Profile Link',
                  style: subheadingTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 6,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .06,
                ),
                child: Text(
                  'Your personalized link on Facebook.',
                  style: labelTextStyle.copyWith(
                    fontSize: width * .038,
                    color: hintTextColor,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .06,
                ),
                child: Text(
                  'https://www.youonline.site/zain.mehmood',
                  style: labelTextStyle.copyWith(
                    fontSize: width * .038,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .06,
                ),
                child: YouOnlineButton(
                  callback: () {},
                  title: "Copy Link",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
