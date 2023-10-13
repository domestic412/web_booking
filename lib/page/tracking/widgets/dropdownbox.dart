
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButtonSearch extends StatefulWidget {
  const DropdownButtonSearch({super.key});

  @override
  State<DropdownButtonSearch> createState() => _DropdownButtonSearchState();
}

String selectedValue = 'bk';

class _DropdownButtonSearchState extends State<DropdownButtonSearch> {

  @override
  Widget build(BuildContext context) {
    return
    DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          // style: style13_black,
          items: const [
            DropdownMenuItem(value: 'bk',child: Text('BL No. or Booking No.'),),
            DropdownMenuItem(value: 'cntr',child: Text('Container No.'),),
          ],
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(5)
            ),
            height: 40,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ));
  }
}