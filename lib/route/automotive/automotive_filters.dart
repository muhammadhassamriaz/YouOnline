import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:expandable/expandable.dart';
import 'package:youonline/widgets/you_online_button.dart';

class AutomotiveFilters extends StatefulWidget {
  @override
  _AutomotiveFiltersState createState() => _AutomotiveFiltersState();
}

class _AutomotiveFiltersState extends State<AutomotiveFilters> {
  int selectedIndex = 0;
  int selectedCar = 10;
  List<String> category = [
    "Used Cars for Sale",
    "Motorcycles",
    "Auto Accessories & Parts",
  ];
  RangeValues _currentRangeValues = RangeValues(0, 10000);
  String maxValue = '10000', minValue = '0';
  ExpandableController _expandableController = ExpandableController();

  List<String> cars = [
    "Audi",
    "Acura",
    "Alfa Romeo",
    "Astin Martin",
    "Bently",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Filters",
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
            ),
            SizedBox(
              height: height * .01,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: width * .02,
                    children: List.generate(
                      category.length,
                      (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                selectedIndex == index
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: primaryColor,
                                size: width * .05,
                              ),
                              SizedBox(
                                width: width * .02,
                              ),
                              Text(
                                category[index],
                                style: labelTextStyle.copyWith(
                                  fontSize: width * .035,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    "Price Range",
                    style: subheadingTextStyle.copyWith(
                      fontSize: width * .045,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .05,
                    ),
                    child: SliderTheme(
                      data: SliderThemeData(
                        rangeThumbShape: RoundRangeSliderThumbShape(
                          disabledThumbRadius: width * .03,
                          enabledThumbRadius: width * .03,
                        ),
                        disabledActiveTickMarkColor: Colors.white,
                        disabledActiveTrackColor: Colors.white,
                        inactiveTickMarkColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        valueIndicatorColor: Colors.white,
                        overlayColor: Colors.white,
                        thumbColor: Colors.white,
                        activeTrackColor: primaryColor,
                        activeTickMarkColor: Colors.transparent,
                        trackHeight: height * .001,
                      ),
                      child: RangeSlider(
                        activeColor: primaryColor,
                        inactiveColor: Colors.grey,
                        values: _currentRangeValues,
                        min: 0,
                        max: 10000,
                        labels: RangeLabels("\$$minValue", "\$$maxValue"),
                        divisions: 10000,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                            setState(() {
                              minValue = values.start.round().toString();
                              maxValue = values.end.round().toString();
                            });
                          });
                        },
                        onChangeStart: (RangeValues value) {
                          setState(() {
                            minValue = value.start.round().toString();
                            maxValue = value.end.round().toString();
                          });
                        },
                        onChangeEnd: (RangeValues value) {
                          setState(() {
                            minValue = value.start.round().toString();
                            maxValue = value.end.round().toString();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Divider(
              thickness: 1,
            ),
            ExpandableNotifier(
              child: ExpandablePanel(
                collapsed: SizedBox(),
                header: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 4,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Used Car For Sale',
                            textScaleFactor: 1,
                            style: labelTextStyle.copyWith(
                              fontSize: SizeConfig.kDefaultSize * 4.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 4,
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: width * .02,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCar = index;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cars[index],
                                  textScaleFactor: 1,
                                  style: labelTextStyle.copyWith(
                                    fontSize: SizeConfig.kDefaultSize * 3.8,
                                    fontWeight: selectedCar == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: selectedCar == index
                                        ? primaryColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
              ),
              child: YouOnlineButton(
                callback: () {},
                title: "Apply Filter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
