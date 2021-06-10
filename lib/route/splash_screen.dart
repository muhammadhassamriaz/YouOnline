import 'package:provider/provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/login_registration_route.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/prefs.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:youonline/widgets/intro_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeRoute();
  }
  changeRoute() {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () {
        Future.delayed(
          Duration(
            seconds: 1,
          ),
          () async {
            String userID = await getUserToken();
            if (userID == null) {
              Future.delayed(
                Duration(seconds: 0),
                () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginRegistrationScreen(),
                    ),
                    (route) => false,
                  );
                },
              );
            } else {
              var _timelineProvider =
                  Provider.of<TimelineProvider>(context, listen: false);
              Provider.of<UserProvider>(context, listen: false)
                  .changeUserAuthenticationToken(userID);
              await Provider.of<UserProvider>(context, listen: false)
                  .getUserData(context: context);
              Provider.of<UserProvider>(context, listen: false)
                  .getAllUserStories();
              Provider.of<UserProvider>(context, listen: false)
                  .getTimelineUserProfile(
                userId: Provider.of<UserProvider>(context, listen: false)
                    .user
                    .userId
                    .toString(),
              );
              await _timelineProvider.getTimeLinePosts(
                context: context,
                pageNo: 1,
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.SPLASH_SCREEN,
              ),
              fit: BoxFit.fill,
            ),
            // color: Color(0xff30CB3A),
          ),
          child: Column(
            children: [
              Spacer(),
              IntroText(),
              SizedBox(
                height: SizeConfig.kDefaultSize * 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
