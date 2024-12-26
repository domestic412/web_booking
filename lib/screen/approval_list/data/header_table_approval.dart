import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
import 'package:web_booking/model/list_approval/model_approval_list.dart';
import 'package:web_booking/screen/approval_list/data/data_table_approval.dart';
import 'package:web_booking/screen/approval_list/widget/widget_grid_column_approval.dart';
import 'package:web_booking/widgets/container/widget_ContainerLabel.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';
import 'package:web_booking/widgets/container/widget_calendar.dart';

class TableApproval extends StatefulWidget {
  const TableApproval({super.key});

  @override
  State<TableApproval> createState() => _TableApprovalState();
}

class _TableApprovalState extends State<TableApproval> {
  late DataApprovalSource _dataApprovalSource;
  List<ApprovalList> _approval = <ApprovalList>[];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    quoteController.fromDate_send.value =
        changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
    quoteController.fromDate_text.value =
        changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));
    quoteController.toDate_send.value =
        changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
    quoteController.toDate_text.value =
        changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApprovalList>>(
        future: ApprovalList().fetchApprovalList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _approval = snapshot.data!;
            _dataApprovalSource = DataApprovalSource(_approval);
            return Container(
                color: white,
                child: Column(
                  children: [
                    WidgetCalendar(),
                    Row(
                      children: [
                        WidgetTextFieldSearch(
                            controller: _controller, width: 300),
                        WidgetButtonFilter()
                      ],
                    ),
                    Expanded(child: _buildDataGrid(_dataApprovalSource)),
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
            _dataApprovalSource.applyFilter(filter: _controller.text);
          },
          child: Text(
            'Filter',
            style: style12_white,
          )),
    );
  }

  SfDataGridTheme _buildDataGrid(DataApprovalSource _dataApprovalSource) {
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
            source: _dataApprovalSource,
            columns: [
              WidgetGridColumnApproval(label: 'seq'.tr, visible: true),
              WidgetGridColumnApproval(
                  label: 'requestCheckContsId', visible: false),
              WidgetGridColumnApproval(label: 'container'.tr, visible: true),
              WidgetGridColumnApproval(label: 'sender'.tr, visible: true),
              WidgetGridColumnApproval(
                  label: 'approve request'.tr, visible: true),
              WidgetGridColumnApproval(label: 'update user'.tr, visible: true),
              WidgetGridColumnApproval(label: 'update time'.tr, visible: true),
            ]));
  }
}
