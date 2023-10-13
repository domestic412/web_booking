import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../assets/constants/variable.dart';



const List<String> list = <String>['EN', 'VN'];

class DropdownLeaguage extends StatefulWidget {
  const DropdownLeaguage({super.key});

  @override
  State<DropdownLeaguage> createState() => _DropdownLeaguageState();
}

class _DropdownLeaguageState extends State<DropdownLeaguage> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down, color: white),
      elevation: 16,
      dropdownColor: haian,
      underline: Container(color: haian,),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          if (dropdownValue == 'EN') {
            setLeaguageEN(context);
          } else {
            setLeaguageVN(context);
          }
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value,
        child: Text(value, style: TextStyle(color: white),),
        );
      }).toList()
      );
  }

  Future<void> setLeaguageEN(BuildContext context) => context.setLocale(const Locale('en', 'EN'));
  Future<void> setLeaguageVN(BuildContext context) => context.setLocale(const Locale('vi', 'VN'));
}