import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:youonline/provider/user_provider.dart';

import 'package:youonline/route/successfully_verified.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/settings_route_tile.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PinVerificationScreen extends StatefulWidget {
  final String email;

  PinVerificationScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  TextEditingController _pinTextEditingController = TextEditingController();

  String pin = "";

  @override
  Widget build(BuildContext context) {
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.kDefaultSize * 6,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 26,
              ),
              Center(
                child: Text(
                  'Verify Code',
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
                  'Code is sent to \nexample@gmail.com',
                  textAlign: TextAlign.center,
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                    color: Colors.grey,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kDefaultSize * 6,
                ),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: _pinTextEditingController,
                    onChanged: (value) {
                      setState(() {
                        pin = value;
                      });
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.kDefaultSize * 5,
                      ),
                      selectedColor: primaryColor,
                      activeFillColor: Color(0xffE5E5E5),
                      inactiveFillColor: Color(0xffE5E5E5),
                      activeColor: Color(0xffE5E5E5),
                      disabledColor: Color(0xffE5E5E5),
                      inactiveColor: Color(0xffE5E5E5),
                      selectedFillColor: Color(0xffE5E5E5),
                      fieldHeight: SizeConfig.kDefaultSize * 14,
                      fieldWidth: SizeConfig.kDefaultSize * 14,
                    ),
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 5,
              ),
              Center(
                child: Text(
                  'Didn’t recive code?',
                  textAlign: TextAlign.center,
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 2,
              ),
              Center(
                child: Text(
                  'Resend OTP',
                  textAlign: TextAlign.center,
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 8,
              ),
              YouOnlineButton(
                callback: () {
                  if (pin != null && pin.isNotEmpty) {
                    if (pin.length == 4) {
                      _userProvider.verifyRequestPassword(
                        email: widget.email,
                        pin: pin,
                        context: context,
                      );
                    } else {
                      BotToast.showText(
                        text: 'Please enter your verification pincode.',
                        textStyle: labelTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        contentColor: Colors.red,
                      );
                    }
                  } else {
                    BotToast.showText(
                      text: 'Please enter your verification pincode.',
                      textStyle: labelTextStyle.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      contentColor: Colors.red,
                    );
                  }
                },
                title: "Verify Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
