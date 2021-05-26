import 'package:provider/provider.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/group_screen.dart';
import 'package:youonline/route/home_screen.dart';
import 'package:youonline/route/menu_screen.dart';
import 'package:youonline/route/search_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'create_post_screen.dart';
import 'notification_alerts_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItemPosition = 0;

  Color containerColor;
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> containerColors = [
    Color(0xFFFDE1D7),
    Color(0xFFE4EDF5),
    Color(0xFFE7EEED),
    Color(0xFFF4E4CE),
  ];

  List<Widget> widgets = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text(
          'Page yet to construct',
          textScaleFactor: 1,
        ),
      ),
    ),
    Scaffold(),
    NotificationAlertScreen(),
    MenuScreen(),
  ];
  Widget selectedWidget = Scaffold();
  initialiseData() async {
    // await Provider.of<UserProvider>(context, listen: false).getAllUserStories();
    await Provider.of<UserProvider>(context, listen: false).getUserGroups();
    // await Provider.of<UserProvider>(context, listen: false).getUserPages();
    await Provider.of<PostProvider>(context, listen: false)
        .getPostColors(context: context);
    await Provider.of<PostProvider>(context, listen: false)
        .getTrendingGIFs(context: context);
  }

  @override
  void initState() {
    super.initState();
    initialiseData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.kDefaultSize * 100;

    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _selectedItemPosition = value;
          });
        },
        children: [
          HomeScreen(),
          SearchScreen(
            isMainScreen: true,
          ),
          selectedWidget,
          GroupScreen(
            isMainScreen: true,
          ),
          MenuScreen(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: primaryColor,
        selectedItemColor: primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() {
            _selectedItemPosition = index;
            _controller.jumpToPage(
              _selectedItemPosition,
            );
          });
          if (_selectedItemPosition == 2) {
            // setState(() {
            //   Future.delayed(Duration(milliseconds: 100), () {
            // bottomModalSheet(context);
            //   });
            // });
            Provider.of<PostProvider>(context, listen: false)
                .changeFeelings(null);
            Provider.of<PostProvider>(context, listen: false)
                .changeGIFurl(null);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreatePostScreen(),
              ),
            );
            setState(() {
              _selectedItemPosition = 0;
              _controller.jumpToPage(0);
            });
          } else {
            setState(() {
              selectedWidget = widgets[_selectedItemPosition];
              print(selectedWidget);
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: width * .04,
              height: width * .04,
              child: Image.asset(
                Assets.CATEGORY_ICON,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: width * .04,
              height: width * .04,
              child: Image.asset(
                Assets.SEARCH_ICON2,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: width * .1,
              height: width * .1,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: width * .07,
                  color: Colors.white,
                ),
              ),
            ),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Stack(
          //     children: [
          //       SizedBox(
          //         width: width * .06,
          //         height: width * .06,
          //         child: Image.asset(
          //           Assets.BELL_ICON,
          //         ),
          //       ),
          //       Positioned(
          //         right: 0,
          //         child: Container(
          //           width: width * .035,
          //           height: width * .035,
          //           decoration: BoxDecoration(
          //             color: Colors.red,
          //             shape: BoxShape.circle,
          //           ),
          //           child: Center(
          //             child: Text(
          //               '9',
          //               maxLines: 1,
          //               textAlign: TextAlign.center,
          //               style: labelTextStyle.copyWith(
          //                 fontSize: width * .02,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: width * .06,
              height: width * .06,
              child: Image.asset(
                groupIcon2,
                color: hintTextColor,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: width * .04,
              height: width * .04,
              child: Image.asset(
                Assets.MENU_ICON,
              ),
            ),
            label: '',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
