import 'package:youonline/utils/size_config.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialAccountScreen extends StatelessWidget {
  TextEditingController _facebookTextEditingController =
          TextEditingController(),
      _twitterTextEditingController = TextEditingController(),
      _vkontakeTextEditingController = TextEditingController(),
      _linkedInTextEditingController = TextEditingController(),
      _youtubeTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 4,
            ),
            HeaderTitle(
              title: 'Social Accounts',
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 10,
                      ),
                      YouOnlineText(
                        text: "Facebook",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _facebookTextEditingController,
                        hintText: "Url",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "Twitter",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _twitterTextEditingController,
                        hintText: "Url",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "Vkontakte",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _vkontakeTextEditingController,
                        hintText: "Url",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "LinkedIN",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _linkedInTextEditingController,
                        hintText: "Url",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 5,
                      ),
                      YouOnlineText(
                        text: "YouTube",
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 1,
                      ),
                      YouOnlineTextField(
                        textEditingController: _youtubeTextEditingController,
                        hintText: "Url",
                        obsecure: true,
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: SizeConfig.kDefaultSize * 10,
                      ),
                      YouOnlineButton(
                        callback: () {},
                        title: "Save",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
