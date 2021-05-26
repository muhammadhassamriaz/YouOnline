import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

class CreatePageScreen extends StatefulWidget {
  @override
  _CreatePageScreenState createState() => _CreatePageScreenState();
}

class _CreatePageScreenState extends State<CreatePageScreen> {
  TextEditingController _groupNameTextEditingController =
      TextEditingController();

  TextEditingController _groupURLTextEditingController =
          TextEditingController(),
      _aboutTextEditingController = TextEditingController();

  List<String> categories = [
    'Cars & Vehicles',
    'Comedy',
    'Economics & Trade',
    'Education',
    'Entertainment',
    'Movies & Animation'
  ];

  String value = 'Cars & Vehicles';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .04,
              ),
              child: Row(
                children: [
                  Text(
                    'Create Page',
                    style: headingTextStyle.copyWith(
                      fontSize: width * .06,
                    ),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  Container(
                    width: width * .12,
                    height: width * .12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: searchContainerColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Center(
                        child: Icon(
                          Icons.clear,
                          size: width * .05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YouOnlineText(
                        text: 'Page Name',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      YouOnlineTextField(
                        textEditingController: _groupNameTextEditingController,
                        hintText: 'Name',
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      YouOnlineText(
                        text: 'Page URL',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        'https://www.youonline.com/',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .03,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: height * .006,
                      ),
                      YouOnlineTextField(
                        textEditingController: _groupURLTextEditingController,
                        hintText: 'Url',
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      YouOnlineText(
                        text: 'Page Category*',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Container(
                        width: width,
                        height: height * .06,
                        decoration: BoxDecoration(
                          color: searchContainerColor,
                          borderRadius: BorderRadius.circular(
                            width * .03,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            width * .02,
                          ),
                          child: DropdownButton<String>(
                            items: categories.map(
                              (String e) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    e,
                                    style: labelTextStyle,
                                    textScaleFactor: 1,
                                  ),
                                  value: e,
                                );
                              },
                            ).toList(),
                            style: hintTextStyle,
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor: searchContainerColor,
                            value: value,
                            onChanged: (valuee) {
                              setState(() {
                                value = valuee;
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: width * .06,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      YouOnlineText(
                        text: 'Page Description',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      YouOnlineTextField(
                        textEditingController: _aboutTextEditingController,
                        hintText: 'Text',
                        maxLength: 5,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: height * .19,
                      ),
                      YouOnlineButton(
                        callback: () {},
                        title: 'Create Page',
                      ),
                      SizedBox(
                        height: height * .05,
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
