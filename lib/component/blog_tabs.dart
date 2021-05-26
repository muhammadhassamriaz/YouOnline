import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class BlogTabs extends StatefulWidget {
  const BlogTabs({Key key}) : super(key: key);

  @override
  _BlogTabsState createState() => _BlogTabsState();
}

class _BlogTabsState extends State<BlogTabs> {
  int selectedIndex = 0;
  List<String> tabMenu = [
    'Natural',
    'News & Politics',
    'Entertainment',
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          tabMenu.length,
          (index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 02,
              ),
              child: Container(
                width: SizeConfig.kDefaultSize * 34.6,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: SizeConfig.kDefaultSize * 0.2,
                  ),
                  color: selectedIndex == index
                      ? primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.kDefaultSize * 3,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.kDefaultSize * 3,
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.kDefaultSize * 3,
                      ),
                      child: Text(
                        tabMenu[index],
                        textScaleFactor: 1,
                        style: labelTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 04,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index
                              ? Colors.white
                              : primaryColor,
                        ),
                        
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
