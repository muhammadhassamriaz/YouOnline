import 'package:youonline/route/friend_widget.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:flutter/material.dart';

class BlockUsersScreen extends StatelessWidget {
  const BlockUsersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 4,
            ),
            HeaderTitle(
              title: 'Block Users',
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 5,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 2,
                      ),
                      Text(
                        'Once you block someone, that person can no longer see things you post on your timeline',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Wrap(
                        runSpacing: SizeConfig.kDefaultSize * 6,
                        children: List.generate(
                          6,
                          (index) {
                            return FriendWidget(
                              isBlocked: true,
                              callback: () {},
                            );
                          },
                        ),
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
