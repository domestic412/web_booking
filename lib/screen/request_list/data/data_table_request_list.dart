import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_request/model_request_list.dart';
import 'package:web_booking/model/list_request/storage_controller/detail_request_controller.dart';
import 'package:web_booking/storage_controller.dart/controller_image.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DataRequestListSource extends DataGridSource {
  DataRequestListSource(this._request) {
    _request_original = _request;
    buildDataGridRow();
  }

  List<RequestList> _request = <RequestList>[];
  List<RequestList> _request_original = <RequestList>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  void buildDataGridRow() {
    _dataGridRows = _request
        .map<DataGridRow>((data) => data.getDataGridRow_RequestList())
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
                : dataGridCell.columnName == 'status'.tr
                    ? WidgetButton(
                        text: dataGridCell.value == 'A'
                            ? 'Đồng ý'
                            : dataGridCell.value == 'R'
                                ? 'Từ chối'
                                : 'Chờ Duyệt',
                        style: ElevatedButton.styleFrom(
                          backgroundColor: dataGridCell.value == 'A'
                              ? green
                              : dataGridCell.value == 'R'
                                  ? red
                                  : grey,
                          minimumSize: Size(100, 30),
                        ),
                        onPressed: () async {
                          String id = _request[_dataGridRows.indexOf(row)]
                              .requestCheckContsId!;
                          dataDetailRequestController.id.value = id;
                          imageController.id.value = id;
                          controller.selectWidget.value = detailRequest;
                        })
                    : dataGridCell.columnName == 'updateTime'.tr
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

  void applyFilter({required String filter}) {
    _request = _request_original
        .where((value) =>
            (value.cntrno?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.tenYeuCau?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.sizeType?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.updateTime?.toUpperCase().contains(filter.toUpperCase()) ??
                false))
        .toList();
    buildDataGridRow();
    notifyListeners();
  }
}
