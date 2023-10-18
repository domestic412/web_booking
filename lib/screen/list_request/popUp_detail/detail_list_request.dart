
// import 'package:flutter/material.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/text.dart';
// import 'package:web_booking/constants/variable.dart';

// final keytext = GlobalKey();

// Future<void> PopUpListRequest(BuildContext context) {
//   return showDialog<void>(
//       context: context,
//       useSafeArea: false,
//       builder: (BuildContext context) {
//         return Center(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: AlertDialog(
//               backgroundColor: Color(0xFFEFEFF4),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)
//                 ),
//               title: const Column(
//                 children: [
//                   Text(
//                     "Thông tin chi tiết",
//                     // style: text_Table_bold,
//                   ),
//                   Divider(
//                     color: Colors.black,
//                   )
//                 ],
//               ),
//               content: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Yêu cầu',
//                     style: text_Table_small_bold,
//                   ),
//                   Text('$tenYeuCau_ListRequestDetail', style: text_Table_small,),
//                   const SizedBox(
//                     height: 10,
//                     // width: 300,
//                   ),
//                   Text(
//                     'Nội dung',
//                     style: text_Table_small_bold,
//                   ),
//                   Text('$noiDung_ListRequestDetail', textAlign: TextAlign.left, style: text_Table_small, key: keytext),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Container / Size',
//                     style: text_Table_small_bold,
//                   ),
//                   RichText(
//                       text: TextSpan(
//                           children:  <TextSpan>[
//                             TextSpan( text: '$cntrno_ListRequestDetail ', style: TextStyle(color: Colors.red, fontSize: 14)),
//                             TextSpan(text: '/ $sizeType_ListRequestDetail', style: text_Table_small)
//                           ]
//                       )),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Ảnh thực tế',
//                         style: text_Table_small_bold,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const ImageRequest(),
//                     ],
//                   ),
//                   Text(
//                     'Trạng thái xử lý',
//                     style: text_Table_small_bold,
//                   ),
//                   if (trangThaiYc_ListRequestDetail == 'A')
//                     setup1()
//                   else if (trangThaiYc_ListRequestDetail == 'C')
//                     setup2()
//                   else
//                     setup3(),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Ghi chú hãng tàu',
//                     style: text_Table_small_bold,
//                   ),
//                   if (noteHangTau_ListRequestDetail == null)
//                     const Text('')
//                   else Text('$noteHangTau_ListRequestDetail',
//                   style: text_Table_small,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Ngày cập nhật',
//                     style: text_Table_small_bold,
//                   ),
//                   Text(updateTime_ListRequestDetail.toString().substring(8, 10) +
//                       '-' + updateTime_ListRequestDetail.toString().substring(5, 7) +
//                       '-' + updateTime_ListRequestDetail.toString().substring(0, 4) +
//                       '    ' + updateTime_ListRequestDetail.toString().substring(11, 19),
//                       style: text_Table_small,),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   if (trangThaiYc_ListRequestDetail == 'R')
//                     const button_detailRequest()
//                   else
//                     const Text(''),
//                 ],
//               ),
//               actions: <Widget> [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context, 'OK'),
//                   child: const Text('OK'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
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
//       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
//     ));

// setup2() => Container(
//     decoration: BoxDecoration(
//       color: grey,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: const EdgeInsets.only(top: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     child: const Text('Chờ xử lý', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)));

// setup3() => Container(
//     decoration: BoxDecoration(
//       color: red,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: const EdgeInsets.only(top: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     child: const Text('Từ chối', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)));

// class button_detailRequest extends StatelessWidget {
//   const button_detailRequest({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF09227e),
//                 minimumSize: Size(deviceWidth(context)*0.6, 40),
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)))),
//             onPressed: () {
//               savecntr = cntrno_ListRequestDetail!;
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //       builder: (context) => DefaultScreen(),
//               //     ));
//             },
//             child: Text('Gửi lại yêu cầu kết hợp',
//                 style: TextStyle(fontSize: 14, color: light)))
//     );
//   }
// }
