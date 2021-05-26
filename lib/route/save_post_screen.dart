import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/save_post.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';

class SavedPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Saved Posts',
          style: subheadingTextStyle.copyWith(
            fontSize: width * .06,
          ),
          textScaleFactor: 1,
        ),
        leadingWidth: width * .08,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Container(
                width: double.infinity,
                height: height * .23,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    width * .04,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: EdgeInsets.all(
                    width * .03,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * .01,
                      ),
                      Row(
                        children: [
                          Text(
                            'Find saved videos quickly',
                            style: subheadingTextStyle.copyWith(
                              fontSize: width * .045,
                            ),
                            textScaleFactor: 1,
                          ),
                          Spacer(),
                          YouOnlineIconButton(
                            callback: () {},
                            icon: Icons.clear,
                            color: Colors.grey[300],
                            iconSize: width * .045,
                          ),
                        ],
                      ),
                      Text(
                        'Access videos you’ve saved directly from Facebook Watch.',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .038,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        height: height * .06,
                        child: YouOnlineButton(
                          callback: () {},
                          title: "Try it",
                          textSize: width * .045,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Text(
                'Most Recent',
                style: subheadingTextStyle.copyWith(
                  fontSize: width * .045,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: height * .02,
              ),
              Wrap(
                runSpacing: height * .02,
                children: List.generate(
                  4,
                  (index) {
                    return SavePostTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
