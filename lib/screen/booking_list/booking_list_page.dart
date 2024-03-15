// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/model/booking/model_create_booking.dart';
// import 'package:web_booking/screen/booking_list/data/data_booking.dart';
// // import 'package:easy_localization/easy_localization.dart';

// // ignore: must_be_immutable
// class BookingListPage extends StatefulWidget {
//   @override
//   State<BookingListPage> createState() => _BookingListPageState();
// }

// class _BookingListPageState extends State<BookingListPage> {
//   DataTableBookingRequest _dataBookingRequest =
//       DataTableBookingRequest(data: []);
//   DataTableBookingRequest _list_filter = DataTableBookingRequest(data: []);

//   TextEditingController _search_text = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     try {
//       BookingRequest().fetchBookingRequestList().then((data) => {
//             setState(() {
//               _dataBookingRequest = DataTableBookingRequest(data: data);
//               _list_filter = _dataBookingRequest;
//             })
//           });
//       print('initial Booking Request List');
//     } catch (e) {
//       print('Error call data RequestList: $e');
//     }
//   }

//   void _filterBookingRequest() {
//     try {
//       setState(() {
//         final filterData = _dataBookingRequest.list_filter(_search_text.text);
//         _list_filter = DataTableBookingRequest(data: filterData);
//       });
//     } catch (e) {
//       print('Error call filter data RequestList: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // use sizedbox to content always start on top
//       height: deviceHeight(context),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: deviceWidth(context),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Booking Request List".tr,
//                     style: style_title_page,
//                   ),
//                 ),
//                 Container(
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
//                   margin: const EdgeInsets.symmetric(vertical: 16),
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
//                           setState(() {
//                             _filterBookingRequest();
//                           });
//                         },
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.cancel),
//                         onPressed: () {
//                           setState(() {
//                             _search_text.clear();
//                             _filterBookingRequest();
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
//                     // headingRowColor:
//                     //     MaterialStateColor.resolveWith((states) => lightGrey),
//                     sortColumnIndex: 0,
//                     // sortAscending: true,
//                     // dataRowMaxHeight: 60,
//                     columnSpacing: 16,
//                     columns: [
//                       DataColumn(
//                         label: SizedBox(
//                           width: 40,
//                           child: Center(
//                             child: Text(
//                               'seq'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Container(
//                           // width: 150,
//                           child: Text(
//                             'Booking ID'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Container(
//                           // width: 110,
//                           child: Text('Vessel'.tr,
//                               style: style_text_Table_small_bold),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Container(
//                           // width: 60,
//                           child: Text(
//                             'Voyage'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Container(
//                           // width: 60,
//                           child: Text(
//                             'Date'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: SizedBox(
//                           // width: 300,
//                           child: Text(
//                             'Consignee'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: SizedBox(
//                           // width: 400,
//                           child: Text(
//                             'ServiceTerm'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: SizedBox(
//                           // width: 400,
//                           child: Text(
//                             'Term'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: SizedBox(
//                           // width: 400,
//                           child: Text(
//                             'Payment Term'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Container(
//                           width: 120,
//                           child: Center(
//                             child: Center(
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     _list_filter = DataTableBookingRequest(
//                                         data: _dataBookingRequest
//                                             .filter_trangthaiBK('C'));
//                                     _search_text.text = 'Chờ duyệt';
//                                   });
//                                 },
//                                 child: Text('Status Booking'.tr,
//                                     style: style_text_Table_small_bold),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // DataColumn(
//                       //   label: SizedBox(
//                       //     // width: 400,
//                       //     child: Text(
//                       //       'Process User'.tr,
//                       //       style: style_text_Table_small_bold,
//                       //     ),
//                       //   ),
//                       // ),
//                       DataColumn(
//                         label: Container(
//                           width: 130,
//                           child: Text(
//                             'Update Time'.tr,
//                             style: style_text_Table_small_bold,
//                           ),
//                         ),
//                       ),
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
