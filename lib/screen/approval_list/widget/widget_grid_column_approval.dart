import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';

WidgetGridColumnApproval({required String label, required bool visible}) {
  return GridColumn(
      visible: visible,
      columnName: label,
      width: label == 'seq'.tr
          ? 40
          : label == 'container'.tr
              ? 150
              : label == 'approve request'.tr
                  ? 110
                  : label == 'update user'.tr
                      ? 110
                      : label == 'update time'.tr
                          ? 120
                          : double.nan,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: style12_black, overflow: TextOverflow.ellipsis)));
}
