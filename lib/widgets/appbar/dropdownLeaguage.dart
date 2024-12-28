import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';

const List<String> list = <String>['VN', 'EN'];
String dropdownValue = 'EN';

class DropdownLeaguage extends StatefulWidget {
  const DropdownLeaguage({super.key});

  @override
  State<DropdownLeaguage> createState() => _DropdownLeaguageState();
}

class _DropdownLeaguageState extends State<DropdownLeaguage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10, right: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: haian),
      child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down, color: white),
          elevation: 16,
          dropdownColor: haian,
          underline: Container(
            color: haian,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
              if (dropdownValue == 'EN') {
                bool_lang = false;
                // setLeaguageEN(context);
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              } else {
                bool_lang = true;
                // setLeaguageVN(context);
                var locale = Locale('vi', 'VN');
                Get.updateLocale(locale);
              }
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: style14_white,
              ),
            );
          }).toList()),
    );
  }

  // Future<void> setLeaguageEN(BuildContext context) =>
  //     context.setLocale(const Locale('en', 'EN'));
  // Future<void> setLeaguageVN(BuildContext context) =>
  //     context.setLocale(const Locale('vi', 'VN'));
}
