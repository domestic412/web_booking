import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/screen/tracking1/data%20container/data_table_tracking_zim.dart';
import 'package:web_booking/screen/tracking1/popUp_detailContainer1/popUp_container_detail1.dart';

class DataTrackingContainerSource extends DataGridSource {
  DataTrackingContainerSource(this._trackingContainer, this.context,
      this._dataTrackingZimEN, this._dataTrackingZimVN) {
    _trackingContainer_original = _trackingContainer;
    buildDataGridRow();
  }

  List<TrackingContainers> _trackingContainer = <TrackingContainers>[];
  List<TrackingContainers> _trackingContainer_original = <TrackingContainers>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];
  BuildContext context;

  List<TrackingZims> _dataTrackingZimEN;
  List<TrackingZims> _dataTrackingZimVN;
  late List<TrackingZims> _dataTrackingZim;
  late List<TrackingZims> _data;
  late DataTrackingZimSource _dataTrackingZimSource;

  void buildDataGridRow() {
    _dataGridRows = _trackingContainer
        .map<DataGridRow>((data) => data.getDataGridRow_TrackingContainers())
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
                : dataGridCell.columnName == 'container'.tr
                    ? InkWell(
                        onTap: () {
                          print(_trackingContainer[_dataGridRows.indexOf(row)]
                              .container!);
                          bool_lang == false
                              ? _dataTrackingZim = _dataTrackingZimEN
                              : _dataTrackingZim = _dataTrackingZimVN;
                          _data = _dataTrackingZim
                              .where((item) => item.container!.contains(
                                  _trackingContainer[_dataGridRows.indexOf(row)]
                                      .container!))
                              .toList();
                          _dataTrackingZimSource =
                              DataTrackingZimSource(_data, context);
                          PopUpContainerDetail1(
                              context, _dataTrackingZimSource);
                        },
                        child: Text(
                          dataGridCell.value.toString(),
                          style: style12_haian,
                        ),
                      )
                    : SelectableText(
                        // maxLines: 2,
                        dataGridCell.value.toString(),
                        style: style12_black,
                      ));
      })
    ]);
  }

  void applyFilter({required String filter}) {
    _trackingContainer = _trackingContainer_original
        .where((value) =>
            (value.container?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.size?.toUpperCase().contains(filter.toUpperCase()) ?? false))
        .toList();
    buildDataGridRow();
    notifyListeners();
  }
}
