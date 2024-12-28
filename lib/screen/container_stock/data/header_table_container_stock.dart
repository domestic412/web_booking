import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/model/container_stock/model_container_stock.dart';
import 'package:web_booking/screen/container_stock/widget/widget_grid_column_container_stock.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';
import 'package:web_booking/widgets/container/widget_calendar.dart';

import 'data_table_container_stock.dart';

class TableContainerStock extends StatefulWidget {
  const TableContainerStock({super.key});

  @override
  State<TableContainerStock> createState() => _TableContainerStockState();
}

class _TableContainerStockState extends State<TableContainerStock> {
  late DataContainerStockSource _dataContainerStockSource;
  List<ContainerStock> _containerStock = <ContainerStock>[];
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContainerStock>>(
        future: ContainerStock().fetchContainerStock(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _containerStock = snapshot.data!;
            _dataContainerStockSource =
                DataContainerStockSource(_containerStock);
            return Container(
                color: white,
                child: Column(
                  children: [
                    WidgetCalendar(refresh: () {
                      setState(() {});
                    }),
                    Row(
                      children: [
                        WidgetTextFieldSearch(
                          controller: _controller,
                          width: 300,
                          function: (value) {
                            _dataContainerStockSource.applyFilter(
                                filter: value);
                          },
                        ),
                        WidgetButtonFilter()
                      ],
                    ),
                    Expanded(child: _buildDataGrid(_dataContainerStockSource)),
                  ],
                ));
          }
          return SizedBox.shrink();
        });
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
            _dataContainerStockSource.applyFilter(filter: _controller.text);
          },
          child: Text(
            'Filter',
            style: style12_white,
          )),
    );
  }

  SfDataGridTheme _buildDataGrid(
      DataContainerStockSource _datacontainerStockSource) {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.grey[200],
        ),
        child: SfDataGrid(
            rowHeight: 40,
            headerRowHeight: 40,
            // isScrollbarAlwaysShown: true,
            columnWidthMode: ColumnWidthMode.fill,
            selectionMode: SelectionMode.single,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _datacontainerStockSource,
            columns: [
              WidgetGridColumnContainerStock(label: 'seq'.tr),
              WidgetGridColumnContainerStock(
                  label: 'isImgUpload', visible: false),
              WidgetGridColumnContainerStock(label: 'cntrno'.tr),
              WidgetGridColumnContainerStock(label: 'size'.tr),
              WidgetGridColumnContainerStock(label: 'chatLuong'.tr),
              WidgetGridColumnContainerStock(label: 'soLanKetHop'.tr),
              WidgetGridColumnContainerStock(label: 'numCp'.tr),
              WidgetGridColumnContainerStock(label: 'status'.tr),
              WidgetGridColumnContainerStock(label: 'shipper'.tr),
              WidgetGridColumnContainerStock(
                  label: 'remark'.tr, visible: false),
              WidgetGridColumnContainerStock(label: 'ketQua'.tr),
              WidgetGridColumnContainerStock(label: 'sender'.tr),
              WidgetGridColumnContainerStock(label: 'updateTime'.tr),
            ]));
  }
}
