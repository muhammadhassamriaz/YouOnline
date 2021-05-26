import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/comment_bottom_sheet.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/post_card_menu.dart';
import 'package:youonline/widgets/share_bottom_sheet.dart';
import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.kDefaultSize * 100;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Videos',
            style: subheadingTextStyle.copyWith(
              fontSize: width * .06,
            ),
            textScaleFactor: 1,
          ),
          leadingWidth: width * .08,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              TabBar(
                indicatorColor: primaryColor,
                labelStyle: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                physics: BouncingScrollPhysics(),
                unselectedLabelStyle: labelTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.normal,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'All Videos',
                  ),
                  Tab(
                    text: 'My Videos',
                  ),
                  Tab(
                    text: 'Favourite Videos',
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomePostWidget(
                        description: "",
                        imageURL: "",
                        profileAvatar: "",
                        name: "YouOnline",
                        iframe: null,
                        likedButtonOnPressed: () {
                          Globals.likeButtonFunction(context: context);
                        },
                        shareButtonCallback: () {
                          shareBottomSheet(context);
                        },
                        moreButtonCallback: () {
                          showPostMenuBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
