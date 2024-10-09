import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking_confirm/model_list_booking_confirm.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class DataListBookingConfirm extends StatefulWidget {
  const DataListBookingConfirm({super.key});

  @override
  State<DataListBookingConfirm> createState() => _DataListBookingConfirmState();
}

class _DataListBookingConfirmState extends State<DataListBookingConfirm> {
  @override
  Widget build(BuildContext context) {
    return dataListBookingConfirm();
  }

  FutureBuilder<List<ListBookingConfirm>> dataListBookingConfirm() {
    return FutureBuilder<List<ListBookingConfirm>>(
      future: ListBookingConfirm().fetchDataListBookingConfirm(
          officeId: inforUserController.managingOfficeId.value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          var data = snapshot.data;
          return Container(
            width: deviceWidth(context),
            decoration: BoxDecoration(
              color: white,
              // border: Border.all(color: blue.withOpacity(.4), width: .5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: blue.withOpacity(.2),
                    blurRadius: 12)
              ],
              // borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: DataTable(
                border: TableBorder.all(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(5)),
                horizontalMargin: 10,
                sortColumnIndex: 0,
                dataRowMaxHeight: 70,
                columnSpacing: 12,
                columns: [
                  DataColumn(
                    label: Container(
                      width: 60,
                      child: Center(
                        child: SelectableText('Seq',
                            style: style_text_Table_small_bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("Booking",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Container(
                      width: 130,
                      child: Center(
                        child: SelectableText('Confirm',
                            style: style_text_Table_small_bold),
                      ),
                    ),
                  ),
                ],
                rows: List.generate(data!.length, (index) {
                  var dataBooking = data[index];
                  String bookingNo = dataBooking.bookingNo ?? '';
                  return DataRow(cells: [
                    DataCell(Container(
                      width: 60,
                      child: Center(
                          child: Text(
                        (index + 1).toString(),
                        style: style_text_Table_small,
                      )),
                    )),
                    DataCell(
                      Container(
                        width: 700,
                        child: Center(
                          child: Text(
                            bookingNo,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 130,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              loadingBookingDetail.bookingId.value =
                                  data[index].bookingId!.trim();
                              Get.toNamed(GetRoutes.LoadingBookingDetail);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: grey,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            child: Text(
                              'Confirm',
                              style: style_text_button_detail_small,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                })),
          );
        }
        return Text('');
      },
    );
  }
}
