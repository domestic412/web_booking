import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/model_quality_list.dart';
import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';

class DataTableQuality extends DataTableSource {
  List<QualityList>? data;
  String? _dt;
  // Color? _color;

  DataTableQuality({this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.maChatLuong ??= '';
    rowData.tenChatLuong ??= '';
    rowData.ghiChu ??= '';
    rowData.updateUser ??= '';
    rowData.updateTime != null
        ? _dt = DateFormat("dd-MM-yyyy\nhh:mm a")
            .format(DateTime.parse(rowData.updateTime!))
        : _dt = '';
    // index % 2 == 1 ? _color = lightGrey : _color = white;
    return DataRow(
        // color: MaterialStateProperty.all(_color),
        cells: [
          DataCell(Container(
            width: 40,
            child: Center(
              child: SelectableText(
                (index + 1).toString(),
                style: style_text_Table_small,
              ),
            ),
          )),
          DataCell(Container(
            width: 100,
            child: SelectableText(
              rowData.maChatLuong!,
              style: style_text_Table_small,
            ),
          )),
          DataCell(Container(
            width: 120,
            child: SelectableText(
              rowData.tenChatLuong!,
              style: style_text_Table_small,
            ),
          )),
          DataCell(Container(
            width: 850,
            child: SelectableText(
              rowData.ghiChu!,
              style: style_text_Table_small,
            ),
          )),
          DataCell(Container(
            width: 80,
            child: SelectableText(
              _dt!,
              style: style_text_Table_small,
            ),
          )),
          DataCell(Container(
            width: 100,
            child: SelectableText(
              rowData.updateUser!,
              style: style_text_Table_small,
            ),
          )),
          DataCell(Center(
              child: Row(
            children: [
              InkWell(
                onTap: () {
                  title_CUD_quality = 'title adjust quality container'.tr;
                  text_button_CUD = 'adjust'.tr;
                  URL_QUALITY = '$SERVER/QualityList/Update';
                  color_button_CUD = haian;
                  CUD = 2;
                  int id = data![index].id ?? 0;
                  var maChatLuong = data![index].maChatLuong ?? '';
                  var tenChatLuong = data![index].tenChatLuong ?? '';
                  var ghiChu = data![index].ghiChu ?? '';
                  var updateUser = data![index].updateUser ?? '';
                  qualityController.updateQualityController(
                      id: id.obs,
                      maChatLuong: maChatLuong.obs,
                      tenChatLuong: tenChatLuong.obs,
                      ghiChu: ghiChu.obs,
                      updateUser: updateUser.obs);
                  // sideBarController.index.value = 7;
                  // controller.changeWidget(SideBarController.cudQuality);
                  controller.selectWidget.value = cudQuality;
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
                  title_CUD_quality = 'title delete quality container'.tr;
                  text_button_CUD = 'delete'.tr;
                  URL_QUALITY =
                      '$SERVER/QualityList/Delete?id=${data![index].id}';
                  color_button_CUD = red;
                  CUD = 3;
                  // id_quality = snapshot.data![index].id;
                  int id = data![index].id ?? 0;
                  var maChatLuong = data![index].maChatLuong ?? '';
                  var tenChatLuong = data![index].tenChatLuong ?? '';
                  var ghiChu = data![index].ghiChu ?? '';
                  var updateUser = data![index].updateUser ?? '';
                  qualityController.updateQualityController(
                      id: id.obs,
                      maChatLuong: maChatLuong.obs,
                      tenChatLuong: tenChatLuong.obs,
                      ghiChu: ghiChu.obs,
                      updateUser: updateUser.obs);

                  controller.selectWidget.value = cudQuality;
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
