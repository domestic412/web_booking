// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/eqc_quote/model_add_quote.dart';
// import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
// import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

// import 'widget/add_info_cont_quote.dart';
// import 'widget/port_quote/port_quote.dart';
// import 'widget/table_input_quote.dart';

// // import 'package:easy_localization/easy_localization.dart';

// // ignore: must_be_immutable
// class AEQuotePage extends StatefulWidget {
//   @override
//   State<AEQuotePage> createState() => _AEQuotePageState();
// }

// class _AEQuotePageState extends State<AEQuotePage> {
//   @override
//   void initState(){
//     super.initState();
//     quoteController.currentDate_send.value = changeDatetoSend(date: DateTime.now());
//     quoteController.gateInDate.value.text = changeDatetoShow(date: DateTime.now());
//     quoteController.gateInDate_send.value = changeDatetoSend(date: DateTime.now());
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
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Stack(children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       controller.selectWidget.value = quoteList;
//                     },
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll<Color>(grey),
//                         minimumSize: MaterialStateProperty.all(Size(100, 40))),
//                     child: Text('Back'),
//                   ),
//                   Center(
//                     child: Text(
//                       "title input quote".tr,
//                       style: style_title_page,
//                     ),
//                   ),
//                 ]),
//                 Container(
//                     margin: EdgeInsets.only(top: 30, bottom: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: white,
//                       border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: PortQuote()),
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: white,
//                       border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: InfoContQuote()),
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: white,
//                       border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TableInputQuote()),
//                 Center(
//                   child: ElevatedButton(
//                       onPressed: () {
//                         // controller.selectWidget.value = quoteList;
//                         PostNewQuote(
//                           eqcQuoteId: quoteController.eqcQuoteId.value, 
//                           portDepotId: inforUserController.shipperId.value, 
//                           quoteNo: quoteController.quoteNo.value,
//                           quoteCcy: quoteController.currency.value,
//                           exRate: quoteController.exRate.value.text, 
//                           quoteUser: inforUserController.shipperName.value, 
//                           edit: 'I',
//                           );
//                       },
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll<Color>(haian),
//                           minimumSize: MaterialStateProperty.all(Size(100, 40))),
//                       child: Text('Send Quote'),
//                     ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
