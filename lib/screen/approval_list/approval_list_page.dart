// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/model/list_approval/model_approval_list.dart';
// import 'package:web_booking/screen/approval_list/data/data_list_approval.dart';
// import 'package:web_booking/screen/approval_list/widget/button_download.dart';
// import 'package:web_booking/screen/approval_list/widget/button_special.dart';
// // import 'package:easy_localization/easy_localization.dart';

// // ignore: must_be_immutable
// class ApprovalListPage extends StatefulWidget {
//   @override
//   State<ApprovalListPage> createState() => _ApprovalListPageState();
// }

// class _ApprovalListPageState extends State<ApprovalListPage> {
//   DataTableApproval _dataApproval = DataTableApproval(data: []);
//   DataTableApproval _list_filter = DataTableApproval(data: []);

//   TextEditingController _search_text = TextEditingController();

//   // Color? _color;
//   // String _trangthai = '';

//   @override
//   void initState() {
//     super.initState();
//     try {
//       ApprovalList().fetchApprovalList().then((data) {
//         setState(() {
//           _dataApproval = DataTableApproval(data: data);
//           _list_filter = _dataApproval;
//           // print('initial data approval');
//         });
//       });
//     } catch (e) {
//       print('Error call data ApprovalList: $e');
//     }
//   }

//   void _filterApproval() {
//     try {
//       setState(() {
//         final filterData = _dataApproval.list_filter(_search_text.text);
//         _list_filter = DataTableApproval(data: filterData);
//         // print('filter data approval');
//       });
//     } catch (e) {
//       print('Error call filter data ApprovalList: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // use sizedbox to content always start on top
//       height: deviceHeight(context),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     DownloadButtonApproval(),
//                     Center(
//                       child: Text(
//                         "approval list".tr,
//                         style: style_title_page,
//                       ),
//                     ),
//                     ButtonSpecialCustomer(),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 16),
//                   decoration: BoxDecoration(
//                     color: white,
//                     border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.all(16),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black45)),
//                     child: ListTile(
//                       leading: const Icon(Icons.search),
//                       title: TextField(
//                         controller: _search_text,
//                         decoration: InputDecoration(
//                             hintText: 'search'.tr, border: InputBorder.none),
//                         onChanged: (value) {
//                           _filterApproval();
//                         },
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.cancel),
//                         onPressed: () {
//                           setState(() {
//                             _search_text.clear();
//                             _filterApproval();
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: deviceWidth(context),
//                   decoration: BoxDecoration(
//                     color: white,
//                     border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: PaginatedDataTable(
//                     sortColumnIndex: 0,
//                     columnSpacing: 16,
//                     columns: [
//                       DataColumn(
//                         label: SizedBox(
//                           width: 40,
//                           child: Center(
//                               child: Text("seq".tr,
//                                   style: style_text_Table_small_bold)),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Expanded(
//                             child: Center(
//                           child: Text('container'.tr,
//                               style: style_text_Table_small_bold),
//                         )),
//                       ),
//                       DataColumn(
//                           label: Expanded(
//                               child: Center(
//                         child: Text('sender'.tr,
//                             style: style_text_Table_small_bold),
//                       ))),
//                       DataColumn(
//                         label: Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _list_filter = DataTableApproval(
//                                     data:
//                                         _dataApproval.filter_trangthaiYC('C'));
//                                 _search_text.text = 'Chờ duyệt';
//                               });
//                             },
//                             child: Center(
//                               child: Text('approve request'.tr,
//                                   style: style_text_Table_small_bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                           label: Expanded(
//                               child: Center(
//                         child: Text('update user'.tr,
//                             style: style_text_Table_small_bold),
//                       ))),
//                       DataColumn(
//                           label: Expanded(
//                               child: Center(
//                         child: Text('update time'.tr,
//                             style: style_text_Table_small_bold),
//                       ))),
//                     ],
//                     source: _list_filter,
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
