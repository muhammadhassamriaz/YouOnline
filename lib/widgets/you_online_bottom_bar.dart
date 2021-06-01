// import 'package:youonline/utils/assets.dart';
// import 'package:youonline/utils/color.dart';
// import 'package:youonline/utils/size_config.dart';
// import 'package:flutter/material.dart';

// class YouOnlineBottomBar extends StatefulWidget {
//   @override
//   _YouOnlineBottomBarState createState() => _YouOnlineBottomBarState();
// }

// class _YouOnlineBottomBarState extends State<YouOnlineBottomBar> {
//   int _selectedItemPosition = 2;

//   Color containerColor;

//   List<Color> containerColors = [
//     const Color(0xFFFDE1D7),
//     const Color(0xFFE4EDF5),
//     const Color(0xFFE7EEED),
//     const Color(0xFFF4E4CE),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double width = SizeConfig.kDefaultSize * 100;
//     return SnakeNavigationBar.color(
//       behaviour: SnakeBarBehaviour.pinned,
//       snakeShape: SnakeShape.indicator,
//       snakeViewColor: primaryColor,
//       selectedItemColor: primaryColor,
//       showUnselectedLabels: false,
//       showSelectedLabels: false,
//       currentIndex: _selectedItemPosition,
//       onTap: (index) => setState(() => _selectedItemPosition = index),
//       items: [
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: width * .04,
//             height: width * .04,
//             child: Image.asset(
//               Assets.CATEGORY_ICON,
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: width * .04,
//             height: width * .04,
//             child: Image.asset(
//               Assets.SEARCH_ICON2,
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: width * .05,
//             height: width * .05,
//             child: Image.asset(
//               Assets.MESSAGE_ICON,
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Stack(
//             children: [
//               SizedBox(
//                 width: width * .06,
//                 height: width * .06,
//                 child: Image.asset(
//                   Assets.BELL_ICON,
//                 ),
//               ),
              
//             ],
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: width * .04,
//             height: width * .04,
//             child: Image.asset(
//               Assets.MENU_ICON,
//             ),
//           ),
//           label: '',
//         ),
//       ],
//       selectedLabelStyle: const TextStyle(fontSize: 14),
//       unselectedLabelStyle: const TextStyle(fontSize: 10),
//     );
//   }
// }
