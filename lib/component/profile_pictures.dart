import 'package:youonline/route/create_group_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfilePictures extends StatelessWidget {
  const ProfilePictures({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.kDefaultSize * 24,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          // Text(
          //   "Coming Soon",
          //   style: labelTextStyle.copyWith(
          //     fontSize: SizeConfig.kDefaultSize * 3,
          //   ),
          // ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.kDefaultSize * 03,
                ),
                Container(
                  height: SizeConfig.kDefaultSize * 14,
                  width: SizeConfig.kDefaultSize * 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.kDefaultSize * 08,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 04,
                        ),
                        SizedBox(
                          height: SizeConfig.kDefaultSize * 05.5,
                          width: SizeConfig.kDefaultSize * 05.5,
                          child: Image.asset(
                            Assets.CATEGORY_ICON,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 02,
                        ),
                        // Flexible(
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (_) => CreateGroupScreen(),
                        //         ),
                        //       );
                        //     },
                        //     child: Text(
                        //       'Create Group',
                        //       style: labelTextStyle.copyWith(
                        //         fontSize: SizeConfig.kDefaultSize * 03.8,
                        //         color: primaryColor,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //       textScaleFactor: 1,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 03,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.kDefaultSize * 03,
                        ),
                        child: Container(
                          width: SizeConfig.kDefaultSize * 15,
                          height: SizeConfig.kDefaultSize * 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.PROFILE_AVATAR_3,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
