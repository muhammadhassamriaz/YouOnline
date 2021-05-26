import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/cupertino_switcher.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  TextEditingController _currentPasswordTextEditingController =
          TextEditingController(),
      _newPasswordTextEditingController = TextEditingController(),
      _confirmPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 4,
            ),
            HeaderTitle(
              title: 'Change Password',
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
                      Text(
                        'Please enter the old password and the you can create new password',
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                        ),
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Two-factor authentication',
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 4,
                              color: Colors.grey,
                            ),
                            textScaleFactor: 1,
                          ),
                          YouOnlineCupertinoRadioButton(),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 8,
                      ),
                      YouOnlineText(
                        text: "Current Password",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _currentPasswordTextEditingController,
                        hintText: "",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "New Password",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _newPasswordTextEditingController,
                        hintText: "",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "Confirm Password",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController:
                            _confirmPasswordTextEditingController,
                        hintText: "",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 10,
                      ),
                      YouOnlineButton(
                        callback: () {},
                        title: "Save",
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
