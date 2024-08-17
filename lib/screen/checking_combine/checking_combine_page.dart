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
// import 'package:easy_localization/easy_localization.dart';

class CheckingCombinePage extends StatefulWidget {
  @override
  State<CheckingCombinePage> createState() => _CheckingCombinePageState();
}

class _CheckingCombinePageState extends State<CheckingCombinePage> {
  final _CntrNo = TextEditingController();
  List _countCont = [];
  Future<List<CheckContainer>>? _checkContainers;
  Color? _color;

  String _list_input = '';
  int i = 0;
  int route = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: deviceWidth(context),
                alignment: Alignment.center,
                child: Text(
                  "checking combine".tr,
                  style: style_title_page,
                ),
              ),
              PolicyCheckContainer(),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  // border: Border.all(color: blue.withOpacity(.4), width: .5),          // error excel
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: blue.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Colors.black45)            // error excel
                  ),
                  child: ListTile(
                    leading: Icon(Icons.calendar_view_week_rounded),
                    title: TextField(
                        // inputFormatters: [InputContainerFormatter()],
                        onSubmitted: (value) {
                          setState(() {
                            _checkContainers = CheckContainer()
                                .fetchCheckContainers(
                                    _CntrNo.text.trim(), currentOptionsRoute);
                          });
                        },
                        controller: _CntrNo,
                        textCapitalization: TextCapitalization.characters,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black87),
                        decoration: InputDecoration(
                            hintText: 'enter container number'.tr,
                            border: InputBorder.none,
                            suffix: Container(
                              width: 120,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _checkContainers = CheckContainer()
                                              .fetchCheckContainers(
                                                  _CntrNo.text.trim(),
                                                  currentOptionsRoute);
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Search',
                                      style: TextStyle(color: blue),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _CntrNo.text = '';
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Clear',
                                      style: TextStyle(color: grey),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          // width: 135,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: haian,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () async {
                                // int j = 0;
                                String _listCont = '';
                                await Import().ImportExcel();
                                if (resultPickedFile != null) {
                                  var bytes =
                                      resultPickedFile?.files.single.bytes;
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
                                      _listCont =
                                          _listCont + cntr[0].toString();
                                    }
                                  }
                                  // print(_listCont);
                                  setState(() {
                                    _CntrNo.text = _listCont;
                                    _listCont = '';
                                  });
                                  // List list_cont = row
                                  //       .map((e) => e?.value)
                                  //       .toList(); //add data to list_cont with container is list_cont[0]
                                  //   print(list_cont[0]);

                                  // if (i < decoder.tables[table]!.maxRows) {
                                  //   if (i ==
                                  //       (decoder.tables[table]!.maxRows - 1)) {
                                  //     //take last cont number
                                  //     _list_input = _list_input +
                                  //         list_cont[0].toString();
                                  //   } else if (i > 0) {
                                  //     //take cont number from 2
                                  //     _list_input = _list_input +
                                  //         list_cont[0].toString() +
                                  //         ' ';
                                  //   }
                                  //   i++;
                                  // }
                                  // print(_list_input);
                                  // setState(() {
                                  //   _CntrNo.text = _list_input;
                                  //   _list_input = '';
                                  //   i = 0;
                                  // });
                                  // }
                                } else {
                                  print('no data');
                                }
                              },
                              child: Text(
                                'import excel'.tr,
                                style: TextStyle(color: white, fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: RadioButtonRoute()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(child: fetchDataListContainer()),
            ],
          ),
        ),
      ),
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
          _countCont = _CntrNo.text
              .trim()
              .split(' '); // list space to count the number of containers
          // print('show data check container');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              snapshot.data!.length < _countCont.length
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      child: Text(
                        'not found container number'.tr,
                        style: TextStyle(fontSize: 16, color: red),
                      ))
                  : Container(),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'result combine'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        } else if (snapshot.hasError && _CntrNo.text == '') {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(
              'cont number null'.tr,
              style: TextStyle(fontSize: 16, color: red),
            ),
          );
        } else if (snapshot.hasError && _CntrNo.text != '') {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(
              'only cont types a0 & a1 are combined'.tr,
              style: TextStyle(fontSize: 16, color: red),
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  DataTable DataCheckContainer(
      AsyncSnapshot<List<CheckContainer>> snapshot, BuildContext context) {
    return DataTable(
        headingRowColor:
            MaterialStateProperty.resolveWith((states) => lightGrey),
        border: const TableBorder(
            verticalInside: BorderSide(color: Colors.black12)),
        sortColumnIndex: 0,
        dataRowMaxHeight: 50,
        columnSpacing: 16,
        columns: [
          DataColumn(
            label: Expanded(
              child: Center(
                  child: Text('seq'.tr, style: style_text_Table_small_bold)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('container'.tr, style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('size'.tr, style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('number of times combine'.tr,
                    style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('container quality'.tr,
                    style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('status'.tr, style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('shipper'.tr, style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('result'.tr, style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child:
                    Text('upload image'.tr, style: style_text_Table_small_bold),
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
                  style: style_text_table_small_tracking,
                ),
              ),
            ),
            DataCell(Center(
              child: Text(
                snapshot.data![index].cntrno.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].sizeType.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Container(
                width: 200,
                child: Text(
                  snapshot.data![index].soLanKetHop.toString(),
                  style: style_text_table_small_tracking,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].quanlity.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].status.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].shipper.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Container(
                width: 150,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Tooltip(
                  message: snapshot.data![index].remark,
                  child: ElevatedButton(
                    onPressed: () {
                      String cntrno = snapshot.data![index].cntrno ?? '';
                      String sizeType = snapshot.data![index].sizeType ?? '';
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
                      String updateTime =
                          snapshot.data![index].updateTime ?? '';
                      checkContainerController.updateCheckContainerController(
                          cntrno: cntrno.obs,
                          sizeType: sizeType.obs,
                          soLanKetHop: soLanKetHop.obs,
                          ghiChuTinhTrang: ghiChuTinhTrang.obs,
                          luuYSuDung: luuYSuDung.obs,
                          ketQua: ketQua.obs,
                          approval: approval.obs,
                          shipper: shipper.obs,
                          remark: remark.obs,
                          updateTime: updateTime.obs);
                      PopUpCheckContainer(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _color,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    child: Text(
                      snapshot.data![index].approval.toString(),
                      style: text_style_status,
                      textAlign: TextAlign.center,
                    ),
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
