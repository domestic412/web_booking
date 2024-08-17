import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/model/list_history/model_history_list.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/list_history/model_image_combine.dart';

class DataTableHistory extends DataTableSource {
  List<History>? data;
  String? _dt;
  Color? _color;

  DataTableHistory({this.data});

  List<History> list_filter(String query) {
    return data!
        .where((item) =>
            (item.cntrno?.contains(query.toUpperCase()) ?? false) ||
            (item.size?.contains(query.toUpperCase()) ?? false) ||
            (item.soLanKetHop?.contains(query.toUpperCase()) ?? false) ||
            (item.chatLuong?.contains(query.toUpperCase()) ?? false) ||
            (item.status?.contains(query.toUpperCase()) ?? false) ||
            (item.shipper?.contains(query.toUpperCase()) ?? false) ||
            (item.ketQua?.contains(query.toUpperCase()) ?? false) ||
            (item.acc?.contains(query.toUpperCase()) ?? false) ||
            (item.updateTime?.contains(query.toUpperCase()) ?? false) ||
            (item.remark?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.cntrno ??= '';
    rowData.size ??= '';
    rowData.soLanKetHop ??= '';
    rowData.numKh ??= '';
    rowData.numCp ??= 0;
    rowData.chatLuong ??= '';
    rowData.status ??= '';
    rowData.shipper ??= '';
    rowData.ketQua ??= '';
    rowData.acc ??= '';
    rowData.remark ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy  hh:mm")
            .format(DateTime.parse(rowData.updateTime!))
        : _dt = '';
    rowData.ketQua == Accept ? _color = green : _color = red;

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
      DataCell(TextButton(
          onPressed: () {
            ImageCombine().fetchImageCombine(
                data![index].cntrno!, data![index].numKh ?? '0');
          },
          child: Text(rowData.cntrno!,
              style: TextStyle(
                fontSize: 14,
                color: haian,
                fontWeight: FontWeight.w600,
              )))),
      // DataCell(SelectableText(
      //   rowData.cntrno!,
      //   onTap: () {
      //     ImageCombine().fetchImageCombine(
      //         data![index].cntrno!, data![index].numKh ?? '0');
      //   },
      //   style: TextStyle(
      //       fontSize: 14, color: haian, decoration: TextDecoration.underline),
      // )),
      DataCell(SelectableText(
        rowData.size!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.soLanKetHop!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.numKh!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.numCp!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.chatLuong!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.status!,
        style: style_text_Table_small,
      )),
      DataCell(Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SelectableText(
          rowData.shipper!,
          style: style_text_Table_small,
        ),
      )),
      DataCell(Center(
          child: Tooltip(
        message: rowData.remark!,
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.circular(7)),
          child: SelectableText(
            rowData.ketQua!,
            style: text_style_status,
          ),
        ),
      ))),
      DataCell(SelectableText(
        rowData.acc!,
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
