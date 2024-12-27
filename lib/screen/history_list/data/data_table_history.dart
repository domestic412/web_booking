import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_history/model_history_list.dart';

class DataHistorySource extends DataGridSource {
  DataHistorySource(this._history) {
    _history_original = _history;
    buildDataGridRow();
  }

  List<HistoryList> _history = <HistoryList>[];
  List<HistoryList> _history_original = <HistoryList>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  void buildDataGridRow() {
    _dataGridRows = _history
        .map<DataGridRow>((data) => data.getDataGridRow_History())
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        child: Text(
          (_dataGridRows.indexOf(row) + 1).toString(),
          style: style12_black,
        ),
      ),
      ...row.getCells().map<Widget>((dataGridCell) {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(5.0),
            child: dataGridCell.value == null
                ? SizedBox()
                : dataGridCell.columnName == 'ketQua'.tr
                    ? Tooltip(
                        message:
                            _history[_dataGridRows.indexOf(row)].remark ?? '',
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: dataGridCell.value == Accept ? green : red,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            dataGridCell.value.toString().trim(),
                            style: style12_white,
                          ),
                        ),
                      )
                    // WidgetButton(
                    //     text: dataGridCell.value == 'A'
                    //         ? 'Đồng ý'
                    //         : dataGridCell.value == 'R'
                    //             ? 'Từ chối'
                    //             : 'Chờ Duyệt',
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: dataGridCell.value == 'A'
                    //           ? green
                    //           : dataGridCell.value == 'R'
                    //               ? red
                    //               : grey,
                    //       minimumSize: Size(100, 30),
                    //     ),)
                    : dataGridCell.columnName == 'updateTime'.tr
                        ? Text(
                            changeStringDateHourtoShow(
                                date: dataGridCell.value.toString().trim()),
                            style: style12_black,
                            overflow: TextOverflow.ellipsis)
                        : SelectableText(
                            dataGridCell.value.toString().trim(),
                            style: style12_black,
                          ));
      })
    ]);
  }

  void applyFilter({required String filter}) {
    _history = _history_original
        .where(
          (value) =>
              (value.cntrno?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.size?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.chatLuong?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.soLanKetHop
                      ?.toUpperCase()
                      .contains(filter.toUpperCase()) ??
                  false) ||
              (value.chatLuong?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.chatLuong?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.numCp
                      ?.toString()
                      .toUpperCase()
                      .contains(filter.toUpperCase()) ??
                  false) ||
              (value.status
                      ?.toUpperCase()
                      .contains(filter.toUpperCase()) ??
                  false) ||
              (value.shipper
                      ?.toUpperCase()
                      .contains(filter.toUpperCase()) ??
                  false) ||
              (value.remark?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.ketQua?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.acc?.toUpperCase().contains(filter.toUpperCase()) ??
                  false) ||
              (value.updateTime?.toUpperCase().contains(filter.toUpperCase()) ??
                  false),
        )
        .toList();
    buildDataGridRow();
    notifyListeners();
  }
}
