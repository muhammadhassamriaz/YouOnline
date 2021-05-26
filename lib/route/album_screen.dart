import 'dart:io';

import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AlbumScreen extends StatelessWidget {
  List<String> media = [
    photoPlaceholder,
    photoPlaceholder2,
    photoPlaceholder3,
    photoPlaceholder4,
    photoPlaceholder5,
    photoPlaceholder6,
    photoPlaceholder7,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
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
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Photos',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _widgetProvider.collection.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          _widgetProvider.changeCollectionIndex(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  _widgetProvider.collectionIndex == index
                                      ? BorderRadius.circular(
                                          SizeConfig.kDefaultSize * 10,
                                        )
                                      : BorderRadius.circular(
                                          SizeConfig.kDefaultSize * 0,
                                        ),
                              color: _widgetProvider.collectionIndex == index
                                  ? lightGreenColor
                                  : Colors.transparent),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.kDefaultSize * 3,
                              vertical: SizeConfig.kDefaultSize * 2,
                            ),
                            child: Text(
                              _widgetProvider.collection[index],
                              style: labelTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 3.5,
                                color:
                                    _widgetProvider.collectionIndex == index
                                        ? primaryColor
                                        : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1,
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
              height: height * .05,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_widgetProvider.collectionIndex == 2)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 1,
                        ),
                        child: Center(
                          child: Wrap(
                            runSpacing: width * .04,
                            spacing: width * .02,
                            children: List.generate(
                              3,
                              (index) {
                                return Container(
                                  width: width * .42,
                                  height: width * .44,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: width * .02,
                                        top: width * .0,
                                        child: Container(
                                          width: width * .36,
                                          height: width * .36,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(
                                              width * .05,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: width * .01,
                                        top: width * .02,
                                        child: Container(
                                          width: width * .38,
                                          height: width * .38,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(
                                              width * .05,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width: width * .40,
                                          height: width * .40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                media[index],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(
                                              width * .05,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    else
                      Center(
                        child: Wrap(
                          runSpacing: width * .039,
                          spacing: width * .039,
                          children: List.generate(
                            media.length,
                            (index) {
                              return Container(
                                width: width * .28,
                                height: width * .28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      media[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    width * .05,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
