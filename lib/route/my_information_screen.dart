import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/information_tile.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';

class MyInformationScreen extends StatelessWidget {
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
            HeaderTitle(title: "My Information"),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: Text(
                        'Please choose which information you would like to download.',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4.2,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Center(
                      child: Wrap(
                        spacing: SizeConfig.kDefaultSize * 5,
                        runSpacing: SizeConfig.kDefaultSize * 5,
                        children: List.generate(
                          informationTilesTitle.length,
                          (index) {
                            return InformationTile(
                              image: informationTileImages[index],
                              title: informationTilesTitle[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: 'Download Now!',
                      ),
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
