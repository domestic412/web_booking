import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/model/container_stock/model_container_stock.dart';
import 'package:intl/intl.dart';

class DataTableContainerStock extends DataTableSource {
  List<ContainerStock>? data;
  String? _dt_FO;
  String? _dt_EO;
  String? _dt_FA;

  DataTableContainerStock({this.data});

  List<ContainerStock> list_filter(String query) {
    return data!
        .where((item) =>
            (item.cntrno?.contains(query.toUpperCase()) ?? false) ||
            (item.sizeType?.contains(query.toUpperCase()) ?? false) ||
            (item.shipper?.contains(query.toUpperCase()) ?? false) ||
            (item.dateFullOut?.contains(query.toUpperCase()) ?? false) ||
            (item.dateEmptyOut?.contains(query.toUpperCase()) ?? false) ||
            (item.dateFullArrived?.contains(query.toUpperCase()) ?? false) ||
            (item.terminal?.contains(query.toUpperCase()) ?? false) ||
            (item.combineStuffing?.contains(query.toUpperCase()) ?? false) ||
            (item.shipVoy?.contains(query.toUpperCase()) ?? false) ||
            (item.status?.contains(query.toUpperCase()) ?? false) ||
            (item.quanlity?.contains(query.toUpperCase()) ?? false) ||
            (item.checkRemark?.contains(query.toUpperCase()) ?? false))
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
    rowData.shipper ??= '';
    // rowData.dateFullOut ??= '';
    // rowData.dateEmptyOut ??= '';
    // rowData.dateFullArrived ??= '';
    rowData.terminal ??= '';
    rowData.combineStuffing ??= '';
    rowData.shipVoy ??= '';
    rowData.status ??= '';
    rowData.quanlity ??= '';
    rowData.checkRemark ??= '';
    rowData.dateFullOut != null
        ? _dt_FO =
            DateFormat("dd-MM-yyy").format(DateTime.parse(rowData.dateFullOut!))
        : _dt_FO = '';
    rowData.dateEmptyOut != null
        ? _dt_EO = DateFormat("dd-MM-yyyy")
            .format(DateTime.parse(rowData.dateEmptyOut!))
        : _dt_EO = '';
    rowData.dateFullArrived != null
        ? _dt_FA = DateFormat("dd-MM-yyyy")
            .format(DateTime.parse(rowData.dateFullArrived!))
        : _dt_FA = '';

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
        rowData.cntrno!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.sizeType!,
        style: style_text_Table_small,
      )),
      DataCell(Container(
        width: 180,
        padding: EdgeInsets.symmetric(vertical: 2),
        child: SelectableText(
          rowData.shipper!,
          style: style_text_Table_small,
        ),
      )),
      DataCell(SelectableText(
        _dt_FO!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt_EO!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt_FA!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.terminal!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.combineStuffing!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.shipVoy!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.status!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.quanlity!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.checkRemark!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        '##',
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
