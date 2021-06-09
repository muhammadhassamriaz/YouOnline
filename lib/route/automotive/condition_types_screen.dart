import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/automotive_agreement.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class ConditionTypesScreen extends StatefulWidget {
  ConditionTypesScreen({Key key}) : super(key: key);

  @override
  _ConditionTypesScreenState createState() => _ConditionTypesScreenState();
}

class _ConditionTypesScreenState extends State<ConditionTypesScreen> {
  TextEditingController _descriptionTextEditingController =
      TextEditingController();

  List<String> categories = [
    'Perfect Inside Out',
    'Perfect Inside',
    'Perfect Out',
  ];

  String value = 'Perfect Inside Out';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    "Condition and Types",
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
                height: height * .02,
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
                      YouOnlineText(
                        text: 'Body Condition',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Perfect Inside And Out',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Year',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Body Type',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Color',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Transmission Type',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Regional Specs',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'No. Of Cylinders',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Doors',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'HorsePower',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Warranty',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Fuel Type',
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
                        height: height * .02,
                      ),
                      YouOnlineText(
                        text: 'Description',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _descriptionTextEditingController,
                        hintText: 'Description',
                        isPasswordText: null,
                        maxLength: 5,
                      ),
                      SizedBox(
                        height: height * .02,
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
                        callback: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AutomotiveAgreementScreen(),
                            ),
                          );
                        },
                        title: "Next",
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
      ),
    );
  }
}
