import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/container_stock/model_container_stock.dart';

class DataContainerStockSource extends DataGridSource {
  DataContainerStockSource(this._container) {
    _container_original = _container;
    buildDataGridRow();
  }

  List<ContainerStock> _container = <ContainerStock>[];
  List<ContainerStock> _container_original = <ContainerStock>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  void buildDataGridRow() {
    _dataGridRows = _container
        .map<DataGridRow>((data) => data.getDataGridRow_ContainerStock())
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
                : dataGridCell.columnName == 'dateEmptyOut'.tr ||
                        dataGridCell.columnName == 'dateFullArrived'.tr ||
                        dataGridCell.columnName == 'dateFullOut'.tr
                    ? Text(
                        changeStringDatetoShow(
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
    _container = _container_original
        .where((value) =>
            (value.cntrno?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.sizeType?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.quality
                    ?.toUpperCase()
                    .contains(filter.toUpperCase()) ??
                false) ||
            (value.status?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.shipVoy?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.dateEmptyOut?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.dateFullArrived
                    ?.toUpperCase()
                    .contains(filter.toUpperCase()) ??
                false) ||
            (value.dateFullOut?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.terminal?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.combineStuffing
                    ?.toUpperCase()
                    .contains(filter.toUpperCase()) ??
                false) ||
            (value.shipper?.toUpperCase().contains(filter.toUpperCase()) ??
                false) ||
            (value.checkDetKh
                .toString()
                .toUpperCase()
                .contains(filter.toUpperCase())))
        .toList();
    buildDataGridRow();
    notifyListeners();
  }
}
