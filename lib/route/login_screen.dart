import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/registration_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController _userNameTextEditingController =
          TextEditingController(),
      _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    UserProvider apiProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .06,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Text(
                  'YouOnline',
                  style: subheadingTextStyle.copyWith(
                    color: primaryColor,
                    fontSize: width * .06,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(
                  height: height * .15,
                ),
                Container(
                  width: width * .6,
                  child: Text(
                    'Meet new people around the world!',
                    style: headingTextStyle.copyWith(
                      fontSize: width * .08,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                YouOnlineText(
                  text: 'Email',
                ),
                SizedBox(
                  height: height * .005,
                ),
                YouOnlineTextField(
                  textEditingController: _userNameTextEditingController,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: height * .03,
                ),
                YouOnlineText(
                  text: 'Password',
                ),
                SizedBox(
                  height: height * .005,
                ),
                YouOnlineTextField(
                  textEditingController: _passwordTextEditingController,
                  hintText: '••••••••',
                  obsecure: true,
                  isPasswordText: true,
                  maxLength: 1,
                ),
                SizedBox(
                  height: height * .015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                YouOnlineButton(
                  callback: () {
                    if (_userNameTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController.text.isNotEmpty) {
                      apiProvider.signIn(
                        email: _userNameTextEditingController.text,
                        password: _passwordTextEditingController.text,
                        context: context,
                      );
                    } else {
                      BotToast.showText(
                        text: 'Please fill all the fields',
                        textStyle: labelTextStyle.copyWith(
                          fontSize: width * .03,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  },
                  title: 'Sign in',
                ),
                SizedBox(
                  height: height * .2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: labelTextStyle.copyWith(
                        fontSize: width * .035,
                      ),
                      textScaleFactor: 1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
