import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _dataProvider = Provider.of<DataProvider>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _dataProvider.notificationText.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  _dataProvider.changeSelectedNotificationIndex(index);
                  if (!_dataProvider.selectedNotificationText
                      .contains(_dataProvider.notificationText[index])) {
                    _dataProvider.selectedNotificationText.add(
                      _dataProvider.notificationText[index],
                    );
                    _dataProvider.changeSelectedNotificationText(
                        _dataProvider.selectedNotificationText);
                  } else {
                    _dataProvider.selectedNotificationText.remove(
                      _dataProvider.notificationText[index],
                    );
                    _dataProvider.changeSelectedNotificationText(
                        _dataProvider.selectedNotificationText);
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 5,
                      height: SizeConfig.kDefaultSize * 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 6,
                          height: SizeConfig.kDefaultSize * 6,
                          child: Image.asset(
                            _dataProvider.selectedNotificationText.contains(
                                    _dataProvider.notificationText[index])
                                ? selectedCheckboxIcon
                                : emptyCheckboxIcon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                    Flexible(
                      child: Text(
                        _dataProvider.notificationText[index],
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4.2,
                          color: _dataProvider.selectedNotificationText
                                  .contains(
                                      _dataProvider.notificationText[index])
                              ? primaryColor
                              : Colors.black,
                          fontWeight: _dataProvider.selectedNotificationText
                                  .contains(
                                      _dataProvider.notificationText[index])
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.kDefaultSize * 2,
                    ),
                  ],
                ),
                style: ButtonStyle(padding: MaterialStateProperty.resolveWith(
                  (states) {
                    return EdgeInsets.all(0);
                  },
                ), backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (_dataProvider.selectedNotificationText
                        .contains(_dataProvider.notificationText[index])) {
                      return lightGreenColor;
                    } else {
                      return Colors.transparent;
                    }
                  },
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}
