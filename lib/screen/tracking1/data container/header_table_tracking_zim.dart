import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/screen/tracking1/widgets/widget_grid_column_tracking_zim.dart';

import 'data_table_tracking_zim.dart';

// ignore: must_be_immutable
class TableTrackingZim extends StatelessWidget {
  TableTrackingZim(
    this._dataTrackingZimSource,
  );
  DataTrackingZimSource _dataTrackingZimSource;

  @override
  Widget build(BuildContext context) {
    return _buildDataGrid(_dataTrackingZimSource);
  }

  _buildDataGrid(DataTrackingZimSource _dataTrackingZimSource) {
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
            source: _dataTrackingZimSource,
            columns: [
              WidgetGridColumnTrackingZim(label: 'seq'.tr),
              WidgetGridColumnTrackingZim(label: 'container'.tr),
              WidgetGridColumnTrackingZim(label: 'status'.tr),
              WidgetGridColumnTrackingZim(label: 'location'.tr),
              WidgetGridColumnTrackingZim(label: 'eventDate'.tr),
            ]));
  }
}
