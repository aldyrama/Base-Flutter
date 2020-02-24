
import 'package:base_project_flutter/src/utils/route/my_app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard Flutter MVVM"),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Container(
              alignment: Alignment.center,
              child: buildButton()
            )
        )
    );
  }

  Widget buildButton(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () => MyAppNavigator.goToLogin(context),
            child:  Text("Login", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.black,
          onPressed: () => MyAppNavigator.goToMovie(context),
          child:  Text("Product", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
