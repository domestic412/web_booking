import 'package:flutter/material.dart';

Widget buiderHeader(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [Image.asset('assets/images/logo3d.png')],
    ),
  );
}
