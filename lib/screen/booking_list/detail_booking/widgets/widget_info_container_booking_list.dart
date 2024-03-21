// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/model/booking/storage_controller/detail_booking_list_controller.dart';

// class DetailListInfoContainer_BookingRequest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount:
//             dataDetailBookingRequestController.detailListInfoContainer.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text('Commodity'.tr, style: style_text_detail),
//                     Container(
//                         margin: EdgeInsets.only(left: 10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             // color: Colors.grey[500]
//                             border: Border.all()),
//                         alignment: Alignment.center,
//                         child: Text(
//                           dataDetailBookingRequestController
//                               .detailListInfoContainer[index]['commodityConts'],
//                           style: style_text_Table_small,
//                         )),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text(
//                       'Size'.tr,
//                       style: style_text_detail,
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             // color: Colors.grey[500]
//                             border: Border.all()),
//                         alignment: Alignment.center,
//                         child: Text(
//                           dataDetailBookingRequestController
//                               .detailListInfoContainer[index]['sizeConts'],
//                           style: style_text_Table_small,
//                         )),
//                     SizedBox(width: 50),
//                     Text(
//                       'Status'.tr,
//                       style: style_text_detail,
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             // color: Colors.grey[500]
//                             border: Border.all()),
//                         alignment: Alignment.center,
//                         child: Text(
//                           dataDetailBookingRequestController
//                               .detailListInfoContainer[index]['statusConts'],
//                           style: style_text_Table_small,
//                         )),
//                     SizedBox(width: 50),
//                     Text(
//                       'Volumes'.tr,
//                       style: style_text_detail,
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             // color: Colors.grey[500]
//                             border: Border.all()),
//                         alignment: Alignment.center,
//                         child: Text(
//                           dataDetailBookingRequestController
//                               .detailListInfoContainer[index]['volumeConts'],
//                           style: style_text_Table_small,
//                         )),
//                     dataDetailBookingRequestController
//                                     .detailListInfoContainer[index]
//                                 ['statusConts'] ==
//                             'F'
//                         ? Row(
//                             children: [
//                               SizedBox(width: 50),
//                               Text(
//                                 'Weights'.tr,
//                                 style: style_text_detail,
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(left: 10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       // color: Colors.grey[500]
//                                       border: Border.all()),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     dataDetailBookingRequestController
//                                             .detailListInfoContainer[index]
//                                         ['weightConts'],
//                                     style: style_text_Table_small,
//                                   )),
//                             ],
//                           )
//                         : SizedBox.shrink(),
//                     dataDetailBookingRequestController
//                                     .detailListInfoContainer[index]
//                                 ['temperatureConts'] ==
//                             ''
//                         ? SizedBox.shrink()
//                         : Row(
//                             children: [
//                               SizedBox(width: 50),
//                               Text(
//                                 'Temp.'.tr,
//                                 style: style_text_detail,
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(left: 10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       // color: Colors.grey[500]
//                                       border: Border.all()),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     dataDetailBookingRequestController
//                                             .detailListInfoContainer[index]
//                                         ['temperatureConts'],
//                                     style: style_text_Table_small,
//                                   )),
//                             ],
//                           ),
//                     dataDetailBookingRequestController
//                                 .detailListInfoContainer[index]['dg'] ==
//                             'true'
//                         ? Row(
//                             children: [
//                               SizedBox(width: 50),
//                               Text(
//                                 'DG UnNo.'.tr,
//                                 style: style_text_detail,
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(left: 10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       // color: Colors.grey[500]
//                                       border: Border.all()),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     dataDetailBookingRequestController
//                                             .detailListInfoContainer[index]
//                                         ['dgUnNo'],
//                                     style: style_text_Table_small,
//                                   )),
//                               SizedBox(width: 50),
//                               Text(
//                                 'DG Class'.tr,
//                                 style: style_text_detail,
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(left: 10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       // color: Colors.grey[500]
//                                       border: Border.all()),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     dataDetailBookingRequestController
//                                             .detailListInfoContainer[index]
//                                         ['dgClass'],
//                                     style: style_text_Table_small,
//                                   )),
//                             ],
//                           )
//                         : SizedBox.shrink()
//                   ],
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
