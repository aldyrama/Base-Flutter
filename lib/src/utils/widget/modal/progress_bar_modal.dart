import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBarModal extends StatelessWidget {
  final bool inAsyncCall;
  final bool center;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset offset;
  final bool dismissible;
  final Widget child;
  final EdgeInsets edgeInsets;

  ProgressBarModal({
    Key key,
    @required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.center = true,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.edgeInsets,
    this.dismissible = false,
    @required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      Widget layOutProgressIndicator;
      if (!center)
        layOutProgressIndicator = Container(
            margin: edgeInsets,
            alignment: Alignment.topCenter,
            child: progressIndicator);
      else {
        layOutProgressIndicator = Center(child: progressIndicator);
//        layOutProgressIndicator = Positioned(
//          child: progressIndicator,
//          left: offset.dx,
//          top: offset.dy,
//        );
      }
      final modal = [
        new Opacity(
          child: new ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }
}
