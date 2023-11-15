import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_detail_request.dart';
import 'package:web_booking/model/list_request/model_list_request.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class DataTableRequest extends DataTableSource {
  DetailRequest _detailRequest = DetailRequest();
  List<ListRequest>? data;
  String? _dt;
  Color? _color;
  String? _trangthai;

  DataTableRequest({this.data});

  List<ListRequest> list_filter(String query) {
    return data!
        .where((item) =>
            (item.cntrno?.contains(query.toUpperCase()) ?? false) ||
            (item.sizeType?.contains(query.toUpperCase()) ?? false) ||
            (item.noteHangTau?.contains(query.toUpperCase()) ?? false) ||
            (item.trangThaiYc?.contains(query.toUpperCase()) ?? false) ||
            (item.updateTime?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  List<ListRequest> filter_trangthaiYC(String query) {
    return data!
        .where((item) =>
            (item.trangThaiYc?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.cntrno ??= '';
    rowData.sizeType ??= '';
    rowData.tenYeuCau ??= '';
    rowData.noiDung ??= '';
    rowData.nguoiGui ??= '';
    rowData.trangThaiYc ??= '';
    rowData.noteHangTau ??= '';
    rowData.userXuly ??= '';
    rowData.updateTimeCheckRequest ??= '';
    rowData.updateUser ??= '';
    rowData.photos ??= '';
    rowData.files ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy  hh:mm a")
            .format(DateTime.parse(rowData.updateTime!))
        : _dt = '';
    if (rowData.trangThaiYc == 'A') {
      _color = green;
      _trangthai = 'Đồng ý';
    } else if (rowData.trangThaiYc == 'C') {
      _color = grey;
      _trangthai = 'Chờ Duyệt';
    } else if (rowData.trangThaiYc == 'R') {
      _color = red;
      _trangthai = 'Từ chối';
    } else {
      _color = grey;
      _trangthai = '###';
    }

    return DataRow(cells: [
      DataCell(SelectableText(
        (index + 1).toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.tenYeuCau!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.cntrno!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.sizeType!,
        style: style_text_Table_small,
      )),
      DataCell(Container(
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SelectableText(
          rowData.noiDung!,
          style: style_text_Table_small,
        ),
      )),
      DataCell(Container(
        width: 400,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SelectableText(
          rowData.noteHangTau!,
          style: style_text_Table_small,
        ),
      )),
      DataCell(Container(
        width: 110,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () async {
            await _detailRequest.fetchDetailRequest(data![index].id!);
            id_request_for_image = data![index].id;
            sideBarController.index.value = 14;
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
