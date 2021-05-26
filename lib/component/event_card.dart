import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.kDefaultSize * 68,
      width: SizeConfig.kDefaultSize * 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 5,
        ),
        border: Border.all(
          color: Colors.grey[300],
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.kDefaultSize * 40,
            width: SizeConfig.kDefaultSize * 80,
            child: Image.asset(
              eventCover2,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: SizeConfig.kDefaultSize * 4,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.kDefaultSize * 3,
            ),
            child: Text(
              'Special Offer Buy Here',
              style: subheadingTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 5,
              ),
              textScaleFactor: 1,
            ),
          ),
          SizedBox(
            height: SizeConfig.kDefaultSize * 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.kDefaultSize * 3,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.kDefaultSize * 4,
                  height: SizeConfig.kDefaultSize * 4,
                  child: Image.asset(
                    locationIcon2,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 2,
                ),
                Text(
                  'New York, America',
                  style: hintTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 3.5,
                  ),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.kDefaultSize * 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.kDefaultSize * 3,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.kDefaultSize * 4,
                  height: SizeConfig.kDefaultSize * 4,
                  child: Image.asset(
                    calenderIcon2,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 2,
                ),
                Text(
                  '1-02-2021',
                  style: hintTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 3.5,
                  ),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
