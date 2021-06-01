import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/globals.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableSettingsPanel extends StatefulWidget {
  ExpandableSettingsPanel({Key key}) : super(key: key);

  @override
  _ExpandableSettingsPanelState createState() =>
      _ExpandableSettingsPanelState();
}

class _ExpandableSettingsPanelState extends State<ExpandableSettingsPanel> {
  ExpandableController _expandableController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ExpandablePanel(
        collapsed: SizedBox(),
        header: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        textScaleFactor: 1,
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                          color: Color(0xff0A52CC),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.kDefaultSize * 2,
                ),
                Container(
                  height: SizeConfig.kDefaultSize * 0.3,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ],
        ),
        expanded: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.kDefaultSize * 1,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: settingTitles.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   leading:
                  // SizedBox(
                  //     width: SizeConfig.kDefaultSize * 6,
                  //     height: SizeConfig.kDefaultSize * 6,
                  //     child: Image.asset(
                  //       images2[index],
                  //     ),
                  //   ),
                  //   title:
                  // Text(
                  //     settingTitles[index],
                  //     style: labelTextStyle.copyWith(
                  //       fontSize: SizeConfig.kDefaultSize * 4.2,
                  //     ),
                  //     textScaleFactor: 1,
                  //   ),
                  // );
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.kDefaultSize * 2,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 3,
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 6,
                          height: SizeConfig.kDefaultSize * 6,
                          child: Image.asset(
                            images2[index],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 3,
                        ),
                        Text(
                          settingTitles[index],
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 4.2,
                          ),
                          textScaleFactor: 1,
                        ),
                        Spacer(),
                        Text(
                          "       Launch Soon",
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 3,
                            color: hintTextColor,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        theme: ExpandableThemeData(
          expandIcon: Icons.keyboard_arrow_up,
          iconColor: highlightColor,
          collapseIcon: Icons.keyboard_arrow_down,
          iconSize: SizeConfig.kDefaultSize * 8,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          useInkWell: false,
        ),
        controller: _expandableController,
      ),
      controller: _expandableController,
    );
  }
}
