import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_user/model_user.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class DataTableUser extends DataTableSource {
  List<UserList>? data;
  String? _dt;
  Color? _color_row;

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
              title_user = 'update user'.tr();
              text_button_CUD = 'update'.tr();
              URL_USER = '$SERVER/User/Update';
              color_button_CUD = haian;
              CUD = 2;
              id_user = data![index].id;
              maNV_user = data![index].maNv;
              tenNv_user = data![index].tenNv;
              codeValue = data![index].code;
              email_user = data?[index].email;
              dienthoai_user = data?[index].dienThoai;
              author_user = data![index].author;
              // sideBarController.index.value = 16;
              controller.changePage(SideBarController.cudUser);
            },
            child: Tooltip(
              message: 'adjust'.tr(),
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
              title_user = 'delete user'.tr();
              text_button_CUD = 'delete'.tr();
              URL_USER = '$SERVER/User/Delete?id=${data![index].id}';
              color_button_CUD = red;
              CUD = 3;
              // id_User = data![index].id;
              maNV_user = data![index].maNv;
              tenNv_user = data![index].tenNv;
              codeValue = data![index].code;
              email_user = data?[index].email;
              dienthoai_user = data?[index].dienThoai;
              author_user = data![index].author;
              // sideBarController.index.value = 16;
              controller.changePage(SideBarController.cudUser);
            },
            child: Tooltip(
              message: 'delete'.tr(),
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
