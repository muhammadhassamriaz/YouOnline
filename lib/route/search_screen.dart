import 'dart:io';

import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/group_detail_screen.dart';
import 'package:youonline/route/profile_screen.dart';
import 'package:youonline/route/single_page_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:youonline/widgets/search_widget.dart';

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

    var _userProvider = Provider.of<UserProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Row(
                children: [
                  if (!widget.isMainScreen)
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
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
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        borderRadius: BorderRadius.circular(
                          width * .08,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .03,
                        ),
                        child: TextField(
                          maxLines: 1,
                          controller: _searchTextEditingController,
                          decoration: InputDecoration(
                            hintStyle: labelTextStyle.copyWith(
                              fontSize: width * .035,
                              color: hintTextColor,
                            ),
                            hintText: "Search Users, Groups, Pages...",
                            border: InputBorder.none,
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
                  ),
                  SizedBox(
                    width: width * .01,
                  ),
                  Icon(
                    Icons.search,
                    size: width * .07,
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                ],
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
                tabs: List.generate(
                  searchKeywords.length,
                  (index) {
                    return Tab(
                      text: searchKeywords[index],
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Divider(
                thickness: 5,
                height: 0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
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
                      _userProvider.searchModel.users.length > 0
                          ? SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Wrap(
                                children: List.generate(
                                  _userProvider.searchModel.users.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        BotToast.showLoading();
                                        BotToast.showLoading();
                                        await _userProvider
                                            .getTimelineUserProfile(
                                          userId: _userProvider
                                              .searchModel.users[index].userId
                                              .toString(),
                                        );

                                        BotToast.closeAllLoading();
                                        BotToast.closeAllLoading();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ProfileScreen(
                                              userId: _userProvider.searchModel
                                                  .users[index].userId
                                                  .toString(),
                                              profileCover: _userProvider
                                                  .searchModel
                                                  .users[index]
                                                  .cover,
                                              fullName: _userProvider
                                                      .searchModel
                                                      .users[index]
                                                      .firstName +
                                                  " " +
                                                  _userProvider.searchModel
                                                      .users[index].lastName,
                                              profileAvatar: _userProvider
                                                  .searchModel
                                                  .users[index]
                                                  .avatar,
                                              username: _userProvider
                                                  .searchModel
                                                  .users[index]
                                                  .username,
                                            ),
                                          ),
                                        );
                                      },
                                      child: SearchWidget(
                                        imageUrl: _userProvider
                                            .searchModel.users[index].avatar,
                                        title: _userProvider
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
                                                    .isNotEmpty
                                            ? _userProvider.searchModel
                                                    .users[index].firstName +
                                                " " +
                                                _userProvider.searchModel
                                                    .users[index].lastName
                                            : _userProvider.searchModel
                                                .users[index].username,
                                        subTitle: _userProvider.searchModel
                                                .users[index].about ??
                                            "",
                                      ),
                                    );
                                  },
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
                      _userProvider.searchModel.users.length > 0
                          ? SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Wrap(
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
                                                  .avatar
                                                  .replaceAll(" ", "")
                                                  .replaceAll("%20", ""),
                                              groupCoverPhoto: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .cover
                                                  .replaceAll(" ", "")
                                                  .replaceAll("%20", ""),
                                              groupInfo: _userProvider
                                                  .searchModel
                                                  .groups[index]
                                                  .about,
                                              groupId: _userProvider
                                                  .searchModel.groups[index].id,
                                            ),
                                          ),
                                        );
                                      },
                                      child: SearchWidget(
                                          imageUrl: _userProvider
                                              .searchModel.groups[index].avatar
                                              .replaceAll(" ", "")
                                              .replaceAll("%20", ""),
                                          title: _userProvider.searchModel
                                              .groups[index].groupTitle,
                                          subTitle: _userProvider.searchModel
                                                  .groups[index].about ??
                                              ""),
                                    );
                                  },
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
                      _userProvider.searchModel.pages.length > 0
                          ? SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Wrap(
                                children: List.generate(
                                  _userProvider.searchModel.pages.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SinglePageScreen(
                                              pageId: _userProvider.searchModel
                                                  .pages[index].pageId
                                                  .toString(),
                                              pageName: _userProvider
                                                  .searchModel
                                                  .pages[index]
                                                  .pageTitle,
                                            ),
                                          ),
                                        );
                                      },
                                      child: SearchWidget(
                                        imageUrl: _userProvider
                                            .searchModel.pages[index].avatar
                                            .replaceAll(" ", "")
                                            .replaceAll("%20", ""),
                                        title: _userProvider.searchModel
                                            .groups[index].groupTitle,
                                        subTitle: _userProvider.searchModel
                                                .pages[index].pageDescription ??
                                            "",
                                      ),
                                    );
                                  },
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
                            ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
