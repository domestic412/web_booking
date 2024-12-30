import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/screen/checking_combine/data/data_table_check_combine.dart';

class TableCheckCombine extends StatefulWidget {
  const TableCheckCombine({super.key});

  @override
  State<TableCheckCombine> createState() => _TableCheckCombineState();
}

class _TableCheckCombineState extends State<TableCheckCombine> {
  late DataCheckCombineSource _dataCheckCombineSource;
  List<CheckContainer> _checkContainer = <CheckContainer>[];

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
    return FutureBuilder<List<CheckContainer>>(
        future: CheckContainer().fetchCheckContainers(context, '', 0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            _checkContainer = snapshot.data!;
            _dataApprovalSource = DataApprovalSource(_checkContainer);
            return Container(
                color: white,
                child: Expanded(child: _buildDataGrid(_dataApprovalSource)));
          }
          return SizedBox.shrink();
        });
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
              WidgetGridColumnApproval(label: 'seq'.tr),
              WidgetGridColumnApproval(
                  label: 'requestCheckContsId', visible: false),
              WidgetGridColumnApproval(label: 'cntrno'.tr),
              WidgetGridColumnApproval(label: 'sender'.tr),
              WidgetGridColumnApproval(label: 'approve request'.tr),
              WidgetGridColumnApproval(label: 'update user'.tr),
              WidgetGridColumnApproval(label: 'updateTime'.tr),
            ]));
  }
}
