import 'package:flutter/material.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback callback;
  final String imageUrl;
  final String title;
  final String subTitle;

  const SearchWidget({
    Key key,
    @required this.callback,
    @required this.imageUrl,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * .01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * .12,
                height: width * .12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl,
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
                      title,
                      maxLines: 1,
                      style: labelTextStyle.copyWith(
                        fontSize: width * .04,
                      ),
                    ),
                    Text(
                      subTitle,
                      maxLines: 1,
                      style: labelTextStyle.copyWith(
                        fontSize: width * .032,
                        color: hintTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .02,
        ),
        Divider(
          thickness: 8,
          height: 0,
        ),
      ],
    );
  }
}
