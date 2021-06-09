import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/automotive_details.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/route/automotive/agreement_status.dart';
import 'package:youonline/widgets/you_online_button.dart';

class AutomotiveAgreementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: Container(
                  width: width * .35,
                  height: width * .35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        safetyFirstIcon,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Center(
                child: Text(
                  'Safety first!',
                  style: headingTextStyle.copyWith(
                    fontSize: SizeConfig.kDefaultSize * 6,
                  ),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Center(
                child: Text(
                  "We review all ads to keep everyone on\nYouOnline safe and happy.",
                  textAlign: TextAlign.center,
                  style: labelTextStyle.copyWith(
                    fontSize: width * .04,
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                "Your ad will not go live if it is:",
                style: subheadingTextStyle.copyWith(
                  fontSize: width * .045,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              const AgreeementStatus(
                text:
                    "For any prohibited item or activity that violates your country law",
              ),
              SizedBox(
                height: height * .02,
              ),
              const AgreeementStatus(
                text: "In the wrong category",
              ),
              SizedBox(
                height: height * .02,
              ),
              const AgreeementStatus(
                text: "Placed multiple times, or in multiple categories",
              ),
              SizedBox(
                height: height * .02,
              ),
              const AgreeementStatus(
                text: "With fraudulent or misleading information",
              ),
              SizedBox(
                height: height * .05,
              ),
              YouOnlineButton(
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AutomotiveDetailScreen(),
                    ),
                  );
                },
                title: "Yes, I agree",
              ),
              SizedBox(
                height: height * .02,
              ),
              YouOnlineButton(
                callback: () {},
                title: "Cancel",
                color: Theme.of(context).scaffoldBackgroundColor,
                textColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
