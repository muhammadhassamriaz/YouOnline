import 'dart:io';

import 'package:youonline/route/create_blog_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';

class BlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kDefaultSize * 2,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              size: SizeConfig.kDefaultSize * 6,
            ),
          ),
          SizedBox(
            width: SizeConfig.kDefaultSize * 5,
          ),
          Text(
            'Blog',
            style: headingTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 6,
            ),
            textScaleFactor: 1,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateBlogScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.black26;
                  else
                    return searchContainerColor;
                },
              ),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.kDefaultSize * 4,
                    ),
                  );
                },
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  size: SizeConfig.kDefaultSize * 6,
                ),
                Text(
                  'Create',
                  style: labelTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 4,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: SizeConfig.kDefaultSize * 2,
          ),
        ],
      ),
    );
  }
}
