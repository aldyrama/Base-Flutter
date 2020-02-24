import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

Future showOKModal(BuildContext context,
    {String title = "",
      String message = "",
      Function onOK = null,
      bool doCallbackBeforePop = true,
      bool isDismissable = true}) async {

  return showSimpleModal(context,title: title,message: message,onSubmit: onOK,doCallbackBeforePop: doCallbackBeforePop,isCancel: false,isDismissable: isDismissable);

}

Size getSizeOfContext(BuildContext context){
  return MediaQuery.of(context).size;
}

Future showSimpleModal(BuildContext context,
    {String title = "",
      String message = "",
      String cancelTitle = "Cancel",
      String submitTitle = "OK",
      bool isCancel = true,
      Function onCancel = null,
      Function onSubmit = null,
      bool doCallbackBeforePop = true,
      bool isDismissable = true}) async {

  if(context == null){
    return null;
  }

  Widget submitButton = Container(
    child: RaisedButton(
      color: Colors.black,
      child: Text(submitTitle, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      onPressed: () async {
        if (onSubmit != null) {
          if (doCallbackBeforePop) {
            await onSubmit();
          }
          await Navigator.of(context).pop();
          if (!doCallbackBeforePop) {
            await onSubmit();
          }
        } else {
          Navigator.of(context).pop();
        }
      },
    ),
  );

  Widget cancelButton = RaisedButton(
    child: Text(cancelTitle),
    onPressed: () async {
      if (onCancel != null) {
        await onCancel();
      }
      await Navigator.of(context).pop();
    },
  );

  List<Widget> widgetList = [submitButton];
  if (isCancel) {
    widgetList.add(cancelButton);
  }

  return showDialog(
    context: context,
    barrierDismissible: isDismissable,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              message == null
                  ? Container(
                height: 1.0,
              )
                  : Text(message, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'BrandonText'), textAlign: TextAlign.center),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 50.0,
                  child: submitButton
              )
//            actions: widgetList,
            ],
          )
      );
    },
  );
}
