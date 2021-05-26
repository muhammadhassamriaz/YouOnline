import 'dart:io';

import 'package:provider/provider.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FeelingScreen extends StatelessWidget {
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _postProvider = Provider.of<PostProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 1,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        size: SizeConfig.kDefaultSize * 7,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 5,
                    ),
                    Text(
                      'How Are You Feeling?',
                      style: subheadingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              TabBar(
                indicatorColor: primaryColor,
                labelStyle: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                physics: BouncingScrollPhysics(),
                unselectedLabelStyle: labelTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.normal,
                ),
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Feelings',
                  ),
                  Tab(
                    text: 'Activities',
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
                      Center(
                        child: Container(
                          width: width * .85,
                          height: height * .06,
                          decoration: BoxDecoration(
                            color: searchContainerColor,
                            borderRadius: BorderRadius.circular(
                              width * .03,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: width * .03,
                            ),
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaleFactor: 1,
                              ),
                              child: TextField(
                                controller: _searchTextEditingController,
                                decoration: InputDecoration(
                                  hintStyle: labelTextStyle.copyWith(
                                    fontSize: width * .035,
                                    color: hintTextColor,
                                  ),
                                  hintText: "Search",
                                  border: InputBorder.none,
                                  suffixIcon: SizedBox(
                                    child: Icon(
                                      Icons.search,
                                      color: hintTextColor,
                                    ),
                                  ),
                                  labelStyle: labelTextStyle.copyWith(
                                    fontSize: width * .035,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Center(
                        child: Wrap(
                          spacing: SizeConfig.kDefaultSize * 30,
                          runSpacing: SizeConfig.kDefaultSize * 3,
                          children: List.generate(
                            feelings.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  _postProvider.changeFeelings(feeling[index]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: width * .3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 8,
                                        height: SizeConfig.kDefaultSize * 8,
                                        child: Image.asset(
                                          feelings[index],
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.kDefaultSize * 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          feelingsText[index],
                                          style: labelTextStyle.copyWith(
                                            fontSize: width * .04,
                                            color: hintTextColor,
                                          ),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
