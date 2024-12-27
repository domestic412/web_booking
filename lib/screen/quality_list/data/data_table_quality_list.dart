import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/model_quality_list.dart';
import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';

class DataQualitySource extends DataGridSource {
  DataQualitySource(this._quality) {
    // _paginateQuality = _quality.getRange(0, 13).toList();
    buildDataGridRow();
  }

  List<QualityList> _quality = <QualityList>[];
  // List<QualityList> _paginateQuality = [];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];
  // int _rowsPerPage = 10;

  void buildDataGridRow() {
    _dataGridRows = _quality
        .map<DataGridRow>((data) => data.getDataGridRow_Quality())
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
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
                : dataGridCell.columnName == 'updateTime'.tr
                    ? Text(
                        changeStringDatetoShow(
                            date: dataGridCell.value.toString()),
                        style: style12_black,
                        // overflow: TextOverflow.ellipsis,
                      )
                    : dataGridCell.columnName == '##'
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  title_CUD_quality =
                                      'title adjust quality container'.tr;
                                  text_button_CUD = 'adjust'.tr;
                                  URL_QUALITY = '$SERVER/QualityList/Update';
                                  color_button_CUD = haian;
                                  CUD = 2;
                                  int id =
                                      _quality[_dataGridRows.indexOf(row)].id ??
                                          0;
                                  String maChatLuong =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .maChatLuong ??
                                          '';
                                  String tenChatLuong =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .tenChatLuong ??
                                          '';
                                  String ghiChu =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .ghiChu ??
                                          '';
                                  String updateUser =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .updateUser ??
                                          '';
                                  qualityController.updateQualityController(
                                      id: id.obs,
                                      maChatLuong: maChatLuong.obs,
                                      tenChatLuong: tenChatLuong.obs,
                                      ghiChu: ghiChu.obs,
                                      updateUser: updateUser.obs);
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
                                  title_CUD_quality =
                                      'title delete quality container'.tr;
                                  text_button_CUD = 'delete'.tr;
                                  URL_QUALITY =
                                      '$SERVER/QualityList/Delete?id=${_quality[_dataGridRows.indexOf(row)].id}';
                                  color_button_CUD = red;
                                  CUD = 3;
                                  // id_quality = snapshot.data![index].id;
                                  int id =
                                      _quality[_dataGridRows.indexOf(row)].id ??
                                          0;
                                  var maChatLuong =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .maChatLuong ??
                                          '';
                                  var tenChatLuong =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .tenChatLuong ??
                                          '';
                                  var ghiChu =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .ghiChu ??
                                          '';
                                  var updateUser =
                                      _quality[_dataGridRows.indexOf(row)]
                                              .updateUser ??
                                          '';
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
                          )
                        : SelectableText(
                            // maxLines: 2,
                            dataGridCell.value.toString(),
                            style: style12_black,
                            // overflow: TextOverflow.ellipsis,
                          ));
        // : _buildTextwithTooltip(dataGridCell));
      })
    ]);
  }

  // Widget _buildTextwithTooltip(DataGridCell<dynamic> dataGridCell) {
  //   return LayoutBuilder(builder: (context, constraints) {
  //     final TextPainter textPainter = TextPainter(
  //       text: TextSpan(
  //         text: dataGridCell.value.toString(),
  //         style: style12_black,
  //       ),
  //       maxLines: 2,
  //       textDirection: TextDirection.ltr,
  //     )..layout(
  //         maxWidth: constraints.maxWidth,
  //       );
  //     final bool isOverflowing = textPainter.didExceedMaxLines;
  //     return Tooltip(
  //       message: isOverflowing ? dataGridCell.value.toString() : '',
  //       child: Text(
  //         maxLines: 2,
  //         dataGridCell.value.toString(),
  //         style: style12_black,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //     );
  //   });
  // }

  // @override
  // Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
  //   int startIndex = newPageIndex * _rowsPerPage;
  //   int endIndex = startIndex + _rowsPerPage;
  //   if (startIndex < _quality.length && endIndex <= _quality.length) {
  //     _paginateQuality =
  //         _quality.getRange(startIndex, endIndex).toList(growable: false);
  //     buildDataGridRow();
  //     notifyListeners();
  //   } else {
  //     _paginateQuality = [];
  //   }

  //   return true;
  // }
}
