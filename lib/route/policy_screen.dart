import 'package:flutter/material.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/title_header.dart';

class PolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.kDefaultSize * 3,
            ),
            HeaderTitle(
              title: "Privacy Policy",
            ),
            SizedBox(
              height: SizeConfig.kDefaultSize * 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(
                    SizeConfig.kDefaultSize * 3,
                  ),
                  child: Text(
                    '1- It is prohibited to publish content that contravenes general societal laws.\n\n2 - All your personal data on the site is encrypted and is not displayed to any party without your permission.\n\n3- Do not publish extremist or offensive content to any individual, government or civil entity.\n\n4 -It is prohibited to sell cosmetic products, medicines and slimming materials without a commercial license issued by a government agency.\n\n5 - At YouOnline we do not take responsibility for what is published by users.\n\n6 - In the resolution of any infringing content on the Site that you may report.\n\n7- If any of the above instructions are violated by the user, the offending content will be automatically deleted from the site.\n\n8 - An initial warning will be sent to violators of the site\'s use laws YouOnline Inc',
                    style: labelTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 3.5,
                    ),
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
