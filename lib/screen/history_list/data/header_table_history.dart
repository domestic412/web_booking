import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/date_controller.dart';
import 'package:web_booking/model/list_history/model_history_list.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';
import 'package:web_booking/screen/history_list/widget/widget_grid_column_history.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';
import 'package:web_booking/widgets/container/widget_calendar.dart';
import 'data_table_history.dart';

class TableHistory extends StatefulWidget {
  const TableHistory({super.key});

  @override
  State<TableHistory> createState() => _TableHistoryState();
}

class _TableHistoryState extends State<TableHistory> {
  late DataHistorySource _dataHistorySource;
  List<HistoryList> _History = <HistoryList>[];
  TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   historyController.fromDate_send.value =
  //       changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
  //   historyController.fromDate_show.value =
  //       changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));
  //   historyController.toDate_send.value =
  //       changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
  //   historyController.toDate_show.value =
  //       changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HistoryList>>(
        future: HistoryList().fetchHistoryList(
            fromDate: dateController.fromDate_send.value,
            toDate: dateController.toDate_send.value),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _History = snapshot.data!;
            _dataHistorySource = DataHistorySource(_History);
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
                            _dataHistorySource.applyFilter(filter: value);
                          },
                        ),
                        WidgetButtonFilter()
                      ],
                    ),
                    Expanded(child: _buildDataGrid(_dataHistorySource)),
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
            _dataHistorySource.applyFilter(filter: _controller.text);
          },
          child: Text(
            'Filter',
            style: style12_white,
          )),
    );
  }

  SfDataGridTheme _buildDataGrid(DataHistorySource _dataHistorySource) {
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
            source: _dataHistorySource,
            columns: [
              WidgetGridColumnHistory(label: 'seq'.tr),
              WidgetGridColumnHistory(label: 'isImgUpload', visible: false),
              WidgetGridColumnHistory(label: 'cntrno'.tr),
              WidgetGridColumnHistory(label: 'size'.tr),
              WidgetGridColumnHistory(label: 'chatLuong'.tr),
              WidgetGridColumnHistory(label: 'soLanKetHop'.tr),
              WidgetGridColumnHistory(label: 'numCp'.tr),
              WidgetGridColumnHistory(label: 'status'.tr),
              WidgetGridColumnHistory(label: 'shipper'.tr),
              WidgetGridColumnHistory(label: 'remark'.tr, visible: false),
              WidgetGridColumnHistory(label: 'ketQua'.tr),
              WidgetGridColumnHistory(label: 'sender'.tr),
              WidgetGridColumnHistory(label: 'updateTime'.tr),
            ]));
  }
}
