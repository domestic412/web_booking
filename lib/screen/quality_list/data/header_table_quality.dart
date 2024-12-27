import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/list_quality/model_quality_list.dart';
import 'package:web_booking/screen/quality_list/data/data_table_quality_list.dart';
import 'package:web_booking/screen/quality_list/widget/widget_GridColumn_Quality.dart';

class TableQuality extends StatelessWidget {
  const TableQuality({super.key});

  @override
  Widget build(BuildContext context) {
    // final int _rowsPerPage = 10;
    // final double _dataPagerHeight = 60;
    late DataQualitySource _dataQualitySource;
    List<QualityList> _quality = <QualityList>[];

    return FutureBuilder<List<QualityList>>(
        future: QualityList().fetchQualityList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _quality = snapshot.data!;
            _dataQualitySource = DataQualitySource(_quality);
            return Container(
                color: white, child: _buildDataGrid(_dataQualitySource));
            // Column(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         color: white,
            //         child: _buildDataGrid(_dataQualitySource),
            //       ),
            //     ),
            //     Container(
            //       height: _dataPagerHeight,
            //       child: SfDataPager(
            //         pageCount: _quality.length / _rowsPerPage + 1,
            //         delegate: _dataQualitySource,
            //         direction: Axis.horizontal,
            //       ),
            //     )
            //   ],
            // );
          }
          return SizedBox.shrink();
        });
  }

  SfDataGridTheme _buildDataGrid(DataQualitySource _dataQualitySource) {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.grey[200],
        ),
        child: SfDataGrid(
            // rowHeight: 30,
            headerRowHeight: 40,
            isScrollbarAlwaysShown: true,
            columnWidthMode: ColumnWidthMode.fill,
            selectionMode: SelectionMode.single,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _dataQualitySource,
            columns: [
              WidgetGridColumnQuality(label: 'Seq.', visible: true),
              WidgetGridColumnQuality(label: 'id', visible: false),
              WidgetGridColumnQuality(label: 'quality code'.tr, visible: true),
              WidgetGridColumnQuality(label: 'quality name'.tr, visible: true),
              WidgetGridColumnQuality(label: 'note'.tr, visible: true),
              WidgetGridColumnQuality(label: 'updateTime'.tr, visible: true),
              WidgetGridColumnQuality(label: 'updater'.tr, visible: true),
              WidgetGridColumnQuality(label: '##', visible: true),
            ]));
  }
}
