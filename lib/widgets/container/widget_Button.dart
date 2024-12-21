import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';

ElevatedButton WidgetButton(
    {required String text,
    required ButtonStyle style,
    required VoidCallback onPressed}) {
  return ElevatedButton(
    style: style,
    onPressed: onPressed,
    child: Text(text, style: style12_white),
  );
}

// ElevatedButton.styleFrom(
//   backgroundColor: haian,
//   minimumSize: Size(100, 35),
// ),
