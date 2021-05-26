import 'package:youonline/component/notification_settings.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _dataProvider = Provider.of<DataProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
              HeaderTitle(title: "Notification Screen"),
              TabBar(
                indicatorColor: primaryColor,
                labelStyle: labelTextStyle.copyWith(
                  fontSize: SizeConfig.kDefaultSize * 4,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                physics: BouncingScrollPhysics(),
                unselectedLabelStyle: labelTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: SizeConfig.kDefaultSize * 4,
                  fontWeight: FontWeight.normal,
                ),
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Notifcation',
                  ),
                  Tab(
                    text: 'Email',
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.kDefaultSize * 5,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    NotificationSettings(),
                    NotificationSettings(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
