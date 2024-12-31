import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/screen/checking_combine/Widget/widget_grid_column_check_container.dart';
import 'package:web_booking/screen/checking_combine/data/data_table_check_combine.dart';

// ignore: must_be_immutable
class TableCheckCombine extends StatelessWidget {
  TableCheckCombine(this._dataCheckCombineSource);
  DataCheckCombineSource _dataCheckCombineSource;

  @override
  Widget build(BuildContext context) {
    return _buildDataGrid(_dataCheckCombineSource);
  }

  _buildDataGrid(DataCheckCombineSource _dataCheckCombineSource) {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.grey[200],
        ),
        child: SfDataGrid(
            rowHeight: 40,
            headerRowHeight: 40,
            // isScrollbarAlwaysShown: true,
            columnWidthMode: ColumnWidthMode.fill,
            // selectionMode: SelectionMode.single,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _dataCheckCombineSource,
            columns: [
              WidgetGridColumnCheckContainer(label: 'seq'.tr),
              WidgetGridColumnCheckContainer(label: 'cntrno'.tr),
              WidgetGridColumnCheckContainer(label: 'size'.tr),
              WidgetGridColumnCheckContainer(label: 'soLanKetHop'.tr),
              WidgetGridColumnCheckContainer(label: 'quality'.tr),
              WidgetGridColumnCheckContainer(label: 'status'.tr),
              WidgetGridColumnCheckContainer(label: 'shipper'.tr),
              WidgetGridColumnCheckContainer(label: 'result'.tr),
              WidgetGridColumnCheckContainer(label: 'upload image'.tr),
            ]));
  }
}
