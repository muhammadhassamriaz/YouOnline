import 'package:flutter/material.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';

class AutomotiveCard extends StatelessWidget {
  const AutomotiveCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            spreadRadius: 3.2,
            blurRadius: 14.2,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 5,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .02,
          ),
          Container(
            height: height * .23,
            width: width,
            child: Image.asset(
              vehiclePlacholder,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
            ),
            child: Text(
              "MG 360 Used Car in Dubai",
              style: subheadingTextStyle.copyWith(
                fontSize: width * .045,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: height * .005,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  size: width * .04,
                  color: hintTextColor,
                ),
                SizedBox(
                  width: width * .01,
                ),
                Expanded(
                  child: Text(
                    "06th December, 2020",
                    style: hintTextStyle.copyWith(
                      fontSize: width * .034,
                      color: hintTextColor,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * .005,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: width * .04,
                  color: hintTextColor,
                ),
                SizedBox(
                  width: width * .01,
                ),
                Expanded(
                  child: Text(
                    "United Arab Emirates > Abu Dhabi > Abu Dhabi",
                    style: hintTextStyle.copyWith(
                      fontSize: width * .034,
                      color: hintTextColor,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
            ),
            child: Row(
              children: [
                Text(
                  "\$34125",
                  style: subheadingTextStyle.copyWith(
                    fontSize: width * .04,
                    color: primaryColor,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_outline,
                  size: width * .06,
                  color: hintTextColor,
                ),
                SizedBox(
                  width: width * .02,
                ),
                Icon(
                  Icons.flag_outlined,
                  size: width * .06,
                  color: hintTextColor,
                ),
                SizedBox(
                  width: width * .02,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              SizedBox(
                width: width * .03,
              ),
              Container(
                width: width * .2,
                child: YouOnlineButton2(
                  title: "Used",
                  callback: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
            ),
            child: Text(
              "Category:  Used Cars for Sale > MG > MG GS",
              style: hintTextStyle.copyWith(
                fontSize: width * .034,
                color: hintTextColor,
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      ),
    );
  }
}
