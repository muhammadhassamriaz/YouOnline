import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/submit_documents.dart';
import 'package:youonline/widgets/title_header.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerifyProfileScreen extends StatelessWidget {
  TextEditingController pageNameTextEditingController = TextEditingController(),
      messageTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            HeaderTitle(
              title: 'Verify Profile',
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Page Name",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 4.5,
                      ),
                      child: YouOnlineTextField(
                        textEditingController: pageNameTextEditingController,
                        hintText: "Automotive Updates",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineText(
                        text: "Message",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 4.5,
                      ),
                      child: YouOnlineTextField(
                        textEditingController: messageTextEditingController,
                        hintText: "Text",
                        maxLength: 5,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: Text(
                        'Upload documents',
                        style: subheadingTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 4,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: Text(
                        'Please upload a photo with your passport / ID & your distinct photo',
                        style: hintTextStyle.copyWith(
                          fontSize: SizeConfig.kDefaultSize * 3.5,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 5,
                    ),
                    VerifyProfileSubmitDocs(),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.kDefaultSize * 5,
                      ),
                      child: YouOnlineButton(
                        callback: () {},
                        title: "Send",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.kDefaultSize * 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
