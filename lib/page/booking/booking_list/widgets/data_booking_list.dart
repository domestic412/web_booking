import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_booking_list.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/booking/storage_controller/detail_booking_list_controller.dart';

class DataBookingList extends StatefulWidget {
  const DataBookingList({super.key});

  @override
  State<DataBookingList> createState() => _DataBookingListState();
}

class _DataBookingListState extends State<DataBookingList> {
  @override
  Widget build(BuildContext context) {
    return dataBookingList();
  }

  FutureBuilder<List<BookingList>> dataBookingList() {
    Color? color;
    String? status;

    return FutureBuilder<List<BookingList>>(
      future: fetchBookingList,
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
                    label: Expanded(
                      child: Center(
                        child: SelectableText('Seq',
                            style: style_text_Table_small_bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("Booking.No",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("Vessel",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("Voy.No",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("Depot",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("POL",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("POD",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText('ETD',
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText('Commodity',
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText('20/40/45',
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText('Confirm',
                          style: style_text_Table_small_bold),
                    )),
                  ),
                ],
                rows: List.generate(data!.length, (index) {
                  var dataBooking = data[index];
                  String bookingNo = dataBooking.bookingNo ?? '';
                  String vessel = dataBooking.shipName ?? '';
                  String voyId = dataBooking.voyId ?? '';
                  String depotName = dataBooking.depotName ?? '';
                  String pol = dataBooking.portLoad ?? '';
                  String pod = dataBooking.finalDest ?? '';
                  String etd = dataBooking.fromDate ?? '';
                  // var dataVoyage1 = data.listBookingVoys?[index];
                  // String? nameVoyage = dataVoyage1?.vesselName;
                  // String? dateVoyage = dataVoyage1?.etd;
                  String _dt = DateFormat("dd-MMM-yyyy\n    hh:mm")
                      .format(DateTime.parse(etd));
                  String commodity = dataBooking.commodity ?? '';
                  String cont20 = dataBooking.cont20.toString();
                  String cont40 = dataBooking.cont40.toString();
                  String cont45 = dataBooking.cont45.toString();
                  bool confirmed = dataBooking.confirmed!;
                  switch (confirmed) {
                    case true:
                      color = green;
                      status = 'Confirmed';
                    default:
                      color = grey;
                      status = 'Waitting';
                  }
                  return DataRow(cells: [
                    DataCell(Container(
                      width: 40,
                      child: Center(
                          child: Text(
                        (index + 1).toString(),
                        style: style_text_Table_small,
                      )),
                    )),
                    DataCell(
                      Container(
                        width: 100,
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
                        width: 80,
                        child: Center(
                          child: Text(
                            vessel,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          voyId,
                          style: style_text_Table_small,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          depotName,
                          style: style_text_Table_small,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 120,
                        child: Center(
                          child: Text(
                            pol,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 120,
                        child: Center(
                          child: Text(
                            pod,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 85,
                        child: Center(
                          child: Text(
                            _dt,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Center(
                          child: Text(
                            commodity,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 65,
                        child: Center(
                          child: Text(
                            cont20 + '/' + cont40 + '/' + cont45,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            //update DetailBookingList
                            detailBookingListController.updateDetailBookingList(
                                payer: data[index].payer!,
                                shipperName: data[index].shipperName!,
                                shipper: data[index].shipper!,
                                consignee: data[index].consignee!,
                                notifyParty: data[index].notifyParty!,
                                shipName: data[index].shipName!,
                                voyId: data[index].voyId!,
                                fromDate: data[index].fromDate!,
                                toDate: data[index].toDate!,
                                bookingNo: data[index].bookingNo!,
                                bookingDate: data[index].bookingDate!,
                                finalDest: data[index].finalDest!,
                                coc: data[index].coc!,
                                portLoad: data[index].portLoad!,
                                confirmed: data[index].confirmed!,
                                blNo: data[index].blNo!,
                                commodity: data[index].commodity!,
                                cont20: data[index].cont20!,
                                cont40: data[index].cont40!,
                                cont45: data[index].cont45!);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: color,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                          child: Text(
                            status!,
                            style: style_text_button_detail_small,
                            textAlign: TextAlign.center,
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
