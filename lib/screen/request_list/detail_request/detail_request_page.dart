// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';

// // ignore: must_be_immutable
// class DetailRequestPage extends StatelessWidget {
//   DetailRequestPage({super.key});
//   String? _dt;

//   @override
//   Widget build(BuildContext context) {
//     // dataDetailRequestController.updateTime.value == ''
//     //     // updateTime_DetailRequest == null
//     //     ? _dt = ''
//     //     : _dt = DateFormat("dd-MM-yyyy  hh:mm a").format(
//     //         DateTime.parse(dataDetailRequestController.updateTime.value));
//     return SizedBox(
//       height: deviceHeight(context),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: EdgeInsets.all(32),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: deviceWidth(context),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "details".tr,
//                   style: style_title_page,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 16),
//                 child: InkWell(
//                   onTap: () {
//                     // sideBarController.index.value = 2;
//                     // controller.changeWidget(SideBarController.requestList);
//                     controller.selectWidget.value = requestList;
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 35,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: grey,
//                     ),
//                     child: Text(
//                       'back'.tr,
//                       style: style_text_button_detail,
//                     ),
//                   ),
//                 ),
//               ),
//               // Container(
//               //   width: deviceWidth(context),
//               //   decoration: BoxDecoration(
//               //     color: white,
//               //     border: Border.all(color: blue.withOpacity(.4), width: .5),
//               //     boxShadow: [
//               //       BoxShadow(
//               //           offset: const Offset(0, 6),
//               //           color: blue.withOpacity(.1),
//               //           blurRadius: 12)
//               //     ],
//               //     borderRadius: BorderRadius.circular(8),
//               //   ),
//               //   padding: const EdgeInsets.all(16),
//               //   child: Column(
//               //     mainAxisAlignment: MainAxisAlignment.start,
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: [
//               //       Text(
//               //         'request'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       Text(
//               //         dataDetailRequestController.tenYeuCau.value,
//               //         style: style_text_detail,
//               //       ),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Row(
//               //         children: [
//               //           Text(
//               //             'sender'.tr,
//               //             style: style_text_detail_bold,
//               //           ),
//               //           const SizedBox(
//               //             width: 10,
//               //           ),
//               //           Text(
//               //             dataDetailRequestController.shipperName.value,
//               //             style: style_text_detail,
//               //           ),
//               //           dataDetailRequestController.shipperNote.value == ''
//               //               ? SizedBox()
//               //               : Row(
//               //                   children: [
//               //                     SizedBox(
//               //                       width: 30,
//               //                     ),
//               //                     Text(
//               //                       'shipper'.tr,
//               //                       style: style_text_detail_bold,
//               //                     ),
//               //                     const SizedBox(
//               //                       width: 10,
//               //                     ),
//               //                     Text(
//               //                       dataDetailRequestController
//               //                           .shipperNote.value,
//               //                       style: style_text_detail,
//               //                     ),
//               //                   ],
//               //                 )
//               //         ],
//               //       ),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Text(
//               //         'content'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       Text(
//               //         dataDetailRequestController.noiDung.value,
//               //         // '$noiDung_DetailRequest',
//               //         textAlign: TextAlign.left,
//               //         style: style_text_detail,
//               //         // key: keytext
//               //       ),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Text(
//               //         'container/size/grade'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       RichText(
//               //           text: TextSpan(children: <TextSpan>[
//               //         TextSpan(
//               //             text: dataDetailRequestController.cntrno.value,
//               //             // '$cntrno_DetailRequest ',
//               //             style: style_text_cntr_detail),
//               //         TextSpan(
//               //             text:
//               //                 '/ ${dataDetailRequestController.sizeType.value}',
//               //             style: style_text_detail)
//               //       ])),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Text(
//               //         'picture'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       ImageRequest(),
//               //       Text(
//               //         'status approve'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       if (dataDetailRequestController.trangThaiYc.value == 'A')
//               //         setup1()
//               //       else if (dataDetailRequestController.trangThaiYc.value ==
//               //           'C')
//               //         setup2()
//               //       else
//               //         setup3(),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Text(
//               //         'note'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       Text(dataDetailRequestController.noteHangTau.value,
//               //           style: style_text_detail),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       Text(
//               //         'updateTime'.tr,
//               //         style: style_text_detail_bold,
//               //       ),
//               //       const SizedBox(
//               //         height: 5,
//               //       ),
//               //       Text(
//               //         _dt!,
//               //         style: style_text_detail,
//               //       ),
//               //       const SizedBox(
//               //         height: 10,
//               //       ),
//               //       dataDetailRequestController.trangThaiYc.value == 'R'
//               //           ? button_detailRequest()
//               //           : SizedBox(),
//               //       SizedBox(
//               //         height: 20,
//               //       ),
//               //     ],
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// setup1() => Container(
//     decoration: BoxDecoration(
//       color: green,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: const EdgeInsets.only(top: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     child: const Text(
//       'Đồng ý',
//       style: TextStyle(
//           fontSize: 16,
//           // fontWeight: FontWeight.bold,
//           color: Colors.white),
//     ));

// setup2() => Container(
//     decoration: BoxDecoration(
//       color: grey,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: const EdgeInsets.only(top: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     child: const Text('Chờ xử lý',
//         style: TextStyle(
//             fontSize: 16,
//             // fontWeight: FontWeight.bold,
//             color: Colors.white)));

// setup3() => Container(
//     decoration: BoxDecoration(
//       color: red,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: const EdgeInsets.only(top: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     child: const Text('Từ chối',
//         style: TextStyle(
//             fontSize: 16,
//             // fontWeight: FontWeight.bold,
//             color: Colors.white)));
