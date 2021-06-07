import 'package:flutter/services.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/automotive/add_product.dart';
import 'package:youonline/route/splash_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: primaryColor,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<WidgetProvider>(
            create: (_) => WidgetProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider<UserProvider>(
            create: (_) => UserProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider<DataProvider>(
            create: (_) => DataProvider(),
          ),
          ChangeNotifierProvider<TimelineProvider>(
            create: (_) => TimelineProvider(),
          ),
          ChangeNotifierProvider<PostProvider>(
            create: (_) => PostProvider(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            title: 'You Online',
            builder: BotToastInit(),
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            theme: ThemeData(
              primaryColor: primaryColor,
              primarySwatch: primarySwatchColor,
              appBarTheme: AppBarTheme(
                brightness: Brightness.light,
              ),
            ),
            home: SplashScreen  (),
          ),
        ),
      ),
    );
  }
}
