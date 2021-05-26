import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/notification_bottom_sheet.dart';
import 'package:flutter/material.dart';

class NotificationAlertWidget extends StatelessWidget {
  const NotificationAlertWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.kDefaultSize * 17,
          height: SizeConfig.kDefaultSize * 17,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                Assets.PROFILE_AVATAR,
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 2,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textScaleFactor: 1,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Linh Nguyen ',
                      style: labelTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'posted in ',
                      style: labelTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 3.5,
                      ),
                    ),
                    TextSpan(
                      text: 'UI & UX Designers ',
                      style: labelTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 4,
                    height: SizeConfig.kDefaultSize * 4,
                    child: Image.asset(
                      profileIcon,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 1,
                  ),
                  Text(
                    'a few seconds ago',
                    style: hintTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 3,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 2,
        ),
        GestureDetector(
          onTap: () {
            notificationBottomSheet(context);
          },
          child: SizedBox(
            width: SizeConfig.kDefaultSize * 04,
            height: SizeConfig.kDefaultSize * 04,
            child: Image.asset(
              Assets.OPTION_ICON,
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 2,
        ),
      ],
    );
  }
}
