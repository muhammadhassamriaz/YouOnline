import 'dart:io';

import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagFriendsScreen extends StatelessWidget {
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
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
                      Platform.isIOS ? 
              Icons.arrow_back_ios :
              Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Tag Friends',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  Container(
                    width: width / 4,
                    height: height * .06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        width * .07,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: YouOnlineButton(
                      callback: () {},
                      title: "Done",
                      textSize: width * .04,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        'Suggestions',
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .05,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Wrap(
                        runSpacing: width * .03,
                        children: List.generate(
                          _dataProvider.tagFriends.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                if (_dataProvider.taggedFriends.contains(
                                    _dataProvider.tagFriends[index])) {
                                  _dataProvider.taggedFriends.remove(
                                    _dataProvider.tagFriends[index],
                                  );
                                  _dataProvider.changeSelectedFriends(
                                      _dataProvider.taggedFriends);
                                } else {
                                  _dataProvider.taggedFriends.add(
                                    _dataProvider.tagFriends[index],
                                  );
                                  _dataProvider.changeSelectedFriends(
                                      _dataProvider.taggedFriends);
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: SizeConfig.kDefaultSize * 6,
                                    height: SizeConfig.kDefaultSize * 6,
                                    child: Image.asset(
                                      _dataProvider.taggedFriends.contains(
                                              _dataProvider.tagFriends[index])
                                          ? selectedCheckboxIcon
                                          : emptyCheckboxIcon,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  Container(
                                    width: width * .12,
                                    height: width * .12,
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
                                    width: width * .03,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Zain Mehmood",
                                      style: labelTextStyle.copyWith(
                                        fontSize: width * .04,
                                        color: hintTextColor,
                                      ),
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ],
                              ),
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
