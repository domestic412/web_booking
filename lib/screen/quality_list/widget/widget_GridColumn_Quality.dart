import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';

WidgetGridColumnQuality({required String label, required bool visible}) {
  return GridColumn(
      visible: visible,
      columnName: label,
      width: label == 'Seq.'
          ? 40
          : label == 'quality code'.tr
              ? 90
              : label == 'quality name'.tr
                  ? 200
                  : label == 'update time'.tr
                      ? 80
                      : label == 'updater'.tr
                          ? 60
                          : label == '##'
                              ? 80
                              : double.nan,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: style12_black, overflow: TextOverflow.ellipsis)));
}
