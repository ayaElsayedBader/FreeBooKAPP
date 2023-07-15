import 'package:flutter/material.dart';

extension MadQuHelper on BuildContext {
  double get widthScreen => MediaQuery.of(this).size.width;

  double get heightScreen => MediaQuery.of(this).size.height;
}

extension Nav on BuildContext {
  void navPush(Widget widget) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }  void navReplacement(Widget widget) {
    Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

}
