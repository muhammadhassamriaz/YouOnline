import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/login_registration_route.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  TextEditingController _passwordTextEditingController =
          TextEditingController(),
      _confirmPasswordTextEditingController = TextEditingController();

  ResetPasswordScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _userProvider = Provider.of<UserProvider>(context);
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
                    if (_passwordTextEditingController.text.isNotEmpty &&
                        _confirmPasswordTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController != null &&
                        _confirmPasswordTextEditingController != null) {
                      if (_passwordTextEditingController.text.length > 7 &&
                          _confirmPasswordTextEditingController.text.length >
                              7) {
                        if (_passwordTextEditingController.text ==
                            _confirmPasswordTextEditingController.text) {
                          _userProvider.resetPassword(
                            context: context,
                            password: _passwordTextEditingController.text,
                          );
                        } else {
                          BotToast.showText(
                            text: 'Password Mismatched!',
                            textStyle: labelTextStyle.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            contentColor: Colors.red,
                          );
                        }
                      } else {
                        BotToast.showText(
                          text: 'Please enter atleast 8 digits.',
                          textStyle: labelTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          contentColor: Colors.red,
                        );
                      }
                    } else {
                      BotToast.showText(
                        text: 'Please fill all the fields.',
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
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
