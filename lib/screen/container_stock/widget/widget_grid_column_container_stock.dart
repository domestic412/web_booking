import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/style.dart';

WidgetGridColumnContainerStock({required String label, bool? visible}) {
  return GridColumn(
      visible: visible ?? true,
      columnName: label,
      width: label == 'seq'.tr
          ? 50
          // : label == 'cntrno'.tr
          //     ? 105
          //     : label == 'size'.tr
          //         ? 50
          //         : label == 'chatLuong'.tr
          //             ? 50
          //             : label == 'soLanKetHop'.tr
          //                 ? 180
          //                 : label == 'numCp'.tr
          //                     ? 55
          //                     : label == 'status'.tr
          //                         ? 50
          //                         : label == 'ketQua'.tr
          //                             ? 150
          //                             // : label == 'sender'.tr
          //                             //     ? 100
          //                             : label == 'updateTime'.tr
          //                                 ? 120
          : double.nan,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label, style: style12_black)));
}
