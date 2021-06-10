import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController _emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 6,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.kDefaultSize * 26,
                ),
                Center(
                  child: Text(
                    'Continue with email',
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
                    'You’ll receive 4 digit code to verify next.',
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 4,
                      color: Colors.grey,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 20,
                ),
                YouOnlineText(
                  text: "Email Address",
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                YouOnlineTextField(
                  textEditingController: _emailTextEditingController,
                  hintText: "example@email.com",
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 10,
                ),
                YouOnlineButton(
                  callback: () {
                    if (_emailTextEditingController.text.isNotEmpty) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailTextEditingController.text);
                      if (emailValid) {
                        _userProvider.requestPassword(
                          email: _emailTextEditingController.text,
                          context: context,
                        );
                      } else {
                        BotToast.showText(
                          text: "Please enter valid email address!",
                          textStyle: labelTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          contentColor: Colors.red,
                        );
                      }
                    } else {
                      BotToast.showText(
                        text: "Please enter your email!",
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  },
                  title: "Send",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
