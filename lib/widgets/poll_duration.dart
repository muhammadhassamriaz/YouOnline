import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class PollDuration extends StatefulWidget {
  @override
  _PollDurationState createState() => _PollDurationState();
}

class _PollDurationState extends State<PollDuration> {
  String value = "24 hours";
  List<String> pollDuration = [
    "24 hours",
    "1 Week",
    "1 Month",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 3,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: SizeConfig.kDefaultSize * 10,
        width: SizeConfig.kDefaultSize * 30,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.grey,
          //   width: SizeConfig.kDefaultSize * .2,
          // ),
          borderRadius: BorderRadius.circular(
            SizeConfig.kDefaultSize * 3,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.kDefaultSize * 2,
          ),
          child: DropdownButton<String>(
            items: pollDuration.map(
              (String e) {
                return DropdownMenuItem<String>(
                  child: Text(
                    e,
                    style: labelTextStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.kDefaultSize * 3.2,
                    ),
                    maxLines: 1,
                    textScaleFactor: 1,
                  ),
                  value: e,
                );
              },
            ).toList(),

            underline: Container(),
            isExpanded: true,
            // focusColor: primaryColor,

            dropdownColor: searchContainerColor,
            value: value,
            onChanged: (valuee) {
              setState(() {
                value = valuee;
              });
            },
            icon: Icon(
              Icons.arrow_drop_down_circle,
              size: SizeConfig.kDefaultSize * 6,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
