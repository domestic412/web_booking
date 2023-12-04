import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_%20special_policy/model_special_policy.dart';

class DataTablePolicy extends DataTableSource {
  List<SpecialPolicyList>? data;
  String? _dt;

  DataTablePolicy({this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.code ??= '';
    rowData.shipper ??= '';
    rowData.times ??= '';
    rowData.updateUser ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy hh:mm a")
            .format(DateTime.parse(rowData.updateTime!))
        : _dt = '';

    return DataRow(cells: [
      DataCell(SizedBox(
        width: 40,
        child: Center(
          child: SelectableText(
            (index + 1).toString(),
            style: style_text_Table_small,
          ),
        ),
      )),
      DataCell(SelectableText(
        rowData.code!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.shipper!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.times!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.updateUser!,
        style: style_text_Table_small,
      )),
      DataCell(Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              title_CUD_special_policy = 'title adjust policy container'.tr;
              text_button_CUD = 'adjust'.tr;
              URL_SPECIAL_POLICY = '$SERVER/SpecialPolicy/Update';
              color_button_CUD = haian;
              CUD = 2;
              id_policy = data![index].id;
              code_policy = data![index].code;
              shipper_policy = data![index].shipper;
              times_policy = data![index].times;
              // sideBarController.index.value = 9;
              // controller.changeWidget(SideBarController.cudPolicy);
              controller.selectWidget.value = cudPolicy;
            },
            child: Tooltip(
              message: 'adjust'.tr,
              child: const Icon(
                Icons.drive_file_rename_outline_sharp,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              title_CUD_special_policy = 'title delete policy container'.tr;
              text_button_CUD = 'delete'.tr;
              URL_SPECIAL_POLICY =
                  '$SERVER/SpecialPolicy/Delete?id=${data![index].id}';
              color_button_CUD = red;
              CUD = 3;
              code_policy = data![index].code;
              shipper_policy = data![index].shipper;
              times_policy = data![index].times;
              // sideBarController.index.value = 9;
              // controller.changeWidget(SideBarController.cudPolicy);
              controller.selectWidget.value = cudPolicy;
            },
            child: Tooltip(
              message: 'delete'.tr,
              child: Icon(
                Icons.delete,
                size: 20,
              ),
            ),
          )
        ],
      ))),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
