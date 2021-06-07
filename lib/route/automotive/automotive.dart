import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/automotive_header.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/automotive_card.dart';
import 'package:youonline/widgets/you_online_button.dart';

class AutomotiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              AutomotiveHeader(),
              SizedBox(
                height: height * .02,
              ),
              Row(
                children: [
                  Text(
                    "285 All",
                    style: subheadingTextStyle.copyWith(
                      fontSize: width * .035,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: width * .2,
                    height: height * .04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        width * .06,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: YouOnlineButton(
                      callback: () {},
                      title: "Filters",
                      textStyle: labelTextStyle.copyWith(
                        fontSize: width * .035,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutomotiveCard(),
                      SizedBox(
                        height: height * .03,
                      ),
                      AutomotiveCard(),
                      SizedBox(
                        height: height * .03,
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
