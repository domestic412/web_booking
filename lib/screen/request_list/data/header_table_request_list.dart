import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/model/list_request/model_request_list.dart';
import 'package:web_booking/screen/request_list/data/data_table_request_list.dart';
import 'package:web_booking/screen/request_list/widget/widget_grid_column_request_list.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';
import 'package:web_booking/widgets/container/widget_calendar.dart';

class TableRequestList extends StatefulWidget {
  const TableRequestList({super.key});

  @override
  State<TableRequestList> createState() => _TableRequestListState();
}

class _TableRequestListState extends State<TableRequestList> {
  late DataRequestListSource _dataRequestListSource;
  List<RequestList> _requestList = <RequestList>[];
  TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   dateController.fromDate_send.value =
  //       changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
  //   dateController.fromDate_show.value =
  //       changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));
  //   dateController.toDate_send.value =
  //       changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
  //   dateController.toDate_show.value =
  //       changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RequestList>>(
        future: RequestList().fetchRequestList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _requestList = snapshot.data!;
            _dataRequestListSource = DataRequestListSource(_requestList);
            return Container(
                color: white,
                child: Column(
                  children: [
                    // WidgetCalendar(refresh: () {
                    //   print('1234');
                    // }),
                    Row(
                      children: [
                        WidgetTextFieldSearch(
                          controller: _controller,
                          width: 300,
                          onSubmitted: (value) {
                            _dataRequestListSource.applyFilter(filter: value);
                          },
                        ),
                        WidgetButtonFilter()
                      ],
                    ),
                    Expanded(child: _buildDataGrid(_dataRequestListSource)),
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
            _dataRequestListSource.applyFilter(filter: _controller.text);
          },
          child: Text(
            'Filter',
            style: style12_white,
          )),
    );
  }

  SfDataGridTheme _buildDataGrid(DataRequestListSource _dataRequestListSource) {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.grey[200],
        ),
        child: SfDataGrid(
            rowHeight: 30,
            headerRowHeight: 40,
            // isScrollbarAlwaysShown: true,
            columnWidthMode: ColumnWidthMode.fill,
            // selectionMode: SelectionMode.single,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _dataRequestListSource,
            columns: [
              WidgetGridColumnRequestList(label: 'seq'.tr),
              WidgetGridColumnRequestList(
                  label: 'requestCheckContsId', visible: false),
              WidgetGridColumnRequestList(label: 'tenYeuCau'.tr),
              WidgetGridColumnRequestList(label: 'cntrno'.tr),
              WidgetGridColumnRequestList(label: 'size'.tr),
              WidgetGridColumnRequestList(label: 'status'.tr),
              WidgetGridColumnRequestList(label: 'updateTime'.tr),
            ]));
  }
}
