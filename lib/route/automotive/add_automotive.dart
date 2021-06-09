import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/add_product.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/automotive_card.dart';
import 'package:youonline/widgets/automotive_option.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/you_online_button.dart';

class AddAutomotiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Automotive",
                    maxLines: 1,
                    style: headingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  YouOnlineIconButton(
                    callback: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.clear,
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              AutomotiveOption(
                title: "Add Product",
                subtitle: "Grande, sale, audi,",
                callback: () {},
              ),
              SizedBox(
                height: height * .02,
              ),
              AutomotiveOption(
                title: "Currency",
                subtitle: "Grande, sale, audi,",
                callback: () {},
              ),
              SizedBox(
                height: height * .02,
              ),
              AutomotiveOption(
                title: "General Info",
                subtitle: "Grande, sale, audi,",
                callback: () {},
              ),
              SizedBox(
                height: height * .02,
              ),
              AutomotiveOption(
                title: "Condition and Types",
                subtitle: "Grande, sale, audi,",
                callback: () {},
              ),
              SizedBox(
                height: height * .05,
              ),
              YouOnlineButton(
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddProductScreen(),
                    ),
                  );
                },
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
