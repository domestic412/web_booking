import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/list_approval/model_approval_list.dart';
import 'package:web_booking/screen/approval_list/data/data_table_approval.dart';
import 'package:web_booking/screen/approval_list/widget/widget_grid_column_approval.dart';

class TableApproval extends StatelessWidget {
  const TableApproval({super.key});

  @override
  Widget build(BuildContext context) {
    late DataApprovalSource _dataApprovalSource;
    List<ApprovalList> _approval = <ApprovalList>[];

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
                color: white, child: _buildDataGrid(_dataApprovalSource));
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
            // rowHeight: 30,
            headerRowHeight: 40,
            isScrollbarAlwaysShown: true,
            columnWidthMode: ColumnWidthMode.fill,
            selectionMode: SelectionMode.single,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _dataApprovalSource,
            columns: [
              WidgetGridColumnApproval(label: 'Seq.', visible: true),
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
