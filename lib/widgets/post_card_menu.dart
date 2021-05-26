import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/menu_tile.dart';
import 'package:flutter/material.dart';

showPostMenuBottomSheet(
  BuildContext context, {
  @required String postID,
  @required TimelineData timelineData,
}) {
  SizeConfig().init(context);
  double height = SizeConfig.kDefaultSize * 100 * 2;
  double width = SizeConfig.kDefaultSize * 100;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.kDefaultSize * 4),
        topRight: Radius.circular(SizeConfig.kDefaultSize * 4),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height * .02,
          ),
          Center(
            child: Container(
              height: height * .006,
              width: width * .2,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  width * .03,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          InkWell(
            onTap: () {
              Provider.of<PostProvider>(context, listen: false)
                  .savePost(postID: postID, context: context);
              BotToast.showText(
                text: "This post has been saved",
                textStyle: labelTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
                contentColor: Colors.white,
              );
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: savePostIcon2,
                title: "Save Post",
                subtitle: "Add this to your saved items.",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: favouriteIcon2,
          //       title: "Add John Kriston to  Favorites",
          //       subtitle: "Prioritize his posts in News Feed",
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          InkWell(
            onTap: () {
              print(timelineData);
              Provider.of<PostProvider>(context, listen: false).hidePost(
                postID: postID,
                context: context,
                timelineData: timelineData,
              );
              BotToast.showText(
                text: "This post has been hidden from timeline.",
                textStyle: labelTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
                contentColor: Colors.white,
              );
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: hidePost,
                title: "Hide Post",
                subtitle: "See fewer posts like this.",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: snoozeIcon,
          //       title: "Snooze Sam Dave for 30 days",
          //       subtitle: "Temporarily stop seeing posts.",
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: hideAllIcon,
          //       title: "Hide all from Zain Mehmood",
          //       subtitle: "Stop seeing posts from this person.",
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          // Container(
          //   height: height * .01,
          //   width: double.infinity,
          //   color: Colors.grey[300],
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: warningIcon,
          //       title: "Why am I seeing this post?",
          //       subtitle: null,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          InkWell(
            onTap: () {
              Provider.of<PostProvider>(context, listen: false)
                  .reportPost(postID: postID, context: context);
              BotToast.showText(
                text: "This post has been report as spam.",
                textStyle: labelTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
                contentColor: Colors.white,
              );
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .06,
              ),
              child: MenuTile(
                imageURL: supportIcon,
                title: "Find Support or report post",
                subtitle: "I’m concerned about this post.",
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: notificationIcon2,
          //       title: "Turn on notifications for this post",
          //       subtitle: null,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: width * .06,
          //     ),
          //     child: MenuTile(
          //       imageURL: copyLinkIcon,
          //       title: "Copy link",
          //       subtitle: null,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: height * .02,
          // ),
        ],
      );
    },
  );
}
