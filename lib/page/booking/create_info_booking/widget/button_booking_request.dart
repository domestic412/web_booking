import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
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
              createBookingController.statusBookingRequest.value = 'N';
              createBookingController.boolErrorBookingRequest.value == false
                  ? PostBookingRequest(
                      dateSelect,
                      routeController.vessel.value,
                      routeController.voy.value,
                      inforUserController.tenNV.value,
                      createBookingController.boolNewConsignee.value == false
                          ? createBookingController.currentConsignee.value
                          : createBookingController
                              .inputNewConsignee.value.text,
                      createBookingController.currentServiceTerm.value,
                      createBookingController.currentOptionsContainer.value,
                      createBookingController.currentPaymentTerm.value,
                      createBookingController.statusBookingRequest.value,
                      createBookingController.inputNoteRequest.value.text,
                      createBookingController.listInfoContainer,
                      createBookingController.listInfoDepo)
                  : null;
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                'Temporary Save',
                style: TextStyle(color: white),
              ),
            )),
        SizedBox(width: 20),
        ElevatedButton(
            onPressed: () {
              createBookingController.statusBookingRequest.value = 'C';
              createBookingController.boolErrorBookingRequest.value == false
                  ? PostBookingRequest(
                      dateSelect,
                      routeController.vessel.value,
                      routeController.voy.value,
                      inforUserController.tenNV.value,
                      createBookingController.boolNewConsignee.value == false
                          ? createBookingController.currentConsignee.value
                          : createBookingController
                              .inputNewConsignee.value.text,
                      createBookingController.currentServiceTerm.value,
                      createBookingController.currentOptionsContainer.value,
                      createBookingController.currentPaymentTerm.value,
                      createBookingController.statusBookingRequest.value,
                      createBookingController.inputNoteRequest.value.text,
                      createBookingController.listInfoContainer,
                      createBookingController.listInfoDepo)
                  : null;
            },
            style: ElevatedButton.styleFrom(backgroundColor: haian),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                'Confirmation Request',
                style: TextStyle(color: white),
              ),
            ))
      ],
    );
  }

  Future<void> PostBookingRequest(
    String date,
    String vessel,
    String voyage,
    String payer,
    String consignee,
    String serviceTerm,
    String term,
    String paymentTerm,
    String statusBooking,
    String noteRequest,
    List<Volumes> volume,
    List<Depots> depots,
  ) async {
    try {
      Map<String, dynamic> data = {
        'date': date,
        'vessel': vessel,
        'voyage': voyage,
        'payer': payer,
        'consignee': consignee,
        'serviceTerm': serviceTerm,
        'term': term,
        'paymentTerm': paymentTerm,
        'statusBooking': statusBooking,
        'noteRequestByUser': noteRequest,
        'volumes': volume,
        'depots': depots
      };
      var body = json.encode(data);
      final response = await http.post(Uri.parse(URL_NEW_BOOKING),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            // "Authorization": "Bearer ${inforUserController.authorize.value}",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          Get.toNamed(GetRoutes.Home);
          controller.selectWidget.value = bookingRequestList;
          createBookingController.clearDataCreateBooking();
        default:
          print('Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetch Detail Approval - $e');
    }
  }
}
