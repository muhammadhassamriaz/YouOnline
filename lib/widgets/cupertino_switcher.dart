import 'package:youonline/provider/widget_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YouOnlineCupertinoRadioButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return CupertinoSwitch(
      value: _widgetProvider.twoFactorAuthenticationValue,
      onChanged: (value) {
        _widgetProvider.changeTwoFactorAuthenticationValue(value);
      },
    );
  }
}
