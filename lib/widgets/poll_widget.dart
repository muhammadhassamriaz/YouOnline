import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';

class PollWidget extends StatefulWidget {
  final List<Options> options;

  const PollWidget({
    Key key,
    @required this.options,
  }) : super(key: key);

  @override
  _PollWidgetState createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  int selectedIndex = -1;
  bool isPressed = false;
  int percentage;

  @override
  Widget build(BuildContext context) {
    var _postProvider = Provider.of<PostProvider>(context);
    var _userProvider = Provider.of<UserProvider>(context).user;
    if (widget.options != null && widget.options.length > 0) {
      widget.options.forEach((mainElement) {
        if (mainElement.votes != null && mainElement.votes.length > 0) {
          mainElement.votes.forEach((element) {
            if (element.userId == _userProvider.userId) {
              selectedIndex = widget.options.indexOf(mainElement);
              isPressed = true;
              if (mainElement.percentage != null) {
                percentage = mainElement.percentage;
              } else {
                percentage = 100;
              }
            }
          });
        }
      });
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.kDefaultSize * 2,
        ),
        Wrap(
          children: List.generate(
            widget.options.length,
            (index) {
              return TextButton(
                onPressed: () async {
                  if (!isPressed) {
                    setState(() {
                      selectedIndex = index;
                      isPressed = true;
                    });
                    percentage = await _postProvider.createVote(
                      context: context,
                      postId: widget.options[index].postId.toString(),
                      optionId: widget.options[index].id.toString(),
                    );
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (selectedIndex == index) {
                        return searchContainerColor;
                      } else {
                        return Colors.transparent;
                      }
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (isPressed) {
                        return Colors.transparent;
                      } else {
                        return Colors.black12;
                      }
                    },
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 3,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}. ',
                        style: hintTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 04,
                          color: selectedIndex == index
                              ? Colors.black
                              : hintTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * .03,
                      ),
                      Expanded(
                        child: Text(
                          '${widget.options[index].text.capitalize()}',
                          style: hintTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 04,
                            color: selectedIndex == index
                                ? Colors.black
                                : hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (percentage != null)
                        SizedBox(
                          width: SizeConfig.kDefaultSize * 2,
                        ),
                      if (percentage != null &&
                          isPressed &&
                          selectedIndex == index)
                        Text(
                          '$percentage %',
                          style: hintTextStyle.copyWith(
                            fontSize: SizeConfig.kDefaultSize * 04,
                            color: selectedIndex == index
                                ? Colors.black
                                : hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 2,
                      ),
                      if (selectedIndex == index && isPressed)
                        Icon(
                          Icons.check_box,
                          size: SizeConfig.kDefaultSize * 6,
                          color: primaryColor,
                        ),
                      if (!isPressed)
                        Icon(
                          Icons.check_box_outline_blank,
                          size: SizeConfig.kDefaultSize * 6,
                          color: hintTextColor,
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
