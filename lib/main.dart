import 'package:flutter/services.dart';
import 'package:youonline/bloc/connectivity.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/services/navigation_service.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './utils/globals.dart' as globals;
import 'app_router.dart';
import 'locator.dart';

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
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.myBloc = BlocClass(true);
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
        child: StreamBuilder<bool>(
          stream: globals.myBloc,
          builder: (context, snapshot) {
            return MaterialApp(
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
              onGenerateRoute: AppRoute.generateRoute,
              initialRoute: AppRoute.splashScreen,
              navigatorKey: locator<NavigationService>().navigatorKey,
            );
          },
        ),
      ),
    );
  }
}
