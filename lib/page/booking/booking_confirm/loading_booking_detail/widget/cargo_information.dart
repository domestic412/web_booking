import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class CargoInformation extends StatefulWidget {
  const CargoInformation({super.key});

  @override
  State<CargoInformation> createState() => _CargoInformationState();
}

class _CargoInformationState extends State<CargoInformation> {
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> confirmVolume_controller = [];
    List<TextEditingController> quality_controller = [];
    return Column(
      children: [
        DataTable(
            columns: <DataColumn>[
              DataColumn(label: Expanded(child: Text('Seq'))),
              DataColumn(label: Expanded(child: Text('Commodity'))),
              DataColumn(label: Expanded(child: Text('Size'))),
              DataColumn(label: Expanded(child: Text('Type'))),
              DataColumn(label: Expanded(child: Text('Status'))),
              DataColumn(label: Expanded(child: Text('Weight'))),
              DataColumn(label: Expanded(child: Text('R.Vol'))),
              DataColumn(label: Expanded(child: Text('C.Vol'))),
              DataColumn(label: Expanded(child: Text('Quality'))),
              DataColumn(label: Expanded(child: Text('DG'))),
              DataColumn(label: Expanded(child: Text('UNNO'))),
              DataColumn(label: Expanded(child: Text('Class'))),
              DataColumn(label: Expanded(child: Text('DG Remark'))),
            ],
            rows: List.generate(loadingBookingDetail.commoditieDetail.length,
                (index) {
              var dataCommodity = loadingBookingDetail.commoditieDetail[index];
              confirmVolume_controller.add(TextEditingController());
              quality_controller.add(TextEditingController());
              return DataRow(cells: [
                DataCell(Center(
                  child: Text('${index + 1}'),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.commodityName!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.sizeId!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.type!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.status!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.weight!.toString()),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.requestVol!.toString()),
                )),
                DataCell(Center(
                  child: Container(
                      width: 50,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: confirmVolume_controller[index])),
                )),
                DataCell(Center(
                  child: Container(
                      width: 50,
                      child: TextField(controller: quality_controller[index])),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.dg!.toString()),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.unno!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.Class!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.dgRemark!),
                )),
              ]);
            })),
        SizedBox(
          height: 20,
        ),
        Container(
          child: ElevatedButton(
              onPressed: () {
                loadingBookingDetail.lstBkDetail.value = '';
                for (int i = 0;
                    i < loadingBookingDetail.commoditieDetail.length;
                    i++) {
                  if (confirmVolume_controller[i].text == '' ||
                      quality_controller[i].text == '') {
                    break;
                  } else {
                    loadingBookingDetail.lstBkDetail.value =
                        loadingBookingDetail.lstBkDetail.value +
                            loadingBookingDetail
                                .commoditieDetail[i].bookingDetailId! +
                            ':' +
                            confirmVolume_controller[i].text +
                            ':' +
                            quality_controller[i].text +
                            ';';
                  }
                }
                if (loadingBookingDetail.lstBkDetail.value == '') {
                } else {
                  loadingBookingDetail.lstBkDetail.value =
                      loadingBookingDetail.lstBkDetail.value.substring(
                          0, loadingBookingDetail.lstBkDetail.value.length - 1);
                          if (
                            loadingBookingDetail.bkno_controller.value.text.substring(0, 2) != 'HAC' ||
                            loadingBookingDetail.confirmDepotId.value == '' ||
                            confirmVolume_controller == [] ||
                            quality_controller == []
                          ) {
                            SendConfirmBooking(
                            bookingId: loadingBookingDetail.bookingId.value, 
                            confirmDepotId: loadingBookingDetail.confirmDepotId.value,
                            lstBkDetail: loadingBookingDetail.lstBkDetail.value, 
                            bookingNo: loadingBookingDetail.bkno_controller.value.text, 
                            userId: inforUserController.shipperId.value);
                          } else {
                            print('Missing information Confirm');
                          }
                          
                  // print(loadingBookingDetail.bookingId.value);
                  // print(loadingBookingDetail.confirmDepotId.value);
                  // print(loadingBookingDetail.lstBkDetail.value);
                  // print(loadingBookingDetail.bkno_controller.value.text);
                }
              },
              child: Text('Confirm')),
        )
      ],
    );
  }
  Future<void> SendConfirmBooking({
    required String bookingId,
    required String confirmDepotId,
    required String lstBkDetail,
    required String bookingNo, 
    required String userId,
    }) async {
      try{
        var url = URL_CONFIRM_BOOKING;
    Map<String, String> data = {
      'bookingId': bookingId,
      'confirmDepotId': confirmDepotId,
      'lstBKDetail': lstBkDetail,
      'bookingNo': bookingNo,
      'userId': userId,
    };
  var body = json.encode(data);
  final response = await http.post(Uri.parse(url), 
  headers: {"Content-Type": "application/json"},body: body);
  switch (response.statusCode) {
    case 200:
      Get.toNamed(GetRoutes.BookingConfirm);
    default:
    print(response.reasonPhrase);
      break;
  }
    } on Exception catch (e) {
      throw Exception(e);
    }
      
  }
}
