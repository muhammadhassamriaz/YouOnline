import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:youonline/widgets/you_online_text_button2.dart';
import 'package:transparent_image/transparent_image.dart';

class UserPage extends StatelessWidget {
  final String pageName;
  final String pageInfo;
  final String imageURL;
  final bool isFolloWidget;
  final VoidCallback callback;

  const UserPage({
    Key key,
    @required this.pageName,
    @required this.pageInfo,
    @required this.imageURL,
    this.callback,
    this.isFolloWidget = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    return Row(
      children: [
        Container(
          width: width * .14,
          height: width * .14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageURL,
            ),
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pageName ?? 'YouOnline',
                style: subheadingTextStyle.copyWith(
                  fontSize: width * .045,
                ),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: height * .005,
              ),
              Text(
                pageInfo ?? '',
                style: labelTextStyle.copyWith(
                  fontSize: width * .035,
                  color: hintTextColor,
                ),
                maxLines: 1,
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * .02,
        ),
        if (isFolloWidget)
          Container(
            width: width * .2,
            child: YouOnlineButton2(
              title: "Follow",
              callback: () {
                callback();
              },
            ),
          ),
      ],
    );
  }
}
