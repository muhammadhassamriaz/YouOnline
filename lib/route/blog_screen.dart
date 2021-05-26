import 'package:youonline/component/blog_card.dart';
import 'package:youonline/component/blog_header.dart';
import 'package:youonline/component/blog_tabs.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 04,
            ),
            BlogHeader(),
            SizedBox(
              height: SizeConfig.kDefaultSize * 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 04,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: 1,
                        ),
                        child: TextField(
                          controller: searchTextEditingController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.kDefaultSize * 03,
                              ),
                              child: SizedBox(
                                height: SizeConfig.kDefaultSize * 04.5,
                                width: SizeConfig.kDefaultSize * 04.5,
                                child: Image.asset(
                                  Assets.SEARCH_ICON,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            hintText: 'Search for article',
                            prefixIconConstraints: BoxConstraints.tightFor(),
                            border: InputBorder.none,
                            hintStyle: searchLabelTextStyle,
                            contentPadding: EdgeInsets.all(
                              8,
                            ),
                          ),
                          style: searchLabelTextStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 04,
            ),
            BlogTabs(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.kDefaultSize * 3,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.kDefaultSize * 02.5,
                              vertical: SizeConfig.kDefaultSize * 02,
                            ),
                            child: Text(
                              'Life Style',
                              style: labelTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 04,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 4,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 04,
                      ),
                      child: BlogCard(
                        title:
                            'Top 5 Santha Chocolate melangers for Your Perfect Kitchen Companion',
                        description:
                            'If you’re looking for a chocolate melanger for making the tastiest chocolates at home, then you’ve come to the..',
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 06,
                    ),
                    Container(
                      height: SizeConfig.kDefaultSize * 100,
                      width: double.infinity,
                      child: 
                      Stack(
                        children: [
                          Container(
                            height: SizeConfig.kDefaultSize * 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.BLOG_SLIDER_IMAGE,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.kDefaultSize * 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withAlpha(
                                          200,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          SizeConfig.kDefaultSize * 03,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.kDefaultSize * 02.5,
                                          vertical:
                                              SizeConfig.kDefaultSize * 02,
                                        ),
                                        child: Text(
                                          'Other',
                                          style: labelTextStyle.copyWith(
                                            fontSize:
                                                SizeConfig.kDefaultSize * 03,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.kDefaultSize * 04,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            width: SizeConfig.kDefaultSize * 100,
                            top: SizeConfig.kDefaultSize * 32,
                            height: SizeConfig.kDefaultSize * 64,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  8,
                                  (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.kDefaultSize * 03,
                                        right: SizeConfig.kDefaultSize * 03,
                                      ),
                                      child: Container(
                                        width: SizeConfig.kDefaultSize * 95,
                                        child: Card(
                                          elevation:
                                              SizeConfig.kDefaultSize * 02.5,
                                          shadowColor: searchContainerColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              SizeConfig.kDefaultSize * 05,
                                            ),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeConfig.kDefaultSize * 06,
                                              vertical:
                                                  SizeConfig.kDefaultSize * 6,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'The importance of reading for body and mind',
                                                  style:
                                                      labelTextStyle.copyWith(
                                                    fontSize: SizeConfig
                                                            .kDefaultSize *
                                                        5,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textScaleFactor: 1,
                                                ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.kDefaultSize *
                                                          03,
                                                ),
                                                Text(
                                                  'If you’re looking for a chocolate melanger for making the tastiest chocolates at home, then you’ve come to the..',
                                                  style:
                                                      labelTextStyle.copyWith(
                                                    fontSize: SizeConfig
                                                            .kDefaultSize *
                                                        04,
                                                    color: Colors.grey,
                                                  ),
                                                  textScaleFactor: 1,
                                                ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.kDefaultSize *
                                                          03.2,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .kDefaultSize *
                                                          04,
                                                      height: SizeConfig
                                                              .kDefaultSize *
                                                          04,
                                                      child: Image.asset(
                                                        Assets.WATCH_LATER,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .kDefaultSize *
                                                          02,
                                                    ),
                                                    Text(
                                                      '08 Dec 2020',
                                                      style: labelTextStyle
                                                          .copyWith(
                                                        fontSize: SizeConfig
                                                                .kDefaultSize *
                                                            03.5,
                                                        color: primaryColor,
                                                      ),
                                                      textScaleFactor: 1,
                                                    ),
                                                    Spacer(),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .kDefaultSize *
                                                          04,
                                                      height: SizeConfig
                                                              .kDefaultSize *
                                                          04,
                                                      child: Image.asset(
                                                        Assets.PERSON_ICON,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .kDefaultSize *
                                                          02,
                                                    ),
                                                    Text(
                                                      'By Chocolate Melangeur',
                                                      style: labelTextStyle
                                                          .copyWith(
                                                        fontSize: SizeConfig
                                                                .kDefaultSize *
                                                            03.5,
                                                        color: primaryColor,
                                                      ),
                                                      textScaleFactor: 1,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
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
