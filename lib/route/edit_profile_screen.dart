import 'dart:io';

import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _firstNameTextEditingController =
          TextEditingController(),
      _lastNameTextEditingController = TextEditingController(),
      _aboutTextEditingController = TextEditingController(),
      _locationTextEditingController = TextEditingController(),
      _schoolTextEditingController = TextEditingController(),
      _workingAtTextEditingController = TextEditingController(),
      _companyWebsiteTextEditingController = TextEditingController(),
      _websiteTextEditingController = TextEditingController(),
      _birthdayTextEditingController = TextEditingController();

  File profileAvatar;
  File coverPhoto;

  @override
  void initState() {
    super.initState();
    var user = Provider.of<UserProvider>(context, listen: false).user;
    var _widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    _firstNameTextEditingController.text = user.firstName ?? "";
    _lastNameTextEditingController.text = user.lastName ?? "";
    _aboutTextEditingController.text = user.about ?? "";
    _locationTextEditingController.text = user.address ?? "";
    _schoolTextEditingController.text = user.school ?? "";
    _workingAtTextEditingController.text = user.working ?? "";
    _companyWebsiteTextEditingController.text = user.workingLink ?? "";
    _websiteTextEditingController.text = user.website ?? "";
    _birthdayTextEditingController.text = user.birthday ?? "";
    if (user.gender != null && user.gender.isNotEmpty) {
      if (user.gender.toLowerCase() == ("male")) {
        _widgetProvider.changeGenderIndex(0);
      } else if (user.gender.toLowerCase() == ("female")) {
        _widgetProvider.changeGenderIndex(1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 1.5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Profile Picture',
                        style: subheadingTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                        ),
                        textScaleFactor: 1,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          ImagePicker.platform
                              .pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 70,
                          )
                              .then((value) {
                            setState(() {
                              if (value != null) {
                                profileAvatar = File(value.path);
                              }
                            });
                          });
                        },
                        child: Text(
                          'Edit',
                          style: subheadingTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 3.2,
                            color: primaryColor,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 1.5,
                  ),
                  if (profileAvatar == null)
                    Center(
                      child: Container(
                        width: SizeConfig.kDefaultSize * 40,
                        height: SizeConfig.kDefaultSize * 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: _userProvider.user.avatar,
                          ),
                        ),
                      ),
                    )
                  else if (profileAvatar != null)
                    Center(
                      child: Container(
                        width: SizeConfig.kDefaultSize * 40,
                        height: SizeConfig.kDefaultSize * 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              profileAvatar,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 1,
            ),
            Divider(
              thickness: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 2,
                      ),
                      Row(
                        children: [
                          Text(
                            'Cover Photo',
                            style: subheadingTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 4,
                            ),
                            textScaleFactor: 1,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              ImagePicker.platform
                                  .pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 70,
                              )
                                  .then((value) {
                                setState(() {
                                  if (value != null) {
                                    coverPhoto = File(value.path);
                                  }
                                });
                              });
                            },
                            child: Text(
                              'Edit',
                              style: subheadingTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 3.2,
                                color: primaryColor,
                              ),
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      if (coverPhoto == null)
                        Container(
                          height: SizeConfig.kDefaultSize * 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.kDefaultSize * 3,
                            ),
                          ),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: _userProvider.user.cover,
                            fit: BoxFit.cover,
                          ),
                        )
                      else if (coverPhoto != null)
                        Container(
                          height: SizeConfig.kDefaultSize * 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.kDefaultSize * 3,
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                coverPhoto,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 2,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YouOnlineText(text: "First Name"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _firstNameTextEditingController,
                    hintText: "Last Name",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Last Name"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _lastNameTextEditingController,
                    hintText: "Full Name",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "About"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _aboutTextEditingController,
                    hintText: "Text",
                    maxLength: 5,
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Location"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _locationTextEditingController,
                    hintText: "Address",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "School"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _schoolTextEditingController,
                    hintText: "Education",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Company Name"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _workingAtTextEditingController,
                    hintText: "Company Name",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Company Website"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _companyWebsiteTextEditingController,
                    hintText: "Company Website",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Website"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  YouOnlineTextField(
                    textEditingController: _websiteTextEditingController,
                    hintText: "Url",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(text: "Birthday"),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: YouOnlineTextField(
                            textEditingController:
                                _birthdayTextEditingController,
                            hintText: "13 June 1994",
                            isReadable: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      YouOnlineIconButton(
                        icon: Icons.calendar_today,
                        iconSize: width * .05,
                        callback: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (date) {
                              _birthdayTextEditingController.text =
                                  date.year.toString() +
                                      "-" +
                                      date.month.toString() +
                                      "-" +
                                      date.day.toString();
                            },
                            onConfirm: (date) {
                              _birthdayTextEditingController.text =
                                  date.year.toString() +
                                      "-" +
                                      date.month.toString() +
                                      "-" +
                                      date.day.toString();
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 5,
                  ),
                  YouOnlineText(
                    text: 'Gender',
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 2,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _widgetProvider.changeGenderIndex(0);
                        },
                        child: Icon(
                          _widgetProvider.genderIndex == 0
                              ? Icons.radio_button_checked_outlined
                              : Icons.radio_button_unchecked_outlined,
                          size: width * .05,
                        ),
                      ),
                      SizedBox(
                        width: width * .01,
                      ),
                      InkWell(
                        onTap: () {
                          _widgetProvider.changeGenderIndex(0);
                        },
                        child: Text(
                          'Male',
                          textScaleFactor: 1,
                          style: labelTextStyle.copyWith(
                            fontSize: width * .035,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .25,
                      ),
                      InkWell(
                        onTap: () {
                          _widgetProvider.changeGenderIndex(1);
                        },
                        child: Icon(
                          _widgetProvider.genderIndex == 1
                              ? Icons.radio_button_checked_outlined
                              : Icons.radio_button_unchecked_outlined,
                          size: width * .05,
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      InkWell(
                        onTap: () {
                          _widgetProvider.changeGenderIndex(1);
                        },
                        child: Text(
                          'Female',
                          textScaleFactor: 1,
                          style: labelTextStyle.copyWith(
                            fontSize: width * .035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 15,
                  ),
                  YouOnlineButton(
                    callback: () {
                      List<File> profilePicture = [];
                      List<File> cover = [];
                      if (profileAvatar != null && coverPhoto != null) {
                        profilePicture.add(profileAvatar);
                        cover.add(coverPhoto);
                        _userProvider.updateUserProfile(
                          profilePicture: profilePicture,
                          coverImage: cover,
                          firstName: _firstNameTextEditingController.text,
                          lastName: _lastNameTextEditingController.text,
                          about: _aboutTextEditingController.text,
                          location: _locationTextEditingController.text,
                          school: _schoolTextEditingController.text,
                          working: _workingAtTextEditingController.text,
                          workLink: _companyWebsiteTextEditingController.text,
                          website: _websiteTextEditingController.text,
                          birthday: _birthdayTextEditingController.text,
                          gender: _widgetProvider.genderIndex != null
                              ? _widgetProvider.genderIndex == 0
                                  ? "male"
                                  : _widgetProvider.genderIndex == 1
                                      ? "female"
                                      : ""
                              : "",
                          context: context,
                        );
                      } else if (profileAvatar != null) {
                        profilePicture.add(profileAvatar);
                        _userProvider.updateUserProfile(
                          profilePicture: profilePicture,
                          firstName: _firstNameTextEditingController.text,
                          lastName: _lastNameTextEditingController.text,
                          about: _aboutTextEditingController.text,
                          location: _locationTextEditingController.text,
                          school: _schoolTextEditingController.text,
                          working: _workingAtTextEditingController.text,
                          workLink: _companyWebsiteTextEditingController.text,
                          website: _websiteTextEditingController.text,
                          birthday: _birthdayTextEditingController.text,
                          gender: _widgetProvider.genderIndex != null
                              ? _widgetProvider.genderIndex == 0
                                  ? "male"
                                  : _widgetProvider.genderIndex == 1
                                      ? "female"
                                      : ""
                              : "",
                          context: context,
                        );
                      } else if (coverPhoto != null) {
                        cover.add(coverPhoto);
                        _userProvider.updateUserProfile(
                          coverImage: cover,
                          firstName: _firstNameTextEditingController.text,
                          lastName: _lastNameTextEditingController.text,
                          about: _aboutTextEditingController.text,
                          location: _locationTextEditingController.text,
                          school: _schoolTextEditingController.text,
                          working: _workingAtTextEditingController.text,
                          workLink: _companyWebsiteTextEditingController.text,
                          website: _websiteTextEditingController.text,
                          birthday: _birthdayTextEditingController.text,
                          gender: _widgetProvider.genderIndex != null
                              ? _widgetProvider.genderIndex == 0
                                  ? "male"
                                  : _widgetProvider.genderIndex == 1
                                      ? "female"
                                      : ""
                              : "",
                          context: context,
                        );
                      } else {
                        _userProvider.updateUserProfile(
                          firstName: _firstNameTextEditingController.text,
                          lastName: _lastNameTextEditingController.text,
                          about: _aboutTextEditingController.text,
                          location: _locationTextEditingController.text,
                          school: _schoolTextEditingController.text,
                          working: _workingAtTextEditingController.text,
                          workLink: _companyWebsiteTextEditingController.text,
                          website: _websiteTextEditingController.text,
                          birthday: _birthdayTextEditingController.text,
                          gender: _widgetProvider.genderIndex != null
                              ? _widgetProvider.genderIndex == 0
                                  ? "male"
                                  : _widgetProvider.genderIndex == 1
                                      ? "female"
                                      : ""
                              : "",
                          context: context,
                        );
                      }
                    },
                    title: "Submit",
                  ),
                  SizedBox(
                    height: SizeConfig.kDefaultSize * 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
