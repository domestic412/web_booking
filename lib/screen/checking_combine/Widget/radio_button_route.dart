import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';

class RadioButtonRoute extends StatefulWidget {
  const RadioButtonRoute({super.key});

  @override
  State<RadioButtonRoute> createState() => _RadioButtonRouteState();
}

List<int> optionsRoute = [0, 1];
int currentOptionsRoute = optionsRoute[0];

class _RadioButtonRouteState extends State<RadioButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            // margin: EdgeInsets.only(right: 50),
            child: ListTile(
              title: Text('domestic'.tr),
              titleTextStyle: style12_black,
              contentPadding: EdgeInsets.all(0),
              leading: Radio(
                value: optionsRoute[0],
                groupValue: currentOptionsRoute,
                activeColor: normalColor,
                onChanged: (value) {
                  setState(() {
                    currentOptionsRoute = value!;
                    // print(currentOptionsRoute);
                  });
                },
              ),
            ),
          ),
          Container(
            width: 200,
            child: ListTile(
              title: Text('overseas'.tr),
              titleTextStyle: style12_black,
              contentPadding: EdgeInsets.all(0),
              leading: Radio(
                value: optionsRoute[1],
                groupValue: currentOptionsRoute,
                activeColor: normalColor,
                onChanged: (value) {
                  setState(() {
                    currentOptionsRoute = value!;
                    // print(currentOptionsRoute);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
