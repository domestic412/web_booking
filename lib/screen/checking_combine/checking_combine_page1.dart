import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/model/check_container/storage_controller/check_container_controller.dart';
import 'package:web_booking/screen/checking_combine/Widget/policy_checking_combine.dart';
import 'package:web_booking/screen/checking_combine/Widget/radio_button_route.dart';
import 'package:web_booking/screen/checking_combine/import_excel/import_excel.dart';
import 'package:web_booking/screen/checking_combine/popUp_detail_container/popUp_detail_checking_combine.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';

class CheckingCombinePage extends StatefulWidget {
  @override
  State<CheckingCombinePage> createState() => _CheckingCombinePageState();
}

class _CheckingCombinePageState extends State<CheckingCombinePage> {
  TextEditingController _controller = TextEditingController();
  List _countCont = [];
  Future<List<CheckContainer>>? _checkContainers;
  Color? _color;

  int i = 0;
  int route = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "checking combine".tr,
                  style: style_title_page,
                ),
              ),
              PolicyCheckContainer(),
              SizedBox(
                height: 15,
              ),
              WidgetTextFieldSearch(
                controller: _controller,
                style: style14_black,
                onSubmitted: (value) {
                  setState(() {
                    _checkContainers = CheckContainer().fetchCheckContainers(
                        context,
                        _controller.text.trim().toUpperCase(),
                        currentOptionsRoute);
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        WidgetButton(
                          text: 'import excel'.tr,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: haian,
                            minimumSize: Size(100, 35),
                          ),
                          onPressed: () async {
                            // int j = 0;
                            String _listCont = '';
                            await Import().ImportExcel();
                            if (resultPickedFile != null) {
                              var bytes = resultPickedFile?.files.single.bytes;
                              // var excel = Excel.decodeBytes(bytes!);
                              var decoder = SpreadsheetDecoder.decodeBytes(
                                  bytes!,
                                  update: true);
                              // choose sheet1 in file excel
                              // String table = 'Sheet1';
                              // for (var table in excel.tables.keys) {         // take data all sheet in file excel
                              // print(table);                                  // sheet Name
                              // print(excel.tables[table]!.maxColumns);        // max number column
                              // print(excel.tables[table]!.maxRows);               // print max number row
                              // take all data, style, cell... each row
                              var sharedStrings = decoder.tables.values
                                  .expand((table) => table.rows);
                              i = 0;
                              for (var cntr in sharedStrings) {
                                if (i < (sharedStrings.length - 1)) {
                                  _listCont =
                                      _listCont + cntr[0].toString() + ' ';
                                } else {
                                  _listCont = _listCont + cntr[0].toString();
                                }
                              }
                              setState(() {
                                _controller.text = _listCont;
                                _listCont = '';
                              });
                            } else {
                              print('no data');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: RadioButtonRoute()),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(child: fetchDataListContainer()),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<CheckContainer>> fetchDataListContainer() {
    return FutureBuilder<List<CheckContainer>>(
      future: _checkContainers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          _countCont = _controller.text
              .trim()
              .split(' '); // list space to count the number of containers
          // print('show data check container');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              snapshot.data!.length < _countCont.length
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      child: Text(
                        'not found container number'.tr,
                        style: style12_red_bold,
                      ))
                  : Container(),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'result'.tr,
                  style: style14_black,
                ),
              ),
              Container(
                width: deviceWidth(context),
                decoration: BoxDecoration(
                  color: white,
                  // border: Border.all(color: blue.withOpacity(.4), width: .5),                            // error excel
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: blue.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DataCheckContainer(snapshot, context),
              ),
            ],
          );
        } else if (snapshot.hasError && _controller.text == '') {
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'cont number null'.tr,
              style: style12_red_bold,
            ),
          );
        }
        // else if (snapshot.hasError && _CntrNo.text != '') {
        //   return Container(
        //     padding: const EdgeInsets.only(left: 32, right: 32),
        //     child: Text(
        //       snapshot.error.toString(),
        //       style: TextStyle(fontSize: 16, color: red),
        //     ),
        //   );
        // }
        return SizedBox();
      },
    );
  }

  DataTable DataCheckContainer(
      AsyncSnapshot<List<CheckContainer>> snapshot, BuildContext context) {
    return DataTable(
        headingRowColor: WidgetStateProperty.resolveWith((states) => lightGrey),
        border: const TableBorder(
            verticalInside: BorderSide(color: Colors.black12)),
        sortColumnIndex: 0,
        dataRowMaxHeight: 50,
        columnSpacing: 10,
        columns: [
          DataColumn(
            label: Expanded(
              child: Center(child: Text('seq'.tr, style: style12_black)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('cntrno'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('size'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: SizedBox(
                  width: 110,
                  child:
                      Text('number of times combine'.tr, style: style12_black),
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('quality'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('status'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('shipper'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('result'.tr, style: style12_black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('upload image'.tr, style: style12_black),
              ),
            ),
          ),
        ],
        rows: List.generate(snapshot.data!.length, (index) {
          if (snapshot.data![index].approval == Accept) {
            _color = green;
          } else {
            _color = red;
          }
          return DataRow(cells: [
            DataCell(
              Center(
                child: Text(
                  (index + 1).toString(),
                  style: style12_black,
                ),
              ),
            ),
            DataCell(Center(
              child: Text(
                snapshot.data![index].cntrno.toString(),
                style: style12_black,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].sizeType.toString(),
                style: style12_black,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Container(
                width: 110,
                child: Text(
                  snapshot.data![index].soLanKetHop.toString(),
                  style: style12_black,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].quality.toString(),
                style: style12_black,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].status.toString(),
                style: style12_black,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Container(
                width: 100,
                child: SingleChildScrollView(
                  child: Text(
                    snapshot.data![index].shipper.toString(),
                    style: style12_black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )),
            DataCell(Center(
              child: Container(
                width: 150,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Tooltip(
                  message: snapshot.data![index].remark,
                  child: WidgetButton(
                    text: snapshot.data![index].approval.toString(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      minimumSize: Size(100, 35),
                    ),
                    onPressed: () {
                      String cntrno = snapshot.data![index].cntrno ?? '';
                      String sizeType = snapshot.data![index].sizeType ?? '';
                      String quality = snapshot.data![index].quality ?? '';
                      String shipper = snapshot.data![index].shipper ?? '';
                      String remark = snapshot.data![index].remark ?? '';
                      String ghiChuTinhTrang =
                          snapshot.data![index].ghiChuTinhTrang ?? '';
                      String luuYSuDung =
                          snapshot.data![index].luuYSuDung ?? '';
                      String soLanKetHop =
                          snapshot.data![index].soLanKetHop ?? '';
                      String ketQua = snapshot.data![index].ketQua ?? '';
                      String approval = snapshot.data![index].approval ?? '';
                      checkContainerController.updateCheckContainerController(
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
                  ),
                ),
              ),
            )),
            DataCell(Center(
                child: IconButton(
                    onPressed: () {
                      getImage(
                          ImageSource.gallery, snapshot.data![index].cntrno!);
                    },
                    icon: Icon(
                      Icons.image,
                      color: haian,
                    )))),
          ]);
        }));
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
