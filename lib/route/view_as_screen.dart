import 'package:youonline/component/about_section.dart';
import 'package:youonline/component/photo_section.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/home_post_card.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewAsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    Orientation orientation = MediaQuery.of(context).orientation;

    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'View As',
          style: subheadingTextStyle.copyWith(
            fontSize: width * .06,
          ),
          textScaleFactor: 1,
        ),
        leadingWidth: width * .08,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Container(
                  height: height * .35,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: height * .25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              coverPhoto,
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(
                            orientation == Orientation.portrait
                                ? width * .03
                                : width * .08,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                      Positioned(
                        bottom: 0,
                        left: orientation == Orientation.portrait
                            ? width * .26
                            : SizeConfig.kDefaultSize * 75,
                        child: Container(
                          width: width * .4,
                          height: width * .4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.PROFILE_AVATAR,
                              ),
                            ),
                            border: Border.all(
                              width: width * .015,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Zain Mehmood',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Manners maketh man',
                  //   style: hintTextStyle.copyWith(
                  //     fontSize: SizeConfig.kDefaultSize * 3.5,
                  //   ),
                  //   textScaleFactor: 1,
                  // ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Row(
                  children: [
                    Container(
                      width: width * .75,
                      height: height * .06,
                      child: YouOnlineButton(
                        callback: () {},
                        title: "Add Story",
                        textSize: width * .045,
                        color: Color(0xff99EBAD),
                        textColor: Colors.white70,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width * .14,
                      height: height * .06,
                      child: YouOnlineButton(
                        callback: () {},
                        title: "•••",
                        textSize: width * .04,
                        textColor: Colors.grey,
                        color: searchContainerColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 4,
                  ),
                  child: Row(
                    children: List.generate(
                      _widgetProvider.profileSections.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            _widgetProvider.changeProfileSelectedIndex(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    _widgetProvider.profileSectionIndex == index
                                        ? BorderRadius.circular(
                                            SizeConfig.kDefaultSize * 10,
                                          )
                                        : BorderRadius.circular(
                                            SizeConfig.kDefaultSize * 0,
                                          ),
                                color:
                                    _widgetProvider.profileSectionIndex == index
                                        ? lightGreenColor
                                        : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.kDefaultSize * 3,
                                vertical: SizeConfig.kDefaultSize * 2,
                              ),
                              child: Text(
                                _widgetProvider.profileSections[index],
                                style: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 3.5,
                                  color: _widgetProvider.profileSectionIndex ==
                                          index
                                      ? primaryColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Divider(
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              if (_widgetProvider.profileSectionIndex == 0)
                Column(
                  children: [
                    Wrap(
                      children: List.generate(2, (index) {
                        return HomePostWidget(
                          description: null,
                          imageURL: null,
                          profileAvatar: null,
                          name: "Zain Mehmood",
                          iframe: null,
                          isView: true,
                        );
                      }),
                    ),
                  ],
                ),
              if (_widgetProvider.profileSectionIndex == 1) AboutSection(),
              if (_widgetProvider.profileSectionIndex == 2)
                PhotosSection(
                  isView: true,
                )
            ],
          ),
        ),
      ),
    );
  }
}
