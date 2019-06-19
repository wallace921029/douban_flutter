import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;

  CustomRoute({this.widget})
  :super(
    pageBuilder: (BuildContext buidlContext, Animation<double> animation1, Animation<double> animation2) {
      return widget;
    },
    transitionsBuilder: (BuildContext buildContext, Animation<double> animation1, Animation<double> animation2, Widget child) {
      // 渐变过度
      // return FadeTransition(
      //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //     parent: animation1,
      //     curve: Curves.ease
      //   )),
      //   child: child
      // );

      // 从下往上滑
      return SlideTransition(
        // Offest(0, 1) 是因为屏幕归 1 化，左上角坐标为 (0, 0)，右下角坐标为 (1, 1)
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn
        )),
        child: child
      );
    }
  );
}