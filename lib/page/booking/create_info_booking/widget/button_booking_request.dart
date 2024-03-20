import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class ButtonBookingRequest extends StatefulWidget {
  @override
  State<ButtonBookingRequest> createState() => _ButtonBookingRequestState();
}

class _ButtonBookingRequestState extends State<ButtonBookingRequest> {
  var dateSelect = DateFormat('MM/dd/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              createBookingController.boolErrorBookingRequest.value == false
                  ? PostBookingRequest(
                      routeController.voyDetail.value,
                      routeController.polId_final.value,
                      routeController.podId_final.value,
                      createBookingController.refId.value,
                      inforUserController.managingOfficeId.value,
                      createBookingController.paymentTerm.value,
                      createBookingController.term.value,
                      '',
                      inforUserController.shipperId.value,
                      inforUserController.shipperId.value,
                      createBookingController.consigneeId.value,
                      routeController.depotId.value,
                      createBookingController.coc.value,
                      createBookingController.dg.value,
                      createBookingController.dgRemark_controller.value.text,
                      createBookingController.reefer.value,
                      createBookingController.temp_controller.value.text,
                      createBookingController.remark.value.text,
                      inforUserController.tenNV.value,
                      'I',
                      createBookingController.listInfoContainer)
                  : null;
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                // 'Temporary Save',
                'Confirmation Request',
                style: TextStyle(color: white),
              ),
            )),
        // SizedBox(width: 20),
        // ElevatedButton(
        //     onPressed: () {
        //       createBookingController.edit.value = 'I';
        //       createBookingController.boolErrorBookingRequest.value == false
        //           ? PostBookingRequest(
        //               routeController.voyDetail.value,
        //               routeController.polId_final.value,
        //               routeController.podId_final.value,
        //               '00000000-0000-0000-0000-000000000000',
        //               inforUserController.managingOfficeId.value,

        //               createBookingController.paymentTerm.value,
        //               createBookingController.term.value,
        //               '',
        //               inforUserController.shipperId.value,
        //               inforUserController.shipperId.value,

        //               createBookingController.consigneeId.value,
        //               '00000000-0000-0000-0000-000000000000',
        //               createBookingController.coc.value,
        //               createBookingController.dg.value,
        //               createBookingController.dgRemark_controller.value.text,

        //               createBookingController.reefer.value,
        //               createBookingController.temp_controller.value.text,
        //               createBookingController.remark.value.text,
        //               inforUserController.tenNV.value,
        //               'I',
        //               createBookingController.listInfoContainer)
        //           : null;
        //     },
        //     style: ElevatedButton.styleFrom(backgroundColor: haian),
        //     child: Container(
        //       alignment: Alignment.center,
        //       height: 40,
        //       child: Text(
        //         'Confirmation Request',
        //         style: TextStyle(color: white),
        //       ),
        //     ))
      ],
    );
  }

  Future<void> PostBookingRequest(
    String voyDetail,
    String portLoadId,
    String portDischargeId,
    String refId,
    String officeId,
    String paymentTerm,
    String term,
    String specialRequest,
    String payerId,
    String shipperId,
    String consigneeId,
    String liftOnDepotId,
    bool coc,
    bool dg,
    String dgRemark,
    bool reefer,
    String temperature,
    String remark,
    String userName,
    String edit,
    List<BookingDetails> bookingDetails,
  ) async {
    try {
      Map<String, dynamic> data = {
        "voyDetail": voyDetail,
        "portLoadId": portLoadId,
        "portDischargeId": portDischargeId,
        "refId": refId,
        "officeId": officeId,
        "paymentTerm": paymentTerm,
        "term": term,
        "specialRequest": "",
        "payerId": shipperId,
        "shipperId": shipperId,
        "consigneeId": consigneeId,
        "liftOnDepotId": liftOnDepotId,
        "coc": coc,
        "dg": dg,
        "dgRemark": dgRemark,
        "reefer": reefer,
        "temperature": temperature,
        "remark": remark,
        "userName": userName,
        "edit": edit,
        "bookingDetails": bookingDetails
      };
      var body = json.encode(data);
      print(body);
      final response = await http.post(Uri.parse(URL_NEW_BOOKING),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          // Get.toNamed(GetRoutes.Home);
          // controller.selectWidget.value = bookingRequestList;
          Get.toNamed(GetRoutes.defaultRoute);
          createBookingController.countRowContainer.value = 0;
          clearDataCreateBooking();
        default:
          print('Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetch Detail Approval - $e');
    }
  }
}

clearDataCreateBooking() {
  createBookingController.consignee_controller.value.clear();
  createBookingController.consigneeId.value;

  createBookingController.ref_controller.value.clear();
  createBookingController.refId.value;

  createBookingController.term_controller.value.clear();
  createBookingController.term.value;

  createBookingController.commodity_controller.value.clear();
  createBookingController.commodityId.value;

  createBookingController.temp_controller.value.clear();
  createBookingController.volume_controller.value.clear();
  createBookingController.weight_controller.value.clear();
  createBookingController.dgRemark_controller.value.clear();
  createBookingController.remark.value.clear();
  createBookingController.listInfoContainer.value = <BookingDetails>[];
}
