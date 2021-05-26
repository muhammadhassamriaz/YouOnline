import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class InformationTile extends StatelessWidget {
  final String image;
  final String title;

  InformationTile({
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.kDefaultSize * 43,
      width: SizeConfig.kDefaultSize * 43,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 4,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            spreadRadius: 1.2,
            blurRadius: 14.2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.kDefaultSize * 10,
          ),
          SizedBox(
            height: SizeConfig.kDefaultSize * 18,
            width: SizeConfig.kDefaultSize * 18,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(
            height: SizeConfig.kDefaultSize * 2,
          ),
          Text(
            title,
            style: labelTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 4.5,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            textScaleFactor: 1,
          )
        ],
      ),
    );
  }
}
