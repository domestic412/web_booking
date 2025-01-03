import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/screen/tracking1/widgets/widget_grid_column_tracking_container.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';

import 'data_table_tracking_container.dart';

// ignore: must_be_immutable
class TableTrackingContainer extends StatelessWidget {
  TableTrackingContainer(
    this._dataTrackingContainerSource,
  );
  DataTrackingContainerSource _dataTrackingContainerSource;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildDataGrid(_dataTrackingContainerSource);
  }

  _buildDataGrid(DataTrackingContainerSource _dataTrackingContainerSource) {
    return Column(
      children: [
        Row(
          children: [
            WidgetTextFieldSearch(
              controller: _controller,
              width: 300,
              onSubmitted: (value) {
                _dataTrackingContainerSource.applyFilter(filter: value);
              },
            ),
            WidgetButtonFilter()
          ],
        ),
        Expanded(
          child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: Colors.grey[200],
              ),
              child: SfDataGrid(
                  rowHeight: 40,
                  headerRowHeight: 40,
                  columnWidthMode: ColumnWidthMode.fill,
                  isScrollbarAlwaysShown: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  source: _dataTrackingContainerSource,
                  columns: [
                    WidgetGridColumnTrackingContainer(label: 'seq'.tr),
                    WidgetGridColumnTrackingContainer(label: 'container'.tr),
                    WidgetGridColumnTrackingContainer(label: 'size'.tr),
                  ])),
        ),
      ],
    );
  }

  Container WidgetButtonFilter() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: haian,
            minimumSize: Size(100, 35),
          ),
          onPressed: () {
            _dataTrackingContainerSource.applyFilter(filter: _controller.text);
          },
          child: Text(
            'Filter',
            style: style12_white,
          )),
    );
  }
}
