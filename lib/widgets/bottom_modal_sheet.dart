import 'package:youonline/route/create_page_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

bottomModalSheet(BuildContext context) {
  SizeConfig().init(context);
  double height = SizeConfig.kDefaultSize * 100 * 2;
  double width = SizeConfig.kDefaultSize * 100;
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(width * .05),
        topRight: Radius.circular(width * .05),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * .03,
            ),
            Row(
              children: [
                Text(
                  'Create',
                  style: headingTextStyle.copyWith(
                    fontSize: width * .06,
                  ),
                  textScaleFactor: 1,
                ),
                Spacer(),
                Container(
                  width: width * .12,
                  height: width * .12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: searchContainerColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Center(
                      child: Icon(
                        Icons.clear,
                        size: width * .05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (_) => BlogScreen(),
                //       ),
                //     );
                //   },
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: width * .15,
                //         width: width * .15,
                //         child: Image.asset(
                //           Assets.BLOG_ICON,
                //         ),
                //       ),
                //       SizedBox(
                //         height: height * .01,
                //       ),
                //       Text(
                //         'Blog',
                //         style: hintTextStyle.copyWith(
                //           fontSize: width * .04,
                //           color: Colors.grey,
                //         ),
                //         textScaleFactor: 1,
                //       )
                //     ],
                //   ),
                // ),
                Column(
                  children: [
                    SizedBox(
                      height: width * .15,
                      width: width * .15,
                      child: Image.asset(
                        Assets.EVENT_ICON,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      'Event',
                      style: hintTextStyle.copyWith(
                        fontSize: width * .04,
                        color: Colors.grey,
                      ),
                      textScaleFactor: 1,
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: width * .15,
                      width: width * .15,
                      child: Image.asset(
                        Assets.GROUP_ICON,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      'Group',
                      style: hintTextStyle.copyWith(
                        fontSize: width * .04,
                        color: Colors.grey,
                      ),
                      textScaleFactor: 1,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreatePageScreen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: width * .15,
                        width: width * .15,
                        child: Image.asset(
                          Assets.PAGE_ICON,
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        'Page',
                        style: hintTextStyle.copyWith(
                          fontSize: width * .04,
                          color: Colors.grey,
                        ),
                        textScaleFactor: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      );
    },
  );
}
