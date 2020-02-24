
import 'dart:async';

import 'package:base_project_flutter/src/utils/route/my_app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), () => MyAppNavigator.goToRemoveuntilDashboard(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child:  Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("Welcome"),
          )
        )
    );
  }
}
