// import 'package:flutter/material.dart';

// class ListSizeQuanlity extends StatefulWidget {
//   const ListSizeQuanlity({super.key});

//   @override
//   State<ListSizeQuanlity> createState() => _ListSizeQuanlityState();
// }

// enum Size {
//   adc('20DC'),
//   user('user');

//   const Size(this.label);
//   final String? label;
// }

// class _ListSizeQuanlityState extends State<ListSizeQuanlity> {
//   TextEditingController _inputQuanlity = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text('Số lượng: '),
//             const SizedBox(
//               width: 10,
//             ),
//             Container(
//               height: 50,
//               width: 100,
//               child: TextField(
//                 controller: _inputQuanlity,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           children: [
//             Text('Size: '),
//             const SizedBox(
//               width: 10,
//             ),
//             Container(
//               height: 50,
//               width: 100,
//               child: TextField(
//                 controller: _inputQuanlity,
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
