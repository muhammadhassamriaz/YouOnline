import 'package:provider/provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/login_screen.dart';
import 'package:youonline/route/registration_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/intro_text.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:flutter/material.dart';

class LoginRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.SPLASH_SCREEN2,
              ),
              fit: BoxFit.fill,
            ),
            // color: Color(0xff30CB3A),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                IntroText(),
                SizedBox(
                  height: height * .06,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .06,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width / 2.4,
                        child: YouOnlineButton(
                          callback: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          title: "Login",
                          color: Colors.white,
                          textColor: primaryColor,
                          textSize: width * .04,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: SizeConfig.kDefaultSize * 12,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: width * .005,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeConfig.kDefaultSize * 3,
                          ),
                        ),
                        width: width / 2.4,
                        child: TextButton(
                          child: Text(
                            "Sign Up",
                            style: labelTextStyle.copyWith(
                              fontSize: width * .04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.kDefaultSize * 3,
                                  ),
                                );
                              },
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent,
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black26,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegistrationScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
    );
  }
}
