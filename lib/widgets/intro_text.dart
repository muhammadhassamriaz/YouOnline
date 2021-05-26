import 'package:flutter/material.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';

class IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text(
            "Meet new\npeople around the world!",
            textAlign: TextAlign.center,
            style: headingTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 6,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.kDefaultSize * 1,
        ),
        Center(
          child: Text(
            "Chat, Share, Videos, Photos, Music & more...",
            style: labelTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 3,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
