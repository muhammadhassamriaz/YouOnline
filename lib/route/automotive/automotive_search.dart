import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_textfield.dart';

class AutomotiveSearch extends StatefulWidget {
  @override
  _AutomotiveSearchState createState() => _AutomotiveSearchState();
}

class _AutomotiveSearchState extends State<AutomotiveSearch> {
  bool isAdvanceSearchShow = false;

  TextEditingController _locationTextEditingController =
          TextEditingController(),
      _searchTextEditingController = TextEditingController(),
      _priceTextEditingController = TextEditingController(),
      _postLanguageTextEditingController = TextEditingController();

  List<String> categories = [
    'All Countries',
    'Pakistan',
    'UAE',
    'Saudi Arabia',
    'Egypt',
    'Palestine',
  ];

  List<String> allCategories = [
    "All Categories",
    "Sub Categories",
    "Sub Sub Categories",
  ];

  String categoryValue = "All Categories";

  String value = 'All Countries';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Search",
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
            ),
            SizedBox(
              height: height * .02,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: height * .03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YouOnlineTextField(
                    textEditingController: _locationTextEditingController,
                    hintText: "Location",
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      size: width * .05,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  YouOnlineTextField(
                    textEditingController: _searchTextEditingController,
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      size: width * .05,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        setState(() {
                          isAdvanceSearchShow = !isAdvanceSearchShow;
                        });
                      });
                    },
                    child: Text(
                      "Advance Search",
                      style: subheadingTextStyle.copyWith(
                          fontSize: width * .04, color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
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
                      Text(
                        "Category",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
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
                            items: allCategories.map(
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
                            value: categoryValue,
                            onChanged: (valuee) {
                              setState(() {
                                categoryValue = valuee;
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
                            items: allCategories.map(
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
                            value: categoryValue,
                            onChanged: (valuee) {
                              setState(() {
                                categoryValue = valuee;
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
                            items: allCategories.map(
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
                            value: categoryValue,
                            onChanged: (valuee) {
                              setState(() {
                                categoryValue = valuee;
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
                      Text(
                        "Price",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      YouOnlineTextField(
                        textEditingController: _priceTextEditingController,
                        hintText: "",
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      Text(
                        "Post Language",
                        style: subheadingTextStyle.copyWith(
                          fontSize: width * .045,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _postLanguageTextEditingController,
                        hintText: "English",
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .03,
                        ),
                        child: YouOnlineButton(
                          callback: () {},
                          title: "Search",
                        ),
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
