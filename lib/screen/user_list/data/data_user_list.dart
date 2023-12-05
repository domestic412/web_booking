import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_user/model_user.dart';
import 'package:web_booking/model/list_user/storage_controller/user_controller.dart';

class DataTableUser extends DataTableSource {
  List<UserList>? data;
  String? _dt;
  // Color? _color_row;

  DataTableUser({this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    // index % 2 == 0 ? _color_row = lightGrey : _color_row = white;
    final rowData = data![index];
    rowData.maNv ??= '';
    rowData.tenNv ??= '';
    rowData.code ??= '';
    rowData.email ??= '';
    rowData.dienThoai ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy  hh:mm a")
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
        rowData.maNv!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.tenNv!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.code!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.email!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.dienThoai!,
        style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        _dt!,
        style: style_text_Table_small,
      )),
      DataCell(Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              title_user = 'update user'.tr;
              text_button_CUD = 'update'.tr;
              URL_USER = '$SERVER/User/Update';
              color_button_CUD = haian;
              CUD = 2;
              int id = data![index].id ?? 0;
              var maNv = data![index].maNv ?? '';
              var tenNv = data![index].tenNv ?? '';
              var code = data![index].code ?? '';
              var email = data?[index].email ?? '';
              var dienThoai = data?[index].dienThoai ?? '';
              var author = data![index].author ?? '';

              userController.updateUserController(
                  id: id.obs,
                  maNv: maNv.obs,
                  tenNv: tenNv.obs,
                  dienThoai: dienThoai.obs,
                  email: email.obs,
                  code: code.obs,
                  author: author.obs);
              // sideBarController.index.value = 16;
              // controller.changeWidget(SideBarController.cudUser);
              controller.selectWidget.value = cudUser;
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
              title_user = 'delete user'.tr;
              text_button_CUD = 'delete'.tr;
              URL_USER = '$SERVER/User/Delete?id=${data![index].id}';
              color_button_CUD = red;
              CUD = 3;

              int id = data![index].id ?? 0;
              var maNv = data![index].maNv ?? '';
              var tenNv = data![index].tenNv ?? '';
              var code = data![index].code ?? '';
              var email = data?[index].email ?? '';
              var dienThoai = data?[index].dienThoai ?? '';
              var author = data![index].author ?? '';

              userController.updateUserController(
                  id: id.obs,
                  maNv: maNv.obs,
                  tenNv: tenNv.obs,
                  dienThoai: dienThoai.obs,
                  email: email.obs,
                  code: code.obs,
                  author: author.obs);
              // sideBarController.index.value = 16;
              // controller.changeWidget(SideBarController.cudUser);
              controller.selectWidget.value = cudUser;
            },
            child: Tooltip(
              message: 'delete'.tr,
              child: const Icon(
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
