import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
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
                  horizontal: SizeConfig.kDefaultSize * 1,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Platform.isIOS ? 
              Icons.arrow_back_ios :
              Icons.arrow_back,
                        size: SizeConfig.kDefaultSize * 7,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                    Text(
                      'Add Location',
                      style: subheadingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                    ),
                    Spacer(),
                    Container(
                      width: SizeConfig.kDefaultSize * 10,
                      height: SizeConfig.kDefaultSize * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.resolveWith<EdgeInsets>(
                                    (Set<MaterialState> states) {
                              return EdgeInsets.all(0);
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.black26;
                                return primaryColor;
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>(
                              (Set<MaterialState> states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 3,
                                  ),
                                );
                              },
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.send,
                              size: SizeConfig.kDefaultSize * 4.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * .85,
                      height: height * .06,
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        borderRadius: BorderRadius.circular(
                          width * .03,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * .03,
                        ),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1,
                          ),
                          child: TextField(
                            controller: _searchTextEditingController,
                            decoration: InputDecoration(
                              hintStyle: labelTextStyle.copyWith(
                                fontSize: width * .035,
                                color: hintTextColor,
                              ),
                              hintText: "Search",
                              border: InputBorder.none,
                              suffixIcon: SizedBox(
                                child: Icon(
                                  Icons.search,
                                  color: hintTextColor,
                                ),
                              ),
                              labelStyle: labelTextStyle.copyWith(
                                fontSize: width * .035,
                              ),
                            ),
                          ),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                      width: width * .85,
                      height: height * .3,
                      decoration: BoxDecoration(
                        color: searchContainerColor,
                        borderRadius: BorderRadius.circular(
                          width * .06,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .05,
                          ),
                          SizedBox(
                            width: width * .24,
                            height: width * .24,
                            child: Image.asset(
                              pinIcon,
                            ),
                          ),
                          SizedBox(
                            height: height * .005,
                          ),
                          Text(
                            'Add Location',
                            style: labelTextStyle.copyWith(
                              fontSize: width * .035,
                              color: hintTextColor,
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Text(
                  'Recent Places',
                  style: subheadingTextStyle.copyWith(
                    fontSize: width * .05,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Text(
                  'Howdy MM Rooftop',
                  style: subheadingTextStyle.copyWith(
                    fontSize: width * .035,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: width * .06,
                      color: hintTextColor,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Text(
                  'Fri Chick Fortress Stadium',
                  style: subheadingTextStyle.copyWith(
                    fontSize: width * .035,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: width * .06,
                      color: hintTextColor,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Text(
                  'Fri Chick Fortress Stadium',
                  style: subheadingTextStyle.copyWith(
                    fontSize: width * .035,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .06,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          color: hintTextColor,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: width * .06,
                      color: hintTextColor,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
