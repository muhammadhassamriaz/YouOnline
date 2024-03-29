import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';

class PostHeader extends StatefulWidget {
  final bool isShared;
  PostHeader({
    Key key,
    this.isShared = false,
  }) : super(key: key);

  @override
  _PostHeaderState createState() => _PostHeaderState();
}

class _PostHeaderState extends State<PostHeader> {
  List<String> audience = [
    'Everyone',
    'Friends of Friends',
    'Friends',
    'Only me',
  ];

  String value;

  List<String> share = [
    'Share',
    'Send Message',
    'Tag',
  ];

  String value2 = 'Share';

  @override
  void initState() {
    super.initState();
    value = audience[0];
    Provider.of<WidgetProvider>(context, listen: false)
        .changePostPrivacyPolicyIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    var _postProvider = Provider.of<PostProvider>(context);
    double width = MediaQuery.of(context).size.width;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return Row(
      children: [
        Container(
          width: SizeConfig.kDefaultSize * 18,
          height: SizeConfig.kDefaultSize * 18,
          child: _userProvider.user?.avatar != null
              ? ClipOval(
                  child: FadeInImage.memoryNetwork(
                    image: _userProvider.user.avatar,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                  ),
                )
              : ClipOval(
                  child: Image.asset(
                    Assets.PROFILE_AVATAR,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        SizedBox(
          width: SizeConfig.kDefaultSize * 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_userProvider.user.firstName != null &&
                _userProvider.user.lastName != null)
              Row(
                children: [
                  Text(
                    _userProvider.user.firstName +
                        " " +
                        _userProvider.user.lastName +
                        " ",
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 03.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              )
            else
              Row(
                children: [
                  Text(
                    _userProvider.user.username,
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 03.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            if (_postProvider.feelings != null)
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 03,
                    height: SizeConfig.kDefaultSize * 03,
                    child: Image.asset(
                      "assets/images/" + _postProvider.feelings + ".png",
                    ),
                  ),
                  Text(
                    " feeling ${_postProvider.feelings}",
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 3.2,
                    ),
                  ),
                ],
              ),
            if (!widget.isShared)
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.kDefaultSize * 3,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      width: value.contains("of")
                          ? SizeConfig.kDefaultSize * 45
                          : value.contains("only")
                              ? SizeConfig.kDefaultSize * 25
                              : value.contains("everyone")
                                  ? SizeConfig.kDefaultSize * 30
                                  : SizeConfig.kDefaultSize * 25,
                      height: SizeConfig.kDefaultSize * 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.kDefaultSize * 3,
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(
                            SizeConfig.kDefaultSize * 2,
                          ),
                          child: PopupMenuButton<String>(
                            itemBuilder: (context) {
                              return audience.map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Text(
                                    str,
                                    style: labelTextStyle.copyWith(
                                      fontSize: width * .032,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  value,
                                  style: labelTextStyle.copyWith(
                                    fontSize: width * .032,
                                  ),
                                ),
                                SizedBox(
                                  width: width * .01,
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  size: width * .04,
                                ),
                              ],
                            ),
                            onSelected: (v) {
                              setState(() {
                                value = v;
                              });
                              if (value.toLowerCase().contains("everyone")) {
                                _widgetProvider.changePostPrivacyPolicyIndex(0);
                              } else if (value.toLowerCase().contains("of")) {
                                _widgetProvider.changePostPrivacyPolicyIndex(1);
                              } else if (value
                                  .toLowerCase()
                                  .contains("friends")) {
                                _widgetProvider.changePostPrivacyPolicyIndex(2);
                              } else if (value.toLowerCase().contains("only")) {
                                _widgetProvider.changePostPrivacyPolicyIndex(3);
                              } else {
                                _widgetProvider.changePostPrivacyPolicyIndex(0);
                              }
                              print(_widgetProvider.postPrivacyIndex);
                            },
                          )),
                    ),
                  ),
                  SizedBox(width: SizeConfig.kDefaultSize * 3),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
