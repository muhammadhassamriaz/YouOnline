import 'package:bot_toast/bot_toast.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/main_screen.dart';
import 'package:youonline/route/policy_screen.dart';
import 'package:youonline/route/privacy_policy_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isTermAgreementPressed = false;

  TextEditingController _firstNameTextEditingController =
          TextEditingController(),
      _passwordTextEditingController = TextEditingController(),
      _lastNameTextEditingController = TextEditingController(),
      _emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    var _apiProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          reverse: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .06,
            ),
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
                  height: height * .08,
                ),
                YouOnlineText(
                  text: 'First Name',
                ),
                SizedBox(
                  height: height * .005,
                ),
                YouOnlineTextField(
                  textEditingController: _firstNameTextEditingController,
                  hintText: 'First Name',
                ),
                SizedBox(
                  height: height * .03,
                ),
                YouOnlineText(
                  text: 'Last Name',
                ),
                SizedBox(
                  height: height * .005,
                ),
                YouOnlineTextField(
                  textEditingController: _lastNameTextEditingController,
                  hintText: 'Last Name',
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
                  textEditingController: _emailTextEditingController,
                  hintText: 'example@email.com',
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
                  height: height * .03,
                ),
                YouOnlineText(
                  text: 'Gender',
                ),
                SizedBox(
                  height: height * .02,
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
                  height: height * .03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTermAgreementPressed = !isTermAgreementPressed;
                        });
                      },
                      child: Icon(
                        isTermAgreementPressed
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: width * .06,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PolicyScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          textScaleFactor: 1,
                          text: TextSpan(
                            text:
                                'By creating your account, you agreed to our ',
                            style: labelTextStyle.copyWith(
                              fontSize: width * .035,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Use',
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .035,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' & ',
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .035,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .035,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .04,
                ),
                // Center(
                //   child: SizedBox(
                //       width: width * .8,
                //       height: height * .06,
                //       child: Image.asset(
                //         divider,
                //       )),
                // ),
                // Center(
                //   child: SizedBox(
                //     width: width * .8,
                //     height: height * .06,
                //     child: Image.asset(
                //       socialRoute,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height * .04,
                ),
                YouOnlineButton(
                  callback: () {
                    if (_passwordTextEditingController.text.length > 7) {
                      if (isTermAgreementPressed) {
                        if (_firstNameTextEditingController.text.isNotEmpty &&
                            _emailTextEditingController.text.isNotEmpty &&
                            _passwordTextEditingController.text.isNotEmpty) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailTextEditingController.text);
                          if (emailValid) {
                            _apiProvider.signUp(
                              firstName: _firstNameTextEditingController.text,
                              lastName: _lastNameTextEditingController.text,
                              email: _emailTextEditingController.text,
                              password: _passwordTextEditingController.text,
                              confirmPassword:
                                  _passwordTextEditingController.text,
                              gender: _widgetProvider.genderIndex == 0
                                  ? "male"
                                  : "female",
                              termsAgreementStatus:
                                  isTermAgreementPressed ? "1" : "0",
                              context: context,
                            );
                          } else {
                            BotToast.showText(
                              text: 'Please enter correct email address',
                              textStyle: labelTextStyle.copyWith(
                                fontSize: width * .03,
                                color: Colors.white,
                              ),
                              contentColor: Colors.red,
                            );
                          }
                        }
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
                    } else {
                      BotToast.showText(
                        text: 'Please Enter 8 digits password.',
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  },
                  title: 'Create Account',
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
