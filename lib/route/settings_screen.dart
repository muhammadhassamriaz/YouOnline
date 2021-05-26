import 'package:youonline/route/block_users_screen.dart';
import 'package:youonline/route/change_password_screen.dart';
import 'package:youonline/route/edit_profile_screen.dart';
import 'package:youonline/route/my_information_screen.dart';
import 'package:youonline/route/notification_screen.dart';
import 'package:youonline/route/privacy_policy_screen.dart';
import 'package:youonline/route/social_account_screen.dart';
import 'package:youonline/route/verify_profile_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            HeaderTitle(title: 'Settings'),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: settingTileTitles.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("notification")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => NotificationScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("information")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MyInformationScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("profile")) {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => PrivacyPolicyScreen(),
                              //   ),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditProfileScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("verification")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VerifyProfileScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("security")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChangePasswordScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("social")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SocialAccountScreen(),
                                ),
                              );
                            } else if (settingTileTitles[index]
                                .toLowerCase()
                                .contains("block")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlockUsersScreen(),
                                ),
                              );
                            }
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 5,
                                height: SizeConfig.kDefaultSize * 13,
                              ),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 6,
                                height: SizeConfig.kDefaultSize * 6,
                                child: Image.asset(
                                  settingTileImages[index],
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 2,
                              ),
                              Text(
                                settingTileTitles[index],
                                style: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 4.2,
                                ),
                                textScaleFactor: 1,
                              ),
                              Spacer(),
                              if (showTileDownArrow[index])
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: SizeConfig.kDefaultSize * 8,
                                  color: highlightColor,
                                ),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 2,
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return EdgeInsets.all(0);
                              },
                            ),
                          ),
                        );
                      },
                    ),
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
