



     import 'package:flutter/material.dart';

     ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
      {required BuildContext context,
      required String message,
      required Color color}) {
    return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
      action:  SnackBarAction(label: 'YES', onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Container(),)); },

    ),
  ));
}
   // TODO اللهم صل وسلم وبارك علي سيدما محمد وعلي ال محمد كما صليت علي ابراهيم وعلي ال ابراهيم في العالمين انك حميد مجيد