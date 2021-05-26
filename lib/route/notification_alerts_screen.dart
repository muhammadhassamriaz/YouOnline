import 'package:youonline/route/search_screen.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/notification_tile.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';
import 'package:flutter/material.dart';

class NotificationAlertScreen extends StatelessWidget {
  const NotificationAlertScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 4,
              ),
              child: Row(
                children: [
                  Text(
                    "Notifications",
                    style: headingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                textScaleFactor: 1,
                  ),
                  Spacer(),
                  YouOnlineIconButton(
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchScreen(),
                          ),
                        );
                    },
                    icon: Icons.search,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 4,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: SizeConfig.kDefaultSize * 6,
                        children: List.generate(
                          9,
                          (index) {
                            return NotificationAlertWidget();
                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 10,
                          vertical: SizeConfig.kDefaultSize * 2,
                        ),
                        child: 
                        YouOnlineButton2(
                          callback: () {
                            
                          },
                          title: 'See all',
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
