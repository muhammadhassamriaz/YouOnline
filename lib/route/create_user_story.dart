import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bot_toast/bot_toast.dart';

class CreateUserStories extends StatefulWidget {
  @override
  _CreateUserStoriesState createState() => _CreateUserStoriesState();
}

class _CreateUserStoriesState extends State<CreateUserStories> {
  TextEditingController _descriptionTextEditingController =
      TextEditingController();

  File imageFile;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      'Create User Story',
                      style: headingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6,
                      ),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 5,
                ),
                child: YouOnlineTextField(
                  textEditingController: _descriptionTextEditingController,
                  hintText: "Description",
                  isPasswordText: null,
                  maxLength: 5,
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 5,
              ),
              if (imageFile == null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 5,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await ImagePicker.platform
                          .pickImage(
                        imageQuality: 70,
                        source: ImageSource.gallery,
                      )
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            imageFile = File(value.path);
                          });
                        }
                      });
                    },
                    child: Container(
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
                                  'Select Image',
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
                )
              else
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 5,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await ImagePicker.platform
                          .pickImage(
                              source: ImageSource.gallery, imageQuality: 70)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            imageFile = File(value.path);
                          });
                        }
                      });
                    },
                    child: Container(
                      height: SizeConfig.kDefaultSize * 40,
                      // decoration: DottedDecoration(
                      //   color: Colors.grey[500],
                      //   borderRadius: BorderRadius.circular(
                      //     SizeConfig.kDefaultSize * 4,
                      //   ),
                      //   linePosition: LinePosition.top,
                      //   shape: Shape.box,
                      // ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          0,
                        ),
                        child: Container(
                          height: SizeConfig.kDefaultSize * 24,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.kDefaultSize * 5,
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                imageFile,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.camera,
                                      color: primaryColor,
                                    ),
                                    onPressed: () async {
                                      await ImagePicker.platform
                                          .pickImage(
                                        imageQuality: 70,
                                        source: ImageSource.gallery,
                                      )
                                          .then((value) {
                                        if (value != null) {
                                          setState(() {
                                            imageFile = File(value.path);
                                          });
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: height * .05,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: SizeConfig.kDefaultSize * 5,
              //   ),
              //   child: RichText(
              //     text: TextSpan(
              //       children: [
              //         TextSpan(
              //           text: "Note:",
              //           style: labelTextStyle.copyWith(
              //             fontSize: width * .04,
              //             color: primaryColor,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         TextSpan(
              //           text:
              //               " Image is optional. User can create story without image as well.",
              //           style: labelTextStyle.copyWith(
              //             fontSize: width * .038,
              //             color: hintTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height * .1,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 5,
                ),
                child: YouOnlineButton(
                  callback: () {
                    List<File> imageFiles = [];
                    setState(() {
                      imageFiles.add(imageFile);
                    });
                    if (_descriptionTextEditingController.text.length > 0 &&
                        imageFiles.length > 0 &&
                        imageFile != null) {
                      userProvider.createUserStory(
                        context: context,
                        description:
                            _descriptionTextEditingController.text ?? "",
                        imageFile: imageFiles ?? [],
                      );
                    } else {
                      BotToast.showText(
                        text: "Please fill all the fields.",
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  },
                  title: "Create Story",
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
