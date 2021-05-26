import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class StatusStoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Container(
      height: height * .26,
      width: width * .32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          width * .03,
        ),
        // border: Border.all(
        //   width: width * .002,
        //   color: Colors.grey[300],
        // ),

        image: DecorationImage(
          image: AssetImage(
            Assets.STORY_CARD_IMAGE_PLACEHOLDER,
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        
        children: [
          Spacer(),
          Container(
            width: width * .32,
            height: height * .1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12.withAlpha(10),
                  Colors.black38,
                  Colors.black45,
                  Colors.black54,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .05,
                  ),
                  child: Center(
                    child: Text(
                      'Ahmed Munir',
                      textAlign: TextAlign.center,
                      style: labelTextStyle.copyWith(
                        fontSize: width * .035,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .015,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
