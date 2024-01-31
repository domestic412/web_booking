import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/booking/storage_controller/detail_booking_request_controller.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

import 'widgets/widget_depots_booking_list.dart';
import 'widgets/widget_info_container_booking_list.dart';

// ignore: must_be_immutable
class DetailBookingRequestPage extends StatelessWidget {
  DetailBookingRequestPage({super.key});
  String? _dt;
  double heightInfoConts = 200;
  double heightInfoDepo = 50;
  @override
  Widget build(BuildContext context) {
    dataDetailBookingRequestController.updateTime.value == ''
        ? _dt = ''
        : _dt = DateFormat("dd-MM-yyyy  hh:mm a").format(DateTime.parse(
            dataDetailBookingRequestController.updateTime.value));
    switch (dataDetailBookingRequestController.detailListInfoContainer.length) {
      case 1:
        heightInfoConts = 100;
        break;
      case 2:
        heightInfoConts = 200;
        break;
      case 3:
        heightInfoConts = 300;
        break;
      case 4:
        heightInfoConts = 400;
        break;
      case 5:
        heightInfoConts = 500;
        break;
      default:
        heightInfoConts = 1000;
    }

    switch (dataDetailBookingRequestController.detailListDepots.length) {
      case 0:
        heightInfoDepo = 0;
        break;
      case 1:
        heightInfoDepo = 50;
        break;
      case 2:
        heightInfoDepo = 100;
        break;
      case 3:
        heightInfoDepo = 150;
        break;
      case 4:
        heightInfoDepo = 200;
        break;
      default:
        heightInfoDepo = 500;
        break;
    }
    return Obx(
      () => SizedBox(
        height: deviceHeight(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: deviceWidth(context),
                  alignment: Alignment.center,
                  child: Text(
                    "Details Booking Request".tr,
                    style: style_title_page,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      controller.selectWidget.value = bookingRequestList;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: Text(
                        'back'.tr,
                        style: style_text_button_detail,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: deviceWidth(context),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: blue.withOpacity(.4), width: .5),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 6),
                          color: blue.withOpacity(.1),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Booking ID'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.id.value
                                    .toString(),
                                style: style_text_Table_small,
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Vessel'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.vessel.value,
                                style: style_text_Table_small,
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Voyage'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.voyage.value,
                                style: style_text_Table_small,
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Date'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.date.value,
                                style: style_text_Table_small,
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Payer'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.payer.value,
                                style: style_text_Table_small,
                              )),
                          SizedBox(width: 50),
                          Text(
                            'Consignee'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController
                                    .consignee.value,
                                style: style_text_Table_small,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Service Term'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController
                                    .serviceTerm.value,
                                style: style_text_Table_small,
                              )),
                          SizedBox(width: 50),
                          Text(
                            'Payment Term'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController
                                    .paymentTerm.value,
                                style: style_text_Table_small,
                              )),
                          SizedBox(width: 50),
                          Text(
                            'Option Container'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              // width: 100,
                              child: Text(
                                dataDetailBookingRequestController.term.value,
                                style: style_text_Table_small,
                              )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                          height: heightInfoConts,
                          width: 1500,
                          child: DetailListInfoContainer_BookingRequest()),
                      const SizedBox(height: 10),
                      Container(
                          height: heightInfoDepo,
                          width: 1500,
                          child: DetailListDepots_BookingRequest()),
                      Row(
                        children: [
                          Text(
                            'Note'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              child: Text(
                                dataDetailBookingRequestController
                                    .noteRequestByUser.value,
                                style: style_text_Table_small,
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Status Booking'.tr,
                            style: style_text_detail,
                          ),
                          if (dataDetailBookingRequestController
                                  .statusBooking.value ==
                              'A')
                            setup1()
                          else if (dataDetailBookingRequestController
                                  .statusBooking.value ==
                              'C')
                            setup2()
                          else if (dataDetailBookingRequestController
                                  .statusBooking.value ==
                              'N')
                            setup3()
                          else if (dataDetailBookingRequestController
                                  .statusBooking.value ==
                              'R')
                            setup4()
                          else
                            SizedBox.shrink()
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Update Time'.tr,
                            style: style_text_detail,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[500]),
                              alignment: Alignment.center,
                              child: Text(
                                _dt!,
                                style: style_text_Table_small,
                              )),
                        ],
                      ),
                      dataDetailBookingRequestController.statusBooking.value ==
                              'N'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      fetchCreateBooking(
                                          'C',
                                          dataDetailBookingRequestController
                                              .bookingId.value,
                                          informationController.tenNV.value);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: haian),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      child: Text(
                                        'Confirmation Request',
                                      ),
                                    ))
                              ],
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchCreateBooking(
      String statusBooking, int bk, String processUser) async {
    try {
      var url = '$SERVER/NewBooking/Process?trangThai=$statusBooking';
      Map<String, dynamic> data = {
        'id': bk,
        'processUser': processUser,
      };
      var body = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json", //use fot http, not use https
            // "Authorization": "Bearer ${informationController.authorize.value}",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          controller.selectWidget.value = bookingRequestList;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Send Approval - $e');
    }
  }
}

setup1() => Container(
    decoration: BoxDecoration(
      color: green,
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: const Text(
      'Đồng ý',
      style: TextStyle(
          fontSize: 16,
          // fontWeight: FontWeight.bold,
          color: Colors.white),
    ));

setup2() => Container(
    decoration: BoxDecoration(
      color: grey,
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: const Text('Chờ xử lý',
        style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.white)));

setup3() => Container(
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: const Text('Lưu nháp',
        style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.white)));

setup4() => Container(
    decoration: BoxDecoration(
      color: red,
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: const Text('Từ chối',
        style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.white)));
