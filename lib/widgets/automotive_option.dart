import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/styles.dart';

class AutomotiveOption extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback callback;

  const AutomotiveOption({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title ?? "Add Product",
                style: subheadingTextStyle.copyWith(
                  fontSize: width * .045,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: width * .045,
              ),
            ],
          ),
          SizedBox(
            height: height * .005,
          ),
          Text(
            subtitle ?? "Grande, sale, audi,",
            style: labelTextStyle.copyWith(
              fontSize: width * .04,
              color: hintTextColor,
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
