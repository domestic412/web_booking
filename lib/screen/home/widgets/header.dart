import 'package:flutter/material.dart';

Widget buiderHeader(BuildContext context) {
  return Container(
    height: 100,
    width: 200,
    padding: EdgeInsets.all(15),
    color: Colors.white,
    // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Image.asset(
      'assets/images/hact_logo.png',
      // fit: BoxFit.fill,
    ),
  );
}
