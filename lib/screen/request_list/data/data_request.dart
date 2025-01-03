// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:intl/intl.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/list_request/model_detail_request.dart';
// import 'package:web_booking/model/list_request/model_request_list.dart';
// import 'package:web_booking/storage_controller.dart/controller_image.dart';

// class DataTableRequest extends DataTableSource {
//   DetailRequest _detailRequest = DetailRequest();
//   List<RequestList>? data;
//   String? _dt;
//   Color? _color;
//   String? _trangthai;

//   DataTableRequest({this.data});

//   List<RequestList> list_filter(String query) {
//     return data!
//         .where((item) =>
//             (item.cntrno?.contains(query.toUpperCase()) ?? false) ||
//             (item.sizeType?.contains(query.toUpperCase()) ?? false) ||
//             (item.shipperNote?.contains(query.toUpperCase()) ?? false) ||
//             (item.noteHangTau?.contains(query.toUpperCase()) ?? false) ||
//             (item.trangThaiYc?.contains(query.toUpperCase()) ?? false) ||
//             (item.updateTime?.contains(query.toUpperCase()) ?? false))
//         .toList();
//   }

//   List<RequestList> filter_trangthaiYC(String query) {
//     return data!
//         .where((item) =>
//             (item.trangThaiYc?.toUpperCase().contains(query.toUpperCase()) ??
//                 false))
//         .toList();
//   }

//   @override
//   DataRow? getRow(int index) {
//     if (index >= data!.length) {
//       return null;
//     }
//     final rowData = data![index];
//     rowData.cntrno ??= '';
//     rowData.sizeType ??= '';
//     rowData.tenYeuCau ??= '';
//     rowData.noiDung ??= '';
//     rowData.shipperId ??= '';
//     rowData.trangThaiYc ??= '';
//     rowData.noteHangTau ??= '';
//     rowData.shipperNote ??= '';
//     rowData.userId ??= '';
//     rowData.updateTimeCheckRequest ??= '';
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
//           child: Text(
//             (index + 1).toString(),
//             style: style_text_Table_small,
//           ),
//         ),
//       )),
//       DataCell(Text(
//         rowData.tenYeuCau!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.cntrno!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Text(
//         rowData.sizeType!,
//         style: style_text_Table_small,
//       )),
//       DataCell(Container(
//         width: 110,
//         padding: const EdgeInsets.only(top: 10, bottom: 10),
//         child: ElevatedButton(
//           onPressed: () async {
//             await _detailRequest.fetchDetailRequest(
//                 id: data![index].requestCheckContsId!);
//             // add id request for image request
//             // id_request_for_image = data![index].id;
//             String? id = data![index].requestCheckContsId!;
//             imageController.id.value = id;
//             // navigator widget detailRequest
//             controller.selectWidget.value = detailRequest;
//           },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: _color,
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)))),
//           child: Text(
//             _trangthai!,
//             style: text_style_status,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       )),
//       DataCell(Text(
//         _dt!,
//         style: style_text_Table_small,
//       )),
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
