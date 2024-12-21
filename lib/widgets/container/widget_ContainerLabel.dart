import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';

Container WidgetContainerLabel(
    {required String label, required double? width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(6),
    margin: const EdgeInsets.all(5),
    color: const Color.fromARGB(255, 92, 117, 160),
    child: Text(
      label,
      style: style12_white,
    ),
  );
}
