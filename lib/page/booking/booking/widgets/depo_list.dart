// import 'package:flutter/material.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/model/schedule/model_voyage.dart';

// class ShowDepoList extends StatelessWidget {
//   const ShowDepoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return buildDepo();
//   }
// }

// FutureBuilder<Voyage> buildDepo() {
//   return FutureBuilder<Voyage>(
//       future: fetchVoyage,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           var data = snapshot.data!.depots;
//           // var name = data![0].depotName;
//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: DataTable(
//                 border: TableBorder.all(),
//                 sortColumnIndex: 0,
//                 dataRowMaxHeight: 70,
//                 columnSpacing: 30,
//                 columns: [
//                   DataColumn(
//                     label: Expanded(
//                         child: Center(
//                       child: SelectableText('Seq',
//                           style: style_text_Table_small_bold),
//                     )),
//                   ),
//                   DataColumn(
//                     label: Expanded(
//                         child: Center(
//                       child: SelectableText("DEPOT NAME",
//                           style: style_text_Table_small_bold),
//                     )),
//                   ),
//                   DataColumn(
//                     label: Expanded(
//                         child: Center(
//                       child: SelectableText("SIZE / QUANTITY",
//                           style: style_text_Table_small_bold),
//                     )),
//                   ),
//                   // DataColumn(
//                   //   label: Expanded(
//                   //       child: Center(
//                   //     child: SelectableText("SIZE",
//                   //         style: style_text_Table_small_bold),
//                   //   )),
//                   // ),
//                   // DataColumn(
//                   //   label: Expanded(
//                   //       child: Center(
//                   //     child: SelectableText("BOOKING",
//                   //         style: style_text_Table_small_bold),
//                   //   )),
//                   // ),
//                 ],
//                 rows: List.generate(data!.length, (index) {
//                   var dataDepo = data[index];
//                   nameDepo = dataDepo.depotName;
//                   idDepo = dataDepo.depotId;
//                   soluongContDepo = dataDepo.soluong;
//                   sizeContDepo = dataDepo.size;
//                   return DataRow(cells: [
//                     DataCell(Center(
//                         child: Text(
//                       (index + 1).toString(),
//                       style: style_text_Table_small,
//                     ))),
//                     DataCell(
//                       Center(
//                         child: Text(
//                           nameDepo.toString(),
//                           style: style_text_Table_small,
//                         ),
//                       ),
//                     ),
//                     DataCell(
//                       Center(
//                         child: RichText(
//                             text: TextSpan(
//                                 text: 'Size: $sizeContDepo \nSL:    ',
//                                 style: style_text_Table_small,
//                                 children: [
//                               TextSpan(
//                                   text: '$soluongContDepo',
//                                   style: style_text_small_14_red)
//                             ])),
//                       ),
//                     ),
//                     // DataCell(
//                     //   Center(
//                     //     child: Text(
//                     //       sizeContDepo.toString(),
//                     //       style: style_text_Table_small,
//                     //     ),
//                     //   ),
//                     // ),
//                     // DataCell(
//                     //   Center(
//                     //     child: SizedBox(
//                     //       height: 40,
//                     //       width: 60,
//                     //       child: TextField(
//                     //         textAlignVertical: TextAlignVertical.top,
//                     //         // style: text_style4,
//                     //         controller: soluongcntr,
//                     //         keyboardType: TextInputType.number,
//                     //         textAlign: TextAlign.center,
//                     //         inputFormatters: <TextInputFormatter>[
//                     //           LengthLimitingTextInputFormatter(4),
//                     //           FilteringTextInputFormatter.digitsOnly
//                     //         ],
//                     //         decoration: const InputDecoration(
//                     //           border: OutlineInputBorder(
//                     //               borderSide: BorderSide(
//                     //                   color: Colors.black, width: 5)),
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                     // DataCell(
//                     //   Center(
//                     //     child: ElevatedButton(
//                     //       onPressed: () {
//                     //         // DepoList(context);
//                     //       },
//                     //       style: ElevatedButton.styleFrom(
//                     //           backgroundColor: normalColor,
//                     //           shape: const RoundedRectangleBorder(
//                     //               borderRadius:
//                     //                   BorderRadius.all(Radius.circular(20)))),
//                     //       child: Container(
//                     //         padding: EdgeInsets.symmetric(horizontal: 20),
//                     //         child: Text(
//                     //           'Send Request',
//                     //           style: style_text_button_detail,
//                     //           textAlign: TextAlign.center,
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   ]);
//                 })),
//           );
//         }
//         return const Text('');
//       });
// }
