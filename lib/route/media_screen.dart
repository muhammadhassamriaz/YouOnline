import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
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
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  Text(
                    'Videos',
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
              child: Center(
                child: Wrap(
                  runSpacing: width * .06,
                  spacing: width * .06,
                  children: [
                    Container(
                      width: width * .40,
                      height: width * .40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400],
                        ),
                        borderRadius: BorderRadius.circular(
                          width * .05,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: width * .08,
                          ),
                          Text(
                            'Upload Video',
                            style: labelTextStyle.copyWith(
                              fontSize: width * .038,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * .40,
                      height: width * .40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            photoPlaceholder,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                          width * .05,
                        ),
                      ),
                    ),
                    Container(
                      width: width * .40,
                      height: width * .40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            photoPlaceholder2,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                          width * .05,
                        ),
                      ),
                    ),
                    Container(
                      width: width * .40,
                      height: width * .40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            photoPlaceholder3,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                          width * .05,
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
