// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/global.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/list_quality/model_quality_list.dart';
// import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';
// import 'package:web_booking/screen/quality_list/data/data_quality_list.dart';

// import 'widget/button_create.dart';

// // ignore: must_be_immutable
// class QualityListPage extends StatefulWidget {
//   @override
//   State<QualityListPage> createState() => _QualityListPageState();
// }

// class _QualityListPageState extends State<QualityListPage> {
//   DataTableQuality _dataQuality = DataTableQuality(data: []);

//   @override
//   void initState() {
//     super.initState();
//     QualityList().fetchQualityList().then((data) {
//       setState(() {
//         _dataQuality = DataTableQuality(data: data);
//         // print('initial data quality');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: Text(
//                 "title quality list".tr,
//                 style: style_title_page,
//               ),
//             ),
//             ButtonCreate(),
//             // ElevatedButton(
//             //     style: ElevatedButton.styleFrom(
//             //         backgroundColor: haian,
//             //         shape: const RoundedRectangleBorder(
//             //             borderRadius: BorderRadius.all(Radius.circular(10)))),
//             //     onPressed: () {
//             //       // maChatLuong_quality = '';
//             //       // tenChatLuong_quality = '';
//             //       // ghiChu_quality = '';
//             //       // id_quality = 0;
//             //       title_CUD_quality = 'title create quality container'.tr;
//             //       text_button_CUD = 'save'.tr;
//             //       URL_QUALITY = '$SERVER/QualityList/Create';
//             //       color_button_CUD = haian;
//             //       CUD = 1;
//             //       qualityController.updateQualityController(
//             //           id: 0.obs,
//             //           maChatLuong: ''.obs,
//             //           tenChatLuong: ''.obs,
//             //           ghiChu: ''.obs,
//             //           updateUser: ''.obs);
//             //       // sideBarController.index.value = 7;
//             //       // controller.changeWidget(SideBarController.cudQuality);
//             //       controller.selectWidget.value = cudQuality;
//             //     },
//             //     child: Container(
//             //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             //       child: Text('create'.tr, style: style_text_box_button),
//             //     )),
//             Container(
//               // width: deviceWidth(context),
//               decoration: BoxDecoration(
//                 color: white,
//                 border: Border.all(color: blue.withOpacity(.4), width: .5),
//                 boxShadow: [
//                   BoxShadow(
//                       offset: const Offset(0, 6),
//                       color: blue.withOpacity(.1),
//                       blurRadius: 12)
//                 ],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: PaginatedDataTable(
//                   headingRowColor:
//                       WidgetStateColor.resolveWith((states) => lightGrey),
//                   sortColumnIndex: 0,
//                   // sortAscending: true,
//                   // dataRowMaxHeight: 90,
//                   headingRowHeight: 40,
//                   columnSpacing: 10,
//                   columns: [
//                     DataColumn(
//                       label: Text(
//                         'seq'.tr,
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'quality code'.tr,
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'quality name'.tr,
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'note'.tr,
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'updateTime'.tr,
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                     DataColumn(
//                       label: Container(
//                         color: red,
//                         child: Text(
//                           'updater'.tr,
//                           // style: style_text_Table_small_bold,
//                           style: style12_black,
//                         ),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         '##',
//                         // style: style_text_Table_small_bold,
//                         style: style12_black,
//                       ),
//                     ),
//                   ],
//                   source: _dataQuality),
//             ),
//           ]),
//     );
//   }
// }
