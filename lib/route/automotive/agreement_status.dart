import 'package:flutter/material.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/styles.dart';

class AgreeementStatus extends StatelessWidget {
  final String text;

  const AgreeementStatus({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: width * .05,
          width: width * .05,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                doneIcon,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * .04,
        ),
        Expanded(
          child: Text(
            text,
            style: labelTextStyle.copyWith(
              fontSize: width * .04,
            ),
            textScaleFactor: 1,
          ),
        ),
      ],
    );
  }
}
