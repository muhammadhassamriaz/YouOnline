import 'dart:io';

import 'package:youonline/model/search.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/group_detail_screen.dart';
import 'package:youonline/route/profile_screen.dart';
import 'package:youonline/route/single_page_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  final bool isMainScreen;

  const SearchScreen({
    Key key,
    this.isMainScreen = false,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchTextEditingController = TextEditingController();

  int selectedIndex = 0;
  List<String> searchKeywords = [
    "Users",
    "Pages",
    "Groups",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Row(
                children: [
                  if (!widget.isMainScreen)
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
                  Container(
                    width: width * .8,
                    height: height * .06,
                    decoration: BoxDecoration(
                      color: searchContainerColor,
                      borderRadius: BorderRadius.circular(
                        width * .08,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * .03,
                      ),
                      child: TextField(
                        controller: _searchTextEditingController,
                        decoration: InputDecoration(
                          hintStyle: labelTextStyle.copyWith(
                            fontSize: width * .035,
                            color: hintTextColor,
                          ),
                          hintText: "Search YouOnline",
                          border: InputBorder.none,
                          suffixIcon: SizedBox(
                            child: GestureDetector(
                              onTap: () async {
                                await _userProvider.search(
                                    keyword: _searchTextEditingController.text);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.search,
                                color: hintTextColor,
                              ),
                            ),
                          ),
                          labelStyle: labelTextStyle.copyWith(
                            fontSize: width * .035,
                          ),
                        ),
                        onSubmitted: (value) async {
                          await _userProvider.search(keyword: value);
                          setState(() {});
                        },
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      searchKeywords.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: width * .02,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  width * .03,
                                ),
                                color: selectedIndex == index
                                    ? primaryColor
                                    : Colors.transparent,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * .02,
                                  vertical: width * .01,
                                ),
                                child: Text(
                                  searchKeywords[index],
                                  style: labelTextStyle.copyWith(
                                    fontSize: width * .04,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : primaryColor,
                                  ),
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
              SizedBox(
                height: height * .02,
              ),
              if (_userProvider.searchModel == null)
                Container()
              else if (_userProvider.searchModel.users == null ||
                  _userProvider.searchModel.pages == null ||
                  _userProvider.searchModel.groups == null)
                Container(
                  height: height * .5,
                  child: Center(
                    child: Text(
                      "Record Not Found",
                      style: labelTextStyle.copyWith(
                        fontSize: width * .04,
                      ),
                    ),
                  ),
                )
              else if (_userProvider.searchModel.pages != null &&
                      _userProvider.searchModel.pages.length > 0 ||
                  _userProvider.searchModel.users != null &&
                      _userProvider.searchModel.users.length > 0 ||
                  _userProvider.searchModel.groups != null &&
                      _userProvider.searchModel.groups.length > 0)
                if (selectedIndex == 0)
                  _userProvider.searchModel.users.length > 0
                      ? Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Wrap(
                              runSpacing: width * .05,
                              children: List.generate(
                                _userProvider.searchModel.users.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      BotToast.showLoading();
                                      await _userProvider.getFollowingList(
                                          userId: _userProvider
                                              .searchModel.users[index].userId
                                              .toString());
                                      await _userProvider.getFollowersList(
                                          userId: _userProvider
                                              .searchModel.users[index].userId
                                              .toString());
                                      BotToast.closeAllLoading();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ProfileScreen(
                                            userId: _userProvider
                                                .searchModel.users[index].userId
                                                .toString(),
                                            profileCover: _userProvider
                                                .searchModel.users[index].cover,
                                            fullName: _userProvider.searchModel
                                                    .users[index].firstName +
                                                " " +
                                                _userProvider.searchModel
                                                    .users[index].lastName,
                                            profileAvatar: _userProvider
                                                .searchModel
                                                .users[index]
                                                .avatar,
                                            username: _userProvider.searchModel
                                                .users[index].username,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * .12,
                                          height: width * .12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                _userProvider.searchModel
                                                    .users[index].avatar,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .03,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (_userProvider
                                                          .searchModel
                                                          .users[index]
                                                          .firstName !=
                                                      null &&
                                                  _userProvider
                                                      .searchModel
                                                      .users[index]
                                                      .firstName
                                                      .isNotEmpty &&
                                                  _userProvider
                                                          .searchModel
                                                          .users[index]
                                                          .lastName !=
                                                      null &&
                                                  _userProvider
                                                      .searchModel
                                                      .users[index]
                                                      .lastName
                                                      .isNotEmpty)
                                                Text(
                                                  _userProvider
                                                          .searchModel
                                                          .users[index]
                                                          .firstName +
                                                      " " +
                                                      _userProvider
                                                          .searchModel
                                                          .users[index]
                                                          .lastName,
                                                  maxLines: 1,
                                                  style:
                                                      labelTextStyle.copyWith(
                                                    fontSize: width * .04,
                                                  ),
                                                )
                                              else
                                                Text(
                                                  _userProvider.searchModel
                                                      .users[index].username,
                                                  maxLines: 1,
                                                  style:
                                                      labelTextStyle.copyWith(
                                                    fontSize: width * .04,
                                                  ),
                                                ),
                                              Text(
                                                _userProvider.searchModel
                                                        .users[index].about ??
                                                    "",
                                                maxLines: 1,
                                                style: labelTextStyle.copyWith(
                                                  fontSize: width * .032,
                                                  color: hintTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .01,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: width * .06,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: height * .5,
                          child: Center(
                            child: Text(
                              "Record Not Found",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                            ),
                          ),
                        )
                else if (selectedIndex == 1)
                  _userProvider.searchModel.groups.length > 0
                      ? Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Wrap(
                              runSpacing: width * .05,
                              children: List.generate(
                                _userProvider.searchModel.groups.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => GroupDetailScreen(
                                              groupTitle: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .groupTitle,
                                              groupAvatar: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .avatar,
                                              groupCoverPhoto: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .cover,
                                              groupInfo: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .about,
                                              groupId: _userProvider
                                                  .searchModel.groups[index].id,
                                            ),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * .12,
                                          height: width * .12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                _userProvider.searchModel
                                                    .groups[index].avatar,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .03,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _userProvider.searchModel
                                                    .groups[index].groupTitle,
                                                maxLines: 1,
                                                style: labelTextStyle.copyWith(
                                                  fontSize: width * .04,
                                                ),
                                              ),
                                              Text(
                                                _userProvider.searchModel
                                                        .groups[index].about ??
                                                    "",
                                                maxLines: 1,
                                                style: labelTextStyle.copyWith(
                                                  fontSize: width * .032,
                                                  color: hintTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .01,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: width * .06,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: height * .5,
                          child: Center(
                            child: Text(
                              "Record Not Found",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                            ),
                          ),
                        )
                else if (selectedIndex == 2)
                  _userProvider.searchModel.pages.length > 0
                      ? Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Wrap(
                              runSpacing: width * .05,
                              children: List.generate(
                                _userProvider.searchModel.pages.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SinglePageScreen(
                                            pageId: _userProvider
                                                .searchModel.pages[index].pageId
                                                .toString(),
                                            pageName: _userProvider.searchModel
                                                .pages[index].pageTitle,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * .12,
                                          height: width * .12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                _userProvider.searchModel
                                                    .pages[index].avatar,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .03,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _userProvider.searchModel
                                                    .pages[index].pageTitle,
                                                maxLines: 1,
                                                style: labelTextStyle.copyWith(
                                                  fontSize: width * .04,
                                                ),
                                              ),
                                              Text(
                                                _userProvider
                                                        .searchModel
                                                        .pages[index]
                                                        .pageDescription ??
                                                    "",
                                                maxLines: 1,
                                                style: labelTextStyle.copyWith(
                                                  fontSize: width * .032,
                                                  color: hintTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .01,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: width * .06,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: height * .5,
                          child: Center(
                            child: Text(
                              "Record Not Found",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                            ),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
