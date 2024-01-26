// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// class DropdownButton1 extends StatefulWidget {
//   const DropdownButton1({super.key});

//   @override
//   State<DropdownButton1> createState() => _DropdownButton1State();
// }

// String selectedValue = 'bk';

// class _DropdownButton1State extends State<DropdownButton1> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//       // style: ,
//       items: const [
//         DropdownMenuItem(
//           value: 'bk',
//           child: Text('CHOOSE'),
//         ),
//         DropdownMenuItem(
//           value: 'cntr',
//           child: Text('CHOOSE'),
//         ),
//       ],
//       value: selectedValue,
//       onChanged: (String? value) {
//         setState(() {
//           selectedValue = value!;
//         });
//       },
//       buttonStyleData: ButtonStyleData(
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(5)),
//         //height: 40,
//       ),
//       menuItemStyleData: const MenuItemStyleData(
//         height: 40,
//       ),
//     ));
//   }
// }
