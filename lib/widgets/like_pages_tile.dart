import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class LikedPageTile extends StatelessWidget {
  const LikedPageTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Container(
      width: width * .9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            width * .05,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1.0,
              blurRadius: 17.0,
            ),
          ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
          vertical: height * .03,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .18,
              height: width * .18,
              child: Image.asset(
                pageCover,
              ),
            ),
            SizedBox(
              width: width * .02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Aaj News',
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .04,
                        ),
                        textScaleFactor: 1,
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_vert,
                        size: width * .05,
                        color: hintTextColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .003,
                  ),
                  Text(
                    'TV channel',
                    style: labelTextStyle.copyWith(
                      fontSize: width * .035,
                      color: hintTextColor,
                    ),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * .2,
                        height: SizeConfig.kDefaultSize * 9,
                        child: TextButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: primaryColor,
                                size: width * .045,
                              ),
                              SizedBox(
                                width: width * .003,
                              ),
                              Text(
                                "Liked",
                                style: labelTextStyle.copyWith(
                                  color: primaryColor,
                                  fontSize: SizeConfig.kDefaultSize * 3.6,
                                ),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 1,
                                  ),
                                );
                              },
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => lightGreenColor,
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black26,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: width * .03,
                      ),
                      Container(
                        width: width * .3,
                        height: SizeConfig.kDefaultSize * 9,
                        child: TextButton(
                          child: Text(
                            "See 1 Change",
                            style: labelTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: SizeConfig.kDefaultSize * 3.6,
                            ),
                            textScaleFactor: 1,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 1,
                                  ),
                                );
                              },
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => searchContainerColor,
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black26,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
