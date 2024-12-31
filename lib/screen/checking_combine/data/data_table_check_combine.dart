import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/model/check_container/storage_controller/check_container_controller.dart';
import 'package:web_booking/screen/checking_combine/popUp_detail_container/popUp_detail_checking_combine.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DataCheckCombineSource extends DataGridSource {
  DataCheckCombineSource(this._checkCombine, this.context) {
    buildDataGridRow();
  }

  List<CheckContainer> _checkCombine = <CheckContainer>[];
  List<DataGridRow> _dataGridRows = <DataGridRow>[];
  late BuildContext context;

  void buildDataGridRow() {
    _dataGridRows = _checkCombine
        .map<DataGridRow>((data) => data.getDataGridRow_CheckContainer())
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
                          PopUpCheckContainer(context);
                        },
                      )
                    : dataGridCell.columnName == 'upload image'.tr
                        ? Center(
                            child: IconButton(
                                onPressed: () {
                                  getImage(
                                      ImageSource.gallery,
                                      _checkCombine[_dataGridRows.indexOf(row)]
                                          .cntrno!);
                                },
                                icon: Icon(
                                  Icons.image,
                                  color: haian,
                                )))
                        : SelectableText(
                            // maxLines: 2,
                            dataGridCell.value.toString(),
                            style: style12_black,
                          ));
      })
    ]);
  }

  List<XFile>? listImg;
  Future getImage(ImageSource media, String cntr) async {
    // String? base64image;
    final ImagePicker _picker = ImagePicker();
    List<XFile> img = await _picker.pickMultiImage();

    listImg = img;

    if (listImg!.isNotEmpty) {
      checkContainerController.pathImg.value = listImg![0].path;
      return Get.defaultDialog(
        title: 'Preview Image',
        content: Container(
          height: deviceHeight(context) * 0.8,
          width: deviceWidth(context) * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: deviceHeight(context) * 0.8,
                width: deviceWidth(context) * 0.25,
                decoration: BoxDecoration(border: Border.all()),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listImg!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                          margin: EdgeInsets.all(15),
                          child: InkWell(
                              onTap: () {
                                checkContainerController.pathImg.value =
                                    listImg![index].path;
                                // print(quoteController.pathImg.value);
                              },
                              child: Text(listImg![index].name)));
                    }),
              ),
              Obx(() => Container(
                    height: deviceHeight(context) * 0.8,
                    width: deviceWidth(context) * 0.5,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Image.network(checkContainerController.pathImg.value,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                      return const Center(
                        child: Text('This image type is not supported:'),
                      );
                    }),
                  ))
            ],
          ),
        ),
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: normalColor),
            onPressed: () {
              PostImgQuote(
                  cntr: cntr, date: changeDatetoSend(date: DateTime.now()));
              // quoteController.pathImg.value = '';
            },
            child: Text(
              'Send',
              style: TextStyle(color: white),
            )),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: grey),
            onPressed: () {
              // quoteController.pathImg.value = '';
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: white),
            )),
      );
    }
  }

  Future<void> PostImgQuote(
      {required String cntr, required String date}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
      //PostRequest with multipartFile
      // Create a FormData object to store your files
      final formData = html.FormData();
      final url = '$SERVER/ImageCombine?container=$cntr&UpdateTime=$date';
      // Assuming a list of XFile objects in _listImage
      if (listImg != null) {
        for (int i = 0; i < listImg!.length; i++) {
          final file = listImg![i];
          //Convert XFile to Blob
          final blob = html.Blob([await file.readAsBytes()], file.mimeType);
          // Add the Blob to the FormData object
          formData.appendBlob('files', blob, file.name);
        }
      }
      final request = html.HttpRequest();
      request.open(
        'POST',
        url,
      );
      request.send(formData);
      request.onLoad.listen((html.ProgressEvent event) {
        switch (request.status) {
          case 200:
            print('Success send Image quote');
            EasyLoading.showSuccess('Upload Success');
            if (Get.isDialogOpen == true) {
              Get.back();
            }
          default:
            EasyLoading.showError('Upload Fail');
            print('Error ${request.status} send Image quote ' + cntr);
        }
      });
    } on Exception catch (e) {
      EasyLoading.showError('Upload Fail');
      print(e);
      throw Exception('Error fetch Image - $e');
    }
  }
}
