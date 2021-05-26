import 'dart:io';

import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreateBlogScreen extends StatefulWidget {
  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  TextEditingController _titleTextEditingController = TextEditingController(),
      _descriptionTextEditingController = TextEditingController(),
      _postTextEditingController = TextEditingController();

  List<String> totalFloor = [
    'All',
    'Natural',
    'News & Politics',
    'Entertainment',
  ];

  String value = 'All';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    'Create Blog',
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YouOnlineText(
                        text: 'Title',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _titleTextEditingController,
                        hintText: 'name',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
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
                        hintText: 'text',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
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
                                      Assets.CV_ICON,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Drop your CV here',
                                      style: labelTextStyle.copyWith(
                                        fontSize: SizeConfig.kDefaultSize * 4,
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
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      YouOnlineText(
                        text: 'Category',
                      ),
                      Card(
                        color: searchContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 1,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.kDefaultSize * 12,
                          color: searchContainerColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.kDefaultSize * 2,
                            ),
                            child: DropdownButton<String>(
                              items: totalFloor.map(
                                (String e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: labelTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: SizeConfig.kDefaultSize * 4,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                    ),
                                    value: e,
                                  );
                                },
                              ).toList(),
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
                                Icons.arrow_drop_down_circle,
                                size: SizeConfig.kDefaultSize * 6,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      YouOnlineText(text: 'Tags'),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      TextFieldTags(
                        tagsStyler: TagsStyler(
                          tagTextStyle: labelTextStyle.copyWith(
                            color: Colors.grey[500],
                            fontSize: SizeConfig.kDefaultSize * 3.5,
                          ),
                          tagDecoration: BoxDecoration(
                            color: searchContainerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tagCancelIcon: Icon(
                            Icons.cancel,
                            size: 16.0,
                            color: primaryColor,
                          ),
                          tagPadding: const EdgeInsets.all(10.0),
                        ),
                        textFieldStyler: TextFieldStyler(
                          textStyle: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 3.5,
                          ),
                        ),
                        onTag: (tag) {},
                        onDelete: (tag) {},
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                          color: searchContainerColor,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Padding(
                          padding: EdgeInsets.all(
                            SizeConfig.kDefaultSize * 3,
                          ),
                          child: YouOnlineTextField(
                            textEditingController: _postTextEditingController,
                            hintText: '',
                            maxLength: 8,
                            isPasswordText: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      YouOnlineButton(
                        callback: () {},
                        title: 'Publish',
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
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
