import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';

Container WidgetTextField(TextEditingController controller, double? width) {
  return Container(
    width: width ?? double.infinity,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      style: style12_black,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        )),
      ),
    ),
  );
}

Container WidgetTextFieldSearch(
    {required TextEditingController controller, required double? width}) {
  return Container(
    // width: 300,
    width: width,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      style: style12_black,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10),
        isDense: true,
        hintText: 'Enter text to search...',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        )),
      ),
    ),
  );
}
