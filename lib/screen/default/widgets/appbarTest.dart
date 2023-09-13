

import 'package:flutter/material.dart';

import '../../../assets/constants.dart/color.dart';
import '../../../assets/constants.dart/style.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              color: haian,
              child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 1430,
        child: Text('Welcome to Hai An Transport And Stevedoring Joint Stock Company', style: style14_white, textAlign: TextAlign.left,),
      ),
      SizedBox(
        width: 50,
        child: Text('English', style: style14_white, textAlign: TextAlign.left,),
      ),
      SizedBox(
        width: 20,
        child: Icon(Icons.arrow_drop_down, color: white,),
      )
    ],
              ),
            );
  }
}