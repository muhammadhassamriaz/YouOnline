import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/controller_with_icon.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  TextEditingController _titleTextEditingController = TextEditingController(),
      _dateTextEditingController = TextEditingController(),
      _locationTextEditingcontroller = TextEditingController(),
      _startingTimeTextEditingController = TextEditingController(),
      _endingTimeTextEditingController = TextEditingController(),
      _descriptionTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 4,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                        width: SizeConfig.kDefaultSize * 6,
                        height: SizeConfig.kDefaultSize * 6.6,
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
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Create Event',
                    style: headingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 6,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YouOnlineText(
                        text: 'Event Title',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _titleTextEditingController,
                        hintText: 'Event Title',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: 'Event Date',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      TextFieldIcon(
                        textEditingController: _dateTextEditingController,
                        hintText: "Event Date",
                        iconColor: Colors.black,
                        imageURL: calenderIcon2,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: 'Location',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      TextFieldIcon(
                        textEditingController: _locationTextEditingcontroller,
                        hintText: "Choose Location",
                        iconColor: Colors.black,
                        imageURL: locationIcon2,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: 'Event Timing',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width * .4,
                            child: YouOnlineTextField(
                              textEditingController:
                                  _startingTimeTextEditingController,
                              hintText: '08:00 PM',
                            ),
                          ),
                          Text(
                            'To',
                            style: labelTextStyle.copyWith(
                              fontSize: width * .032,
                              color: hintTextColor,
                            ),
                            textScaleFactor: 1,
                          ),
                          Container(
                            width: width * .4,
                            child: YouOnlineTextField(
                              textEditingController:
                                  _endingTimeTextEditingController,
                              hintText: '06:00 PM',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: 'Description',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _descriptionTextEditingController,
                        hintText: "Description",
                        isPasswordText: null,
                        maxLength: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      Container(
                        height: SizeConfig.kDefaultSize * 40,
                        decoration: DottedDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 4,
                          ),
                          linePosition: LinePosition.top,
                          shape: Shape.box,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            0,
                          ),
                          child: Container(
                            height: SizeConfig.kDefaultSize * 24,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: searchContainerColor,
                              borderRadius: BorderRadius.circular(
                                SizeConfig.kDefaultSize * 5,
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.kDefaultSize * 5,
                              ),
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.kDefaultSize * 20,
                                    height: SizeConfig.kDefaultSize * 12,
                                    child: Image.asset(
                                      eventCameraIcon,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Center(
                                    child: Text(
                                      'Event Image',
                                      style: labelTextStyle.copyWith(
                                        fontSize: SizeConfig.kDefaultSize * 3.5,
                                        color: Colors.grey[500],
                                      ),
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      YouOnlineButton(
                        callback: () {},
                        title: "Create Event",
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
