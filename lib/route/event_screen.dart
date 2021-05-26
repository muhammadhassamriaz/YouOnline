import 'package:youonline/component/event_card.dart';
import 'package:youonline/component/event_header.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EventScreen extends StatelessWidget {
  List<String> categories = [
    "Art",
    "Comedy",
    "Fitness",
    "Health",
    "Food",
    "Party",
    "Music",
  ];

  List<String> categoryImages = [
    artIcon,
    comedyIcon,
    fitnessIcon,
    healthIcon,
    foodIcon2,
    partyIcon,
    musicIcon,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _widgetProvider = Provider.of<WidgetProvider>(context);
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
              EventHeader(),
              SizedBox(
                height: SizeConfig.kDefaultSize * 3,
              ),
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
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Events',
                  ),
                  Tab(
                    text: 'Calendar',
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 4,
                        ),
                        child: Text(
                          'Find Events by Date',
                          style: labelTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 3.5,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.kDefaultSize * 2,
                          ),
                          child: Row(
                            children: List.generate(
                              _widgetProvider.dates.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    _widgetProvider.changeSelectedDate(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: _widgetProvider
                                                    .selectedDate ==
                                                index
                                            ? BorderRadius.circular(
                                                SizeConfig.kDefaultSize * 10,
                                              )
                                            : BorderRadius.circular(
                                                SizeConfig.kDefaultSize * 0,
                                              ),
                                        color: _widgetProvider.selectedDate ==
                                                index
                                            ? lightGreenColor
                                            : Colors.transparent),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.kDefaultSize * 3,
                                        vertical: SizeConfig.kDefaultSize * 2,
                                      ),
                                      child: Text(
                                        _widgetProvider.dates[index],
                                        style: labelTextStyle.copyWith(
                                          fontSize:
                                              SizeConfig.kDefaultSize * 3.2,
                                          color: _widgetProvider.selectedDate ==
                                                  index
                                              ? primaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textScaleFactor: 1,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 2,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 4,
                        ),
                        child: Text(
                          'Suggested For You',
                          style: subheadingTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 5,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            3,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.kDefaultSize * 4,
                                ),
                                child: Container(
                                  height: SizeConfig.kDefaultSize * 50,
                                  width: SizeConfig.kDefaultSize * 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      SizeConfig.kDefaultSize * 3,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        eventCover,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      Container(
                        height: SizeConfig.kDefaultSize * 1.5,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 4,
                        ),
                        child: Text(
                          'Event You May Like',
                          style: subheadingTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 5,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.kDefaultSize * 4,
                                ),
                                child: EventCard(),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.kDefaultSize * 4,
                        ),
                        child: Text(
                          'Categories',
                          style: subheadingTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 5,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 3,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 5,
                                height: SizeConfig.kDefaultSize * 10,
                              ),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 4.2,
                                height: SizeConfig.kDefaultSize * 4.2,
                                child: Image.asset(
                                  categoryImages[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 4,
                              ),
                              Text(
                                categories[index],
                                style: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 3.8,
                                ),
                                textScaleFactor: 1,
                              ),
                              Spacer(),
                              SizedBox(
                                width: SizeConfig.kDefaultSize * 2,
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
