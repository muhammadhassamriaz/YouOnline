import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:youonline/bloc/connectivity.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/provider/data_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/services/navigation_service.dart';
import 'package:youonline/utils/color.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setOptimalDisplayMode();
    super.initState();
  }

  Future<void> setOptimalDisplayMode() async {
    final List<DisplayMode> supported = await FlutterDisplayMode.supported;
    final DisplayMode active = await FlutterDisplayMode.active;

    final List<DisplayMode> sameResolution = supported
        .where((DisplayMode m) =>
            m.width == active.width && m.height == active.height)
        .toList()
          ..sort((DisplayMode a, DisplayMode b) =>
              b.refreshRate.compareTo(a.refreshRate));

    final DisplayMode mostOptimalMode =
        sameResolution.isNotEmpty ? sameResolution.first : active;

    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }

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
            return GestureDetector(
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
                onGenerateRoute: AppRoute.generateRoute,
                initialRoute: AppRoute.splashScreen,
                navigatorKey: locator<NavigationService>().navigatorKey,
              ),
            );
          },
        ),
      ),
    );
  }
}
