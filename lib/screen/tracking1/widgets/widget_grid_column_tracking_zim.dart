import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';

WidgetGridColumnTrackingZim({required String label, bool? visible}) {
  return GridColumn(
      visible: visible ?? true,
      columnName: label,
      width: label == 'seq'.tr
          ? 50
          : label == 'container'.tr
              ? 105
              : label == 'location'.tr
                  ? 200
                  : label == 'eventDate'.tr
                      ? 150
                      : double.nan,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label, style: style12_black)));
}
