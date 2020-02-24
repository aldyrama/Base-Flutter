
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavCustom extends StatelessWidget {

  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavCustom(
      {Key key,
        this.selectedIndex = 0,
        this.showElevation = true,
        this.iconSize = 24,
        this.backgroundColor,
        this.animationDuration = const Duration(milliseconds: 270),
        @required this.items,
        @required this.onItemSelected}) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
  }

  Widget _buildItem(BottomNavyBarItem item, bool isSelected) {
    return Container(
      child: AnimatedContainer(
        width: isSelected ? 100 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        alignment: Alignment.center,
//      padding: EdgeInsets.only(right: 120),
////      decoration: BoxDecoration(
////        color: isSelected ? item.activeColor.withOpacity(1.0) : backgroundColor,
////        borderRadius: BorderRadius.all(Radius.circular(50)),
////      ),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconTheme(
                        data: IconThemeData(
                            size: iconSize,
                            color: isSelected
                                ? item.activeColor
                                : item.inactiveColor == null
                                ? item.activeColor
                                : item.inactiveColor),
                        child: item.icon,
                      ),
                    ),
                    isSelected
                        ? DefaultTextStyle.merge(
                      style: TextStyle(
                          color: item.activeColor, fontWeight: FontWeight.bold),
                      child: item.title,
                    )
                        : SizedBox.shrink()
                  ],
                ),
                Visibility(
                  visible: isSelected  ? true : false,
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0),
                    height: 4.0,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6),),
                      color: Color(0xFFFA6162),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            if(showElevation)
              BoxShadow(color: Colors.black12, blurRadius: 2)
          ]
      ),
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  final ImageIcon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavyBarItem(
      {@required this.icon,
        @required this.title,
        this.activeColor = Colors.blue,
        this.inactiveColor}) {
    assert(icon != null);
    assert(title != null);
  }
}
