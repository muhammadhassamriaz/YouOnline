import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';

class AutomotiveDetailScreen extends StatefulWidget {
  @override
  _AutomotiveDetailScreenState createState() => _AutomotiveDetailScreenState();
}

class _AutomotiveDetailScreenState extends State<AutomotiveDetailScreen> {
  List<String> vehicles = [
    vehiclePlacholder,
    vehiclePlacholder1,
    vehiclePlacholder2,
    vehiclePlacholder3,
  ];

  int selectedVehicle = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.kDefaultSize * 0.5),
                  child: SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                    height: SizeConfig.kDefaultSize * 5,
                    child: Platform.isAndroid
                        ? Image.asset(
                            Assets.BACK_ARROW_ICON,
                          )
                        : Icon(
                            Icons.arrow_back_ios,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          fontSize: width * .06,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Text(
                        "Category:  Used Cars for Sale > MG > MG GS",
                        style: hintTextStyle.copyWith(
                          fontSize: width * .030,
                          color: hintTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Container(
                        height: height * .23,
                        width: width,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            width * .05,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              vehicles[selectedVehicle],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(
                            4,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: width * .02,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedVehicle = index;
                                    });
                                  },
                                  child: Container(
                                    height: width * .2,
                                    width: width * .3,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        width * .02,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          vehicles[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * .03,
                        ),
                        Container(
                          width: width * .2,
                          height: height * .045,
                          child: YouOnlineButton2(
                            title: "Used",
                            callback: () {},
                            buttonColor: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Container(
                      height: height * .01,
                      width: width,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Text(
                        "Automotive Seller",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "YouOnline",
                            style: subheadingTextStyle.copyWith(
                              fontSize: width * .035,
                            ),
                          ),
                          Text(
                            "Verified",
                            style: subheadingTextStyle.copyWith(
                              fontSize: width * .035,
                            ),
                          ),
                          SizedBox()
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
                      child: Text(
                        "1 classifieds live\nJoined Since 9/2020",
                        style: hintTextStyle.copyWith(
                          fontSize: width * .03,
                          color: hintTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Text(
                        "Details",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Type:",
                            style: hintTextStyle.copyWith(
                              fontSize: width * .03,
                              color: hintTextColor,
                            ),
                          ),
                          SizedBox(
                            width: width * .3,
                          ),
                          Text(
                            "Used",
                            style: labelTextStyle.copyWith(
                              fontSize: width * .03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Quantity Of Products:",
                            style: hintTextStyle.copyWith(
                              fontSize: width * .03,
                              color: hintTextColor,
                            ),
                          ),
                          SizedBox(
                            width: width * .07,
                          ),
                          Text(
                            "3",
                            style: labelTextStyle.copyWith(
                              fontSize: width * .03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Location:",
                            style: hintTextStyle.copyWith(
                              fontSize: width * .03,
                              color: hintTextColor,
                            ),
                          ),
                          SizedBox(
                            width: width * .25,
                          ),
                          Flexible(
                            child: Text(
                              "Sheikh Zayed Road, Dubai, U.A.E",
                              maxLines: 1,
                              style: labelTextStyle.copyWith(
                                fontSize: width * .03,
                                fontWeight: FontWeight.bold,
                              ),
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
                      child: Text(
                        "MG 360. The new MG 360 is as striking and sleek as they come. Generously equipped and powered by a 1.5 litre engine, this stylish model has been developed to turn heads and deliver great performance. Not only does it achieve these goals, but it surpasses them.",
                        style: hintTextStyle.copyWith(
                          fontSize: width * .03,
                          color: hintTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: "Chat with Seller",
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: "(+971) 45094099",
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: "info@advantagemotor.ae",
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      child: Divider(
                        thickness: 1,
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
                        "Location",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
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
                      child: Container(
                        height: height * .23,
                        width: width,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            width * .05,
                          ),
                          border: Border.all(
                            width: 1,
                            color: hintTextColor,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              mapPlaceholder,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Large Map",
                          style: labelTextStyle.copyWith(
                            fontSize: width * .04,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
