// import 'package:flutter/material.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/eqc_quote/model_quote_list.dart';
// import 'package:intl/intl.dart';
// import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

// class DataTableQuote extends DataTableSource {
//   List<EQCQuoteList>? data;
//   String? _dt1;
//   String? _dt2;
//   // Color? _color;

//   DataTableQuote({this.data});

//   List<EQCQuoteList> list_filter(String query) {
//     return data!
//         .where((item) =>
//             (item.portDepot?.contains(query.toUpperCase()) ?? false) ||
//             (item.quoteDate?.contains(query.toUpperCase()) ?? false) ||
//             (item.quoteNo?.contains(query.toUpperCase()) ?? false) ||
//             (item.quoteCcy?.contains(query.toUpperCase()) ?? false) ||
//             (item.exRate?.toString().contains(query.toUpperCase()) ?? false) ||
//             (item.quoteStatus?.contains(query.toUpperCase()) ?? false) ||
//             (item.quoteUser?.contains(query.toUpperCase()) ?? false) ||
//             (item.approveUser?.contains(query.toUpperCase()) ?? false) ||
//             (item.approveDate?.contains(query.toUpperCase()) ?? false))
//         .toList();
//   }

//   @override
//   DataRow? getRow(int index) {
//     if (index >= data!.length) {
//       return null;
//     }
//     final rowData = data![index];
//     rowData.portDepot ??= '';
//     rowData.quoteNo ??= '';
//     rowData.quoteCcy ??= '';
//     rowData.exRate ??= 0;
//     rowData.quoteStatus ??= '';
//     rowData.quoteUser ??= '';
//     rowData.approveUser ??= '';
//     rowData.quoteDate != null
//         ? _dt1 = DateFormat("dd-MM-yyyy")
//             .format(DateTime.parse(rowData.quoteDate!))
//         : _dt1 = '';
//     rowData.approveDate != null
//         ? _dt2 = DateFormat("dd-MM-yyyy")
//             .format(DateTime.parse(rowData.quoteDate!))
//         : _dt2 = '';
//     // rowData.ketQua == Accept ? _color = green : _color = red;

//     return DataRow(
//       onSelectChanged: (value) {
//         quoteController.eqcQuoteId.value = data![index].eqcQuoteId!;
//         controller.selectWidget.value = quoteDetails;
//       },
//       cells: [
//       DataCell(SizedBox(
//         width: 40,
//         child: Center(
//           child: Text(
//             (index + 1).toString(),
//             style: style_text_Table_small,
//           ),
//         ),
//       )),
//       DataCell(Text(
//         rowData.portDepot!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.quoteNo!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         _dt1!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.quoteCcy!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.exRate!.toString(),
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.quoteStatus!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.quoteUser!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.approveUser!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         _dt2!,
//         style: style_text_Table_small,
//       )),
//       // DataCell(ElevatedButton(onPressed: (){
//       //   controller.selectWidget.value = quoteDetails;
//       // }, child: Text('Details'))),
//     ]);
//   }

//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => false;

//   @override
//   // TODO: implement rowCount
//   int get rowCount => data!.length;

//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => 0;
// }
