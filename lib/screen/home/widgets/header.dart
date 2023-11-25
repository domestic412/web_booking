import 'package:flutter/material.dart';

Widget buiderHeader(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Image.asset('assets/images/logo3d.png', fit: BoxFit.fill,),
  );
}
