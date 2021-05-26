import 'dart:io';

import 'package:youonline/component/group_categories.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/group_detail_screen.dart';
import 'package:youonline/route/search_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/group_card.dart';
import 'package:youonline/widgets/group_tile.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'create_group_screen.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupScreen extends StatefulWidget {
  final bool isMainScreen;

  const GroupScreen({Key key, this.isMainScreen = false}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ScrollController _bouncingScrollController, _smartRefresherController;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserGroups();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;
    print(_userProvider.userGroups.groups);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
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
                    Text(
                      'Groups',
                      style: subheadingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                    ),
                    Spacer(),
                    YouOnlineIconButton(
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateGroupScreen(),
                          ),
                        );
                      },
                      icon: Icons.add,
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 3,
                    ),
                    YouOnlineIconButton(
                      callback: () {},
                      icon: Icons.settings,
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 3,
                    ),
                    YouOnlineIconButton(
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchScreen(),
                          ),
                        );
                      },
                      icon: Icons.search,
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
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
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'My Group',
                  ),
                  Tab(
                    text: 'Suggested Group',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SmartRefresher(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _refreshController,
                      scrollController: _smartRefresherController,
                      enablePullDown: true,
                      onRefresh: () async {
                        await _userProvider.getUserGroups();
                        _refreshController.refreshCompleted();
                        setState(() {});
                      },
                      enablePullUp: true,
                      footer: CustomFooter(
                        builder: (BuildContext context, LoadStatus mode) {
                          Widget body;
                          if (mode == LoadStatus.idle) {
                            body = Text(
                              "Pull Up",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                              textScaleFactor: 1,
                            );
                          } else if (mode == LoadStatus.loading) {
                            body = CircularProgressIndicator();
                          } else if (mode == LoadStatus.failed) {
                            body = Text(
                              "Load Failed!Click retry!",
                              textScaleFactor: 1,
                            );
                          } else if (mode == LoadStatus.canLoading) {
                            body = Text(
                              "Release to Load Data",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                              textScaleFactor: 1,
                            );
                          } else {
                            body = Text(
                              "No more Data",
                              textScaleFactor: 1,
                            );
                          }
                          return Container(
                            height: 55.0,
                            child: Center(child: body),
                          );
                        },
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 3,
                            ),
                            if (_userProvider.userGroups.groups != null &&
                                _userProvider.userGroups.groups.length > 0)
                              Wrap(
                                runSpacing: width * .05,
                                children: List.generate(
                                  _userProvider.userGroups.groups.length,
                                  (index) {
                                    print(_userProvider.userGroups.groups);
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: SizeConfig.kDefaultSize * 1.5,
                                        left: SizeConfig.kDefaultSize * 1.5,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => GroupDetailScreen(
                                                groupTitle: _userProvider
                                                    .userGroups
                                                    .groups[index]
                                                    .group
                                                    .groupTitle,
                                                groupInfo: _userProvider
                                                    .userGroups
                                                    .groups[index]
                                                    .group
                                                    .about,
                                                groupId: _userProvider
                                                    .userGroups
                                                    .groups[index]
                                                    .group
                                                    .id,
                                                groupAvatar: _userProvider
                                                    .userGroups
                                                    .groups[index]
                                                    .group
                                                    .avatar
                                                    .replaceAll(" ", ""),
                                                groupCoverPhoto: _userProvider
                                                    .userGroups
                                                    .groups[index]
                                                    .group
                                                    .cover
                                                    .replaceAll(" ", ""),
                                              ),
                                            ),
                                          );
                                        },
                                        child: GroupCategory(
                                          title: _userProvider.userGroups
                                              .groups[index].group.groupTitle,
                                          groupAvatar: _userProvider.userGroups
                                              .groups[index].group.avatar
                                              .replaceAll(" ", ""),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmartRefresher(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _refreshController,
                      scrollController: _smartRefresherController,
                      enablePullDown: true,
                      onRefresh: () async {
                        await _userProvider.getUserGroups();
                        _refreshController.refreshCompleted();
                        setState(() {});
                      },
                      enablePullUp: true,
                      footer: CustomFooter(
                        builder: (BuildContext context, LoadStatus mode) {
                          Widget body;
                          if (mode == LoadStatus.idle) {
                            body = Text(
                              "Pull Up",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                              textScaleFactor: 1,
                            );
                          } else if (mode == LoadStatus.loading) {
                            body = CircularProgressIndicator();
                          } else if (mode == LoadStatus.failed) {
                            body = Text(
                              "Load Failed!Click retry!",
                              textScaleFactor: 1,
                            );
                          } else if (mode == LoadStatus.canLoading) {
                            body = Text(
                              "Release to Load Data",
                              style: labelTextStyle.copyWith(
                                fontSize: width * .04,
                              ),
                              textScaleFactor: 1,
                            );
                          } else {
                            body = Text(
                              "No more Data",
                              textScaleFactor: 1,
                            );
                          }
                          return Container(
                            height: 55.0,
                            child: Center(child: body),
                          );
                        },
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_userProvider.userGroups.suggestions != null &&
                                _userProvider.userGroups.suggestions.length > 0)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.kDefaultSize * 3,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Suggested For You',
                                          style: subheadingTextStyle.copyWith(
                                            fontSize:
                                                SizeConfig.kDefaultSize * 5,
                                          ),
                                          textScaleFactor: 1,
                                        ),
                                        SizedBox(
                                          height: SizeConfig.kDefaultSize * 1,
                                        ),
                                        Text(
                                          'Groups you might be interested in',
                                          style: labelTextStyle.copyWith(
                                            fontSize:
                                                SizeConfig.kDefaultSize * 3.5,
                                          ),
                                          textScaleFactor: 1,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 5,
                            ),
                            if (_userProvider.userGroups.suggestions != null &&
                                _userProvider.userGroups.suggestions.length > 0)
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => GroupDetailScreen(
                                        groupTitle: _userProvider.userGroups
                                            .suggestions[0].group.groupTitle,
                                        groupInfo: _userProvider.userGroups
                                            .suggestions[0].group.about,
                                        groupId: _userProvider.userGroups
                                            .suggestions[0].group.groupId,
                                        groupAvatar: _userProvider.userGroups
                                            .suggestions[0].group.avatar
                                            .replaceAll(" ", ""),
                                        groupCoverPhoto: _userProvider
                                            .userGroups
                                            .suggestions[0]
                                            .group
                                            .cover
                                            .replaceAll(" ", ""),
                                      ),
                                    ),
                                  );
                                },
                                child: GroupCard(
                                  groupName: _userProvider.userGroups
                                      .suggestions[0].group.groupTitle,
                                  groupMembers: "",
                                  groupAvatar: _userProvider
                                      .userGroups.suggestions[0].group.cover
                                      .replaceAll(" ", ""),
                                  groupId: _userProvider
                                      .userGroups.suggestions[0].group.groupId,
                                  joinGroupCallback: () async {
                                    await _userProvider.joinGroup(
                                      groupName: _userProvider.userGroups
                                          .suggestions[0].group.groupTitle,
                                      groupAvatar: _userProvider.userGroups
                                          .suggestions[0].group.avatar
                                          .replaceAll(" ", ""),
                                      groupCover: _userProvider
                                          .userGroups.suggestions[0].group.cover
                                          .replaceAll(" ", ""),
                                      context: context,
                                      groupId: _userProvider
                                          .userGroups.suggestions[0].group.id
                                          .toString(),
                                      groupInfo: _userProvider.userGroups
                                          .suggestions[0].group.about,
                                    );
                                    setState(() {});
                                  },
                                ),
                              ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 5,
                            ),
                            _userProvider.userGroups.suggestions != null
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.kDefaultSize * 3,
                                    ),
                                    child: _userProvider
                                                .userGroups.suggestions.length >
                                            0
                                        ? Wrap(
                                            runSpacing:
                                                SizeConfig.kDefaultSize * 4,
                                            children: List.generate(
                                              _userProvider.userGroups
                                                  .suggestions.length,
                                              (index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            GroupDetailScreen(
                                                          groupTitle:
                                                              _userProvider
                                                                  .userGroups
                                                                  .suggestions[
                                                                      index]
                                                                  .group
                                                                  .groupTitle,
                                                          groupInfo:
                                                              _userProvider
                                                                  .userGroups
                                                                  .suggestions[
                                                                      index]
                                                                  .group
                                                                  .about,
                                                          groupId: _userProvider
                                                              .userGroups
                                                              .suggestions[
                                                                  index]
                                                              .group
                                                              .id,
                                                          groupAvatar:
                                                              _userProvider
                                                                  .userGroups
                                                                  .suggestions[
                                                                      index]
                                                                  .group
                                                                  .avatar
                                                                  .replaceAll(
                                                                      " ", ""),
                                                          groupCoverPhoto:
                                                              _userProvider
                                                                  .userGroups
                                                                  .suggestions[
                                                                      index]
                                                                  .group
                                                                  .cover
                                                                  .replaceAll(
                                                                      " ", ""),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: GroupTile(
                                                    groupTitle: _userProvider
                                                        .userGroups
                                                        .suggestions[index]
                                                        .group
                                                        .groupTitle,
                                                    groupId: _userProvider
                                                        .userGroups
                                                        .suggestions[index]
                                                        .id,
                                                    groupAvatar: _userProvider
                                                        .userGroups
                                                        .suggestions[index]
                                                        .group
                                                        .avatar
                                                        .replaceAll(" ", ""),
                                                    joinGroupFunction:
                                                        () async {
                                                      await _userProvider
                                                          .joinGroup(
                                                        groupName: _userProvider
                                                            .userGroups
                                                            .suggestions[index]
                                                            .group
                                                            .groupTitle,
                                                        groupAvatar:
                                                            _userProvider
                                                                .userGroups
                                                                .suggestions[
                                                                    index]
                                                                .group
                                                                .avatar
                                                                .replaceAll(
                                                                    " ", ""),
                                                        groupCover:
                                                            _userProvider
                                                                .userGroups
                                                                .suggestions[
                                                                    index]
                                                                .group
                                                                .cover
                                                                .replaceAll(
                                                                    " ", ""),
                                                        context: context,
                                                        groupId: _userProvider
                                                            .userGroups
                                                            .suggestions[index]
                                                            .group
                                                            .id
                                                            .toString(),
                                                        groupInfo: _userProvider
                                                            .userGroups
                                                            .suggestions[index]
                                                            .group
                                                            .about,
                                                      );
                                                      setState(() {});
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Text(
                                            "No Suggested Group Available",
                                            style: labelTextStyle.copyWith(
                                              fontSize: width * .04,
                                            ),
                                          ),
                                  )
                                : Text(
                                    "No Suggested Group Available",
                                    style: labelTextStyle.copyWith(
                                      fontSize: width * .04,
                                    ),
                                  ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 5,
                            ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 10,
                            ),
                          ],
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
