import 'package:base_project_flutter/src/utils/route/route_name.dart';
import 'package:flutter/material.dart';

class MyAppNavigator{
  ///create a navigator to get to the page you want here
  static void goToAllRoute(BuildContext context, String route){
    Navigator.pushNamed(context, route, arguments: route);
  }

  static void goToRemoveuntilDashboard(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(Dashboard, (Route<dynamic> route) => false);
  }

  static void goToLogin(BuildContext context){
    Navigator.pushNamed(context, Login);
  }

  static void goToMovie(BuildContext context){
    Navigator.pushNamed(context, Movie);
  }

}