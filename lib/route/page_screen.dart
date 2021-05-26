import 'package:youonline/model/all_pages.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/create_page_screen.dart';
import 'package:youonline/route/liked_pages_screen.dart';
import 'package:youonline/route/single_page_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/page_create_button.dart';
import 'package:youonline/widgets/users_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageScreen extends StatefulWidget {
  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ScrollController _bouncingScrollController, _smartRefresherController;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _userProvider = Provider.of<UserProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Pages',
            style: subheadingTextStyle.copyWith(
              fontSize: width * .06,
            ),
            textScaleFactor: 1,
          ),
          leadingWidth: width * .08,
          actions: [
            // PageCreateButton(),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 0,
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
                    text: 'My Page',
                  ),
                  Tab(
                    text: 'Suggested Page',
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 4,
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
                        await _userProvider.getUserPages();
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
                            if (_userProvider.allPages.pages != null &&
                                _userProvider.allPages.pages.length > 0)
                              Wrap(
                                runSpacing: height * .02,
                                children: List.generate(
                                  _userProvider.allPages.pages.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SinglePageScreen(
                                              pageId: _userProvider.allPages
                                                  .pages[index].page.pageId
                                                  .toString(),
                                              pageName: _userProvider.allPages
                                                  .pages[index].page.pageTitle,
                                            ),
                                          ),
                                        );
                                      },
                                      child: UserPage(
                                        pageName: _userProvider.allPages
                                            .pages[index].page.pageTitle,
                                        imageURL: _userProvider
                                            .allPages.pages[index].page.avatar,
                                        pageInfo: _userProvider.allPages
                                            .pages[index].page.pageDescription,
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
                        await _userProvider.getUserPages();
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
                            if (_userProvider.allPages.suggestions != null &&
                                _userProvider.allPages.suggestions.length > 0)
                              Wrap(
                                runSpacing: height * .02,
                                children: List.generate(
                                  _userProvider.allPages.suggestions.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SinglePageScreen(
                                              pageId: _userProvider
                                                  .allPages
                                                  .suggestions[index]
                                                  .page
                                                  .pageId
                                                  .toString(),
                                              pageName: _userProvider
                                                  .allPages
                                                  .suggestions[index]
                                                  .page
                                                  .pageTitle,
                                            ),
                                          ),
                                        );
                                      },
                                      child: UserPage(
                                        pageName: _userProvider.allPages
                                            .suggestions[index].page.pageTitle,
                                        imageURL: _userProvider.allPages
                                            .suggestions[index].page.avatar,
                                        isFolloWidget: true,
                                        pageInfo: _userProvider
                                            .allPages
                                            .suggestions[index]
                                            .page
                                            .pageDescription,
                                        callback: () {
                                          _userProvider.followPage(
                                            context,
                                            pageId: _userProvider.allPages
                                                .suggestions[index].page.pageId
                                                .toString(),
                                            pageName: _userProvider
                                                .allPages
                                                .suggestions[index]
                                                .page
                                                .pageName,
                                          );
                                        },
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
