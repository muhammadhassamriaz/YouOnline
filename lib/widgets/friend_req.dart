import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class FriendRequestTile extends StatelessWidget {
  const FriendRequestTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 4,
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.kDefaultSize * 19,
            height: SizeConfig.kDefaultSize * 19,
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
            width: SizeConfig.kDefaultSize * 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YouOnline',
                style: subheadingTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
              Text(
                '2 mutual friends',
                style: hintTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 3,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 1,
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.kDefaultSize * 28,
                    height: SizeConfig.kDefaultSize * 9,
                    child:
                        // YouOnlineButton(
                        //   callback: () {},
                        //   title: "Confirm",
                        //   textSize: SizeConfig.kDefaultSize * 4,
                        // ),
                        TextButton(
                      child: Text(
                        "Confirm",
                        style: labelTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: SizeConfig.kDefaultSize * 3.2,
                        ),
                        textScaleFactor: 1,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith(
                          (states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.kDefaultSize * 3,
                              ),
                            );
                          },
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => primaryColor,
                        ),
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Color(0xffADF0BE),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 3,
                  ),
                  Container(
                    width: SizeConfig.kDefaultSize * 28,
                    height: SizeConfig.kDefaultSize * 9,
                    child: Container(
                      width: SizeConfig.kDefaultSize * 28,
                      height: SizeConfig.kDefaultSize * 9,
                      child: TextButton(
                        child: Text(
                          "Delete",
                          style: labelTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: SizeConfig.kDefaultSize * 3.2,
                          ),
                          textScaleFactor: 1,
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.kDefaultSize * 3,
                                ),
                              );
                            },
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => searchContainerColor,
                          ),
                          // overlayColor: MaterialStateProperty.resolveWith(
                          //   (states) => Color(0xffADF0BE),
                          // ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
