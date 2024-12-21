import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_approval/model_approval_list.dart';
import 'package:web_booking/model/list_approval/model_detail_approval.dart';
import 'package:web_booking/storage_controller.dart/controller_image.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DataApprovalSource extends DataGridSource {
  DataApprovalSource(this._approval) {
    buildDataGridRow();
  }

  List<ApprovalList> _approval = <ApprovalList>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  void buildDataGridRow() {
    _dataGridRows = _approval
        .map<DataGridRow>((data) => data.getDataGridRow_Approval())
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        child: Text(
          (_dataGridRows.indexOf(row) + 1).toString(),
          style: style12_black,
        ),
      ),
      ...row.getCells().map<Widget>((dataGridCell) {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(5.0),
            child: dataGridCell.value == null
                ? SizedBox()
                : dataGridCell.columnName == 'approve request'.tr
                    ? WidgetButton(
                        text: dataGridCell.value == 'A'
                            ? 'Đồng ý'
                            : dataGridCell.value == 'R'
                                ? 'Từ chối'
                                : 'Chờ Duyệt',
                        style: ElevatedButton.styleFrom(
                          backgroundColor: dataGridCell.value == 'A'
                              ? green
                              : dataGridCell.value == 'R'
                                  ? red
                                  : grey,
                          minimumSize: Size(100, 35),
                        ),
                        onPressed: () async {
                          String id = _approval[_dataGridRows.indexOf(row)]
                              .requestCheckContsId!;
                          await DetailApproval().fetchDetailApproval(id: id);
                          imageController.id.value = id;
                          controller.selectWidget.value = detailApproval;
                        })
                    : dataGridCell.columnName == 'update time'.tr
                        ? Text(
                            changeStringDatetoShow(
                                date: dataGridCell.value.toString()),
                            style: style12_black,
                            overflow: TextOverflow.ellipsis)
                        : SelectableText(
                            maxLines: 2,
                            dataGridCell.value.toString(),
                            style: style12_black,
                          ));
      })
    ]);
  }
}
