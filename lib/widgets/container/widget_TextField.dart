import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';

Container WidgetTextField(
    {required TextEditingController controller,
    double? width,
    int? minLines,
    int? maxLines,
    String? hint,
    ValueChanged? function}) {
  return Container(
    width: width ?? double.infinity,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      onSubmitted: function,
      minLines: minLines,
      maxLines: maxLines,
      style: style12_black,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        )),
      ),
    ),
  );
}

Container WidgetTextFieldSearch(
    {required TextEditingController controller,
    double? width,
    ValueChanged? onSubmitted}) {
  return Container(
    // width: 300,
    width: width,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      onSubmitted: onSubmitted,
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
