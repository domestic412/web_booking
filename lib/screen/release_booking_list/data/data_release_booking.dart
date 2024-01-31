import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/detail_booking_request_controller.dart';

class DataTableReleaseBookingRequest extends DataTableSource {
  Volumes _detailBookingVolume = Volumes();
  Depots _detailBookingDepots = Depots();
  List<BookingRequest>? data;
  String? _dt;
  String? _dt_route;
  Color? _color;
  String? _trangthai;

  DataTableReleaseBookingRequest({this.data});

  List<BookingRequest> list_filter(String query) {
    return data!
        .where((item) =>
            (item.id?.toString().toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.vessel?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.voyage?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.consignee?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.serviceTerm?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.term?.toUpperCase().contains(query.toUpperCase()) ?? false) ||
            (item.paymentTerm
                    ?.toUpperCase()
                    .contains(query.toUpperCase()) ??
                false) ||
            (item.statusBooking?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.processUser?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.serviceTerm?.toUpperCase().contains(query.toUpperCase()) ??
                false) ||
            (item.updateTime?.toUpperCase().contains(query.toUpperCase()) ??
                false))
        .toList();
  }

  List<BookingRequest> filter_trangthaiBK(String query) {
    return data!
        .where((item) =>
            (item.statusBooking?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.date ??= '';
    rowData.vessel ??= '';
    rowData.voyage ??= '';
    rowData.payer ??= '';
    rowData.consignee ??= '';
    rowData.serviceTerm ??= '';
    rowData.term ??= '';
    rowData.paymentTerm ??= '';
    rowData.statusBooking ??= '';
    rowData.processUser ??= '';
    rowData.noteRequestByUser ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy  hh:mm")
            .format(DateTime.parse(rowData.updateTime!))
        : _dt = '';
    if (rowData.statusBooking == 'A') {
      _color = green;
      _trangthai = 'Đồng ý';
    } else if (rowData.statusBooking == 'C') {
      _color = grey;
      _trangthai = 'Chờ Duyệt';
    } else if (rowData.statusBooking == 'R') {
      _color = red;
      _trangthai = 'Từ chối';
    } else {
      _color = grey;
      _trangthai = '###';
    }

    return DataRow(cells: [
      DataCell(SizedBox(
        width: 40,
        child: Center(
          child: SelectableText(
            (index + 1).toString(),
            style: style_text_Table_small,
          ),
        ),
      )),
      DataCell(SelectableText(
        rowData.id!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.vessel!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.voyage!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.date!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.consignee!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.serviceTerm!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.term!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.paymentTerm!,
        style: style_text_Table_small,
      )),
      DataCell(Container(
        width: 110,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () async {
            await _detailBookingVolume
                .fetchDetailBookingVolume(data![index].id!);
            await _detailBookingDepots
                .fetchDetailBookingDepots(data![index].id!);
            dataDetailBookingRequestController.updateDetailBookingRequest(
              id: data![index].id,
              vessel: data![index].vessel,
              voyage: data![index].voyage,
              date: data![index].date,
              payer: data![index].payer,
              consignee: data![index].consignee,
              serviceTerm: data![index].serviceTerm,
              term: data![index].term,
              paymentTerm: data![index].paymentTerm,
              statusBooking: data![index].statusBooking,
              noteRequestByUser: data![index].noteRequestByUser,
              processUser: data![index].processUser,
              updateTime: data![index].updateTime,
            );
            // int? id = data![index].id!;
            controller.selectWidget.value = detailReleaseBookingList;
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: _color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(
            _trangthai!,
            style: text_style_status,
            textAlign: TextAlign.center,
          ),
        ),
      )),
      DataCell(SelectableText(
        rowData.processUser!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt!,
        style: style_text_Table_small,
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
