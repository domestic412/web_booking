import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/model/eqc_quote/model_quote_detail.dart';
import 'package:intl/intl.dart';

class DataTableQuoteDetails extends DataTableSource {
  List<EQCQuoteDetail>? data;
  String? _dt1;

  DataTableQuoteDetails({this.data});

  List<EQCQuoteDetail> list_filter(String query) {
    return data!
        .where((item) =>
            (item.chargeType?.contains(query.toUpperCase()) ?? false) ||
            (item.component?.contains(query.toUpperCase()) ?? false) ||
            (item.category?.contains(query.toUpperCase()) ?? false) ||
            (item.damageCode?.contains(query.toUpperCase()) ?? false) ||
            (item.container?.contains(query.toUpperCase()) ?? false) ||
            (item.damageDetail?.contains(query.toUpperCase()) ?? false) ||
            (item.quantity?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.dimension?.contains(query.toUpperCase()) ?? false) ||
            (item.length?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.width?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.location?.contains(query.toUpperCase()) ?? false) ||
            (item.laborCost?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.mrCost?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.totalCost?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.estimateDate?.contains(query.toUpperCase()) ?? false) ||
            (item.payer?.contains(query.toUpperCase()) ?? false) ||
            (item.approveCode?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.chargeType ??= '';
    rowData.component ??= '';
    rowData.category ??= '';
    rowData.damageCode ??= '';
    rowData.container ??= '';
    rowData.damageDetail ??= '';
    rowData.quantity ??= 0;
    rowData.dimension ??= '';
    rowData.length ??= 0;
    rowData.width ??= 0;
    rowData.location ??= '';
    rowData.laborCost ??= 0;
    rowData.mrCost ??= 0;
    rowData.totalCost ??= 0;
    rowData.payer ??= '';
    rowData.approveCode ??= '';
    rowData.estimateDate != null
        ? _dt1 = DateFormat("dd-MM-yyyy")
            .format(DateTime.parse(rowData.estimateDate!))
        : _dt1 = '';
    // rowData.ketQua == Accept ? _color = green : _color = red;

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
        rowData.chargeType!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.component!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.category!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.damageCode!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.container!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.damageDetail!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.quantity!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.dimension!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.length!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.width!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.location!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.laborCost!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.mrCost!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.totalCost!.toString(),
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt1!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.payer!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.approveCode!,
        style: style_text_Table_small,
      )),
      // DataCell(ElevatedButton(onPressed: (){}, child: Text('Edit'))),
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
