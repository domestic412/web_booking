import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/model/check_container/storage_controller/check_container_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DataCheckCombineSource extends DataGridSource {
  DataCheckCombineSource(this._checkCombine) {
    buildDataGridRow();
  }

  List<CheckContainer> _checkCombine = <CheckContainer>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  void buildDataGridRow() {
    _dataGridRows = _checkCombine
        .map<DataGridRow>((data) => data.getDataGridRow_CheckComine())
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
                : dataGridCell.columnName == 'result'.tr
                    ? WidgetButton(
                        text: dataGridCell.value,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              dataGridCell.value == Accept ? green : red,
                          minimumSize: Size(100, 30),
                        ),
                        onPressed: () {
                          String cntrno =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .cntrno ??
                                  '';
                          String sizeType =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .sizeType ??
                                  '';
                          String quality =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .quality ??
                                  '';
                          String shipper =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .shipper ??
                                  '';
                          String remark =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .remark ??
                                  '';
                          String ghiChuTinhTrang =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .ghiChuTinhTrang ??
                                  '';
                          String luuYSuDung =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .luuYSuDung ??
                                  '';
                          String soLanKetHop =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .soLanKetHop ??
                                  '';
                          String ketQua =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .ketQua ??
                                  '';
                          String approval =
                              _checkCombine[_dataGridRows.indexOf(row)]
                                      .approval ??
                                  '';
                          checkContainerController
                              .updateCheckContainerController(
                            cntrno: cntrno,
                            sizeType: sizeType,
                            quality: quality,
                            soLanKetHop: soLanKetHop,
                            ghiChuTinhTrang: ghiChuTinhTrang,
                            luuYSuDung: luuYSuDung,
                            ketQua: ketQua,
                            approval: approval,
                            shipper: shipper,
                            remark: remark,
                          );
                          // PopUpCheckContainer(context);
                        },
                      )
                    : dataGridCell.columnName == 'updateTime'.tr
                        ? Text(
                            changeStringDateHourtoShow(
                                date: dataGridCell.value.toString()),
                            style: style12_black,
                            overflow: TextOverflow.ellipsis)
                        : SelectableText(
                            // maxLines: 2,
                            dataGridCell.value.toString(),
                            style: style12_black,
                          ));
      })
    ]);
  }
}
