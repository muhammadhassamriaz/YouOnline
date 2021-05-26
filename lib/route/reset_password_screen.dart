import 'package:youonline/route/login_registration_route.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController _passwordTextEditingController =
          TextEditingController(),
      _confirmPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.kDefaultSize * 6,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 26,
                ),
                Center(
                  child: SizedBox(
                    height: SizeConfig.kDefaultSize * 35,
                    width: SizeConfig.kDefaultSize * 35,
                    child: Image.asset(
                      lockIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 5,
                ),
                Center(
                  child: Text(
                    'New Password',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 5.5,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                Center(
                  child: Text(
                    'Your new password must be different from previous used password',
                    textAlign: TextAlign.center,
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 4,
                      color: Colors.grey,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 8,
                ),
                YouOnlineText(text: "Password"),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                YouOnlineTextField(
                  textEditingController: _passwordTextEditingController,
                  hintText: "",
                  isPasswordText: true,
                  obsecure: true,
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 6,
                ),
                YouOnlineText(text: "Confirm Password"),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                YouOnlineTextField(
                  textEditingController: _confirmPasswordTextEditingController,
                  hintText: "",
                  isPasswordText: true,
                  obsecure: true,
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 10,
                ),
                YouOnlineButton(
                  callback: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginRegistrationScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  title: "Reset Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
