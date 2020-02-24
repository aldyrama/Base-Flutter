import 'package:base_project_flutter/src/network/network_manager.dart';
import 'package:base_project_flutter/src/utils/route/router.dart';
import 'package:base_project_flutter/src/utils/route/undifined_view.dart';
import 'package:base_project_flutter/src/views/dashboard/dashboard_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  void initState() {
    NetworkManager.initAPIManager(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "MyApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'YOURFONT',
          pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              }
          )
      ),
      navigatorKey: NetworkManager.alice.getNavigatorKey(),
      navigatorObservers: [routeObserver],
      home: new DashboardPage(),
      onGenerateRoute: Router().generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedView(
            name: settings.name,
          )
      ),
    );
  }
}
