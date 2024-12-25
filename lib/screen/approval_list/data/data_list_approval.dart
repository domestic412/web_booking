// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:intl/intl.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/list_approval/model_detail_approval.dart';
// import 'package:web_booking/model/list_approval/model_approval_list.dart';
// import 'package:web_booking/storage_controller.dart/controller_image.dart';

// class DataTableApproval extends DataTableSource {
//   List<ApprovalList>? data;
//   String? _dt;
//   Color? _color;
//   String? _trangthai;
//   DetailApproval _detailApproval = DetailApproval();

//   DataTableApproval({this.data});

//   List<ApprovalList> list_filter(String query) {
//     return data!
//         .where((item) =>
//             (item.cntrno?.contains(query.toUpperCase()) ?? false) ||
//             (item.shipperName?.contains(query) ?? false) ||
//             (item.shipperNote?.contains(query.toUpperCase()) ?? false) ||
//             (item.trangThaiYc?.contains(query.toUpperCase()) ?? false) ||
//             (item.updateTime?.contains(query.toUpperCase()) ?? false))
//         .toList();
//   }

//   List<ApprovalList> filter_trangthaiYC(String query) {
//     return data!
//         .where((item) =>
//             (item.trangThaiYc?.contains(query.toUpperCase()) ?? false))
//         .toList();
//   }

//   @override
//   DataRow? getRow(int index) {
//     if (index >= data!.length) {
//       return null;
//     }
//     final rowData = data![index];
//     rowData.cntrno ??= '';
//     rowData.shipperName ??= '';
//     rowData.shipperNote ??= '';
//     rowData.updateUser ??= '';
//     rowData.updateTime != null
//         ? _dt = DateFormat("dd-MM-yyyy  hh:mm a")
//             .format(DateTime.parse(rowData.updateTime!))
//         : _dt = '';
//     if (rowData.trangThaiYc == 'A') {
//       _color = green;
//       _trangthai = 'Đồng ý';
//     } else if (rowData.trangThaiYc == 'C') {
//       _color = grey;
//       _trangthai = 'Chờ Duyệt';
//     } else if (rowData.trangThaiYc == 'R') {
//       _color = red;
//       _trangthai = 'Từ chối';
//     } else {
//       _color = grey;
//       _trangthai = '###';
//     }

//     return DataRow(cells: [
//       DataCell(SizedBox(
//         width: 40,
//         child: Center(
//             child: Text(
//           (index + 1).toString(),
//           style: style_text_Table_small,
//         )),
//       )),
//       DataCell(Center(
//           child: Text(
//         rowData.cntrno!,
//         style: style_text_Table_small,
//       ))),
//       DataCell(Center(
//           child: Text(
//         rowData.shipperName!,
//         style: style_text_Table_small,
//       ))),
//       DataCell(Center(
//         child: Container(
//           width: 150,
//           padding: EdgeInsets.only(top: 10, bottom: 10),
//           child: ElevatedButton(
//             onPressed: () async {
//               await _detailApproval.fetchDetailApproval(
//                   id: data![index].requestCheckContsId!);
//               // add id request for image request
//               // id_request_for_image = data![index].id;
//               String? id = data![index].requestCheckContsId!;
//               imageController.updateIdImageController(id: id.obs);
//               // navigator widget detailApproval
//               controller.selectWidget.value = detailApproval;
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: _color,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)))),
//             child: Text(
//               _trangthai!,
//               style: text_style_status,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       )),
//       DataCell(Center(
//           child: Text(
//         rowData.updateUser!,
//         style: style_text_Table_small,
//       ))),
//       DataCell(Center(
//           child: Text(
//         _dt!,
//         style: style_text_Table_small,
//       ))),
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
