import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';

class DataTrackingZimSource extends DataGridSource {
  DataTrackingZimSource(this._trackingZim, this.context) {
    buildDataGridRow();
  }

  List<TrackingZims> _trackingZim = <TrackingZims>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];
  BuildContext context;

  void buildDataGridRow() {
    _dataGridRows = _trackingZim
        .map<DataGridRow>((data) => data.getDataGridRow_TrackingZims())
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
                : dataGridCell.columnName == 'eventDate'.tr
                    ? Text(
                        changeStringDateHourtoShow(
                            date: dataGridCell.value.toString()),
                        style: style12_black,
                        overflow: TextOverflow.ellipsis)
                    : SelectableText(
                        // maxLines: 2,
                        dataGridCell.value.toString(),
                        style: style12_black,
                      ));
      })
    ]);
  }
}
