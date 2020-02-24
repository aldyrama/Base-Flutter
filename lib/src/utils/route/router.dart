import 'package:base_project_flutter/src/utils/route/route_name.dart';
import 'package:base_project_flutter/src/utils/route/undifined_view.dart';
import 'package:base_project_flutter/src/views/dashboard/dashboard_view.dart';
import 'package:base_project_flutter/src/views/login/login_view.dart';
import 'package:base_project_flutter/src/views/product/product.dart';
import 'package:base_project_flutter/src/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    ///use the argument if you want to send data to another page
    ///    case ExampleRoute:
    ///       return MaterialPageRoute(builder: (context) => ExamplePage(argument: getArgument));
    var getArgument = settings.arguments;

    switch (settings.name) {
      case SplashScreen:
        return MaterialPageRoute(builder: (context) => SplashPage());
      case Dashboard:
        return MaterialPageRoute(builder: (context) => DashboardPage());
      case Login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Movie:
        return MaterialPageRoute(builder: (context) => ProductPage());
      default:
        return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name,));
    }
  }
}