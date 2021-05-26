import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/group_bottom_sheet_icon.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

groupBottomSheet(
  BuildContext context, {
  @required String groupId,
}) {
  SizeConfig().init(context);
  double height = SizeConfig.kDefaultSize * 100 * 2;
  double width = SizeConfig.kDefaultSize * 100;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.kDefaultSize * 4),
        topRight: Radius.circular(SizeConfig.kDefaultSize * 4),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.kDefaultSize * 4,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: width * .05,
                ),
                Text(
                  'Tools',
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1,
                ),
                Spacer(),
                YouOnlineIconButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.clear,
                ),
              ],
            ),
          ),
          Divider(
            thickness: width * .003,
          ),
          SizedBox(
            height: height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GroupBottomSheetIconButton(
                imageURL: groupFollowing,
                title: "Following",
              ),
              GroupBottomSheetIconButton(
                imageURL: pinGroup,
                title: "Pin Group",
              ),
              GroupBottomSheetIconButton(
                imageURL: Assets.SHARE_ICON,
                title: "Share",
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GroupBottomSheetIconButton(
                imageURL: notificationIcon2,
                title: "Notification",
                color: Colors.black,
              ),
              GroupBottomSheetIconButton(
                imageURL: reportGroup,
                title: "Report Group",
              ),
              GroupBottomSheetIconButton(
                imageURL: leaveGroup,
                title: "Leave",
                callback: () async {
                  BotToast.showLoading();
                  await Provider.of<UserProvider>(context, listen: false)
                      .unjoinGroup(groupId: groupId);
                  await Provider.of<UserProvider>(context, listen: false)
                      .getUserGroups();
                  BotToast.closeAllLoading();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      );
    },
  );
}
