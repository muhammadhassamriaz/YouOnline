import 'package:youonline/route/reset_password_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class SuccessfullyVerified extends StatefulWidget {
  @override
  _SuccessfullyVerifiedState createState() => _SuccessfullyVerifiedState();
}

class _SuccessfullyVerifiedState extends State<SuccessfullyVerified> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: SizeConfig.kDefaultSize * 45,
                  width: SizeConfig.kDefaultSize * 45,
                  child: Image.asset(
                    verifyIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
              Center(
                child: Text(
                  'Verified!',
                  style: subheadingTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 5.5,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
              Center(
                child: Text(
                  'You have successfully verified\nthe account.',
                  textAlign: TextAlign.center,
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                    color: Colors.grey,
                  ),
                  textScaleFactor: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
