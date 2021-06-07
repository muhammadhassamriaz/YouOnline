import 'package:flutter/material.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';

class ConditionTypesScreen extends StatefulWidget {
  ConditionTypesScreen({Key key}) : super(key: key);

  @override
  _ConditionTypesScreenState createState() => _ConditionTypesScreenState();
}

class _ConditionTypesScreenState extends State<ConditionTypesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    maxLines: 1,
                    style: headingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  YouOnlineIconButton(
                    callback: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.clear,
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
