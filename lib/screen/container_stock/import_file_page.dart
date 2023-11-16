import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/import_stock/model_import_stock.dart';

class ImportStockPage extends StatefulWidget {
  const ImportStockPage({super.key});

  @override
  State<ImportStockPage> createState() => _ImportStockPageState();
}

class _ImportStockPageState extends State<ImportStockPage> {
  ImportStock stockImport = ImportStock();
  FilePickerResult? resultPickedFileStock;
  PlatformFile? pickedFiles;
  String? filename;
  final TextEditingController _input_tudong = TextEditingController();
  final TextEditingController _input_dendong = TextEditingController();
  bool showloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: deviceWidth(context),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Import File Excel Container Stock',
                style: style_title_page,
              ),
            ),
            Divider(),
            Container(
              height: 350,
              width: 430,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 32, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Từ dòng',
                              style: style_text_detail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: _input_tudong,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đến dòng',
                              style: style_text_detail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: _input_dendong,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ImportFile(),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  pickedFiles == null
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            setState(() {
                              stockImport.UploadFileImport(_input_tudong.text,
                                  _input_dendong.text, pickedFiles!);
                              showloading = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: haian,
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              'Import Excel',
                              style: style_text_button_detail,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  showloading == true
                      ? const CircularProgressIndicator()
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future ImportExcelStock() async {
    try {
      resultPickedFileStock = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );
      if (resultPickedFileStock != null) {
        setState(() {
          // change FilePickerResult to List<PlatformFile> to PlatformFile
          pickedFiles = resultPickedFileStock!.files.first;
          filename = pickedFiles!.name;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  ImportFile() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            ImportExcelStock();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: haian, borderRadius: BorderRadius.circular(7)),
            child: Text(
              'Choose File',
              style: style_text_button_detail,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(filename ??= 'No file choose'),
      ],
    );
  }
}
