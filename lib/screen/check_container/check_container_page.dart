import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/screen/check_container/Widget/policy_check_container.dart';
import 'package:web_booking/screen/check_container/import_excel/import_excel.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/widgets/format_input_container.dart';

class CheckContainerPage extends StatefulWidget {
  const CheckContainerPage({super.key});

  @override
  State<CheckContainerPage> createState() => _CheckContainerPageState();
}

class _CheckContainerPageState extends State<CheckContainerPage> {
  final _CntrNo = TextEditingController();
  List _countCont = [];
  Future<List<CheckContainer>>? _checkContainers;
  Color? _color;

  String _list_input = '';
  int i = 0;

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
                  "Check Container",
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
                                .fetchCheckContainers(_CntrNo.text.trim());
                          });
                        },
                        controller: _CntrNo,
                        textCapitalization: TextCapitalization.characters,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Nhập số Container',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _checkContainers = CheckContainer()
                                        .fetchCheckContainers(
                                            _CntrNo.text.trim());
                                  },
                                );
                              },
                              icon: const Icon(Icons.search)),
                        )),
                  ),
                ),
              ),
              // ImportFile(),
              Container(
                // alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: haian, borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () async {
                      await Import().ImportExcel();
                      if (resultPickedFile != null) {
                        var bytes = resultPickedFile?.files.single.bytes;
                        var excel = Excel.decodeBytes(bytes!);
                        // choose sheet1 in file excel
                        String table = 'Sheet1';
                        // for (var table in excel.tables.keys) {         // take data all sheet in file excel
                        // print(table);                                  // sheet Name
                        // print(excel.tables[table]!.maxColumns);        // max number column
                        // print(excel.tables[table]!.maxRows);               // print max number row
                        // take all data, style, cell... each row
                        for (var row in excel.tables[table]!.rows) {
                          List list_cont = row
                              .map((e) => e?.value)
                              .toList(); //add data to list_cont with container is list_cont[0]
                          // print(list_cont[0]);
                          if (i < excel.tables[table]!.maxRows) {
                            if (i == (excel.tables[table]!.maxRows - 1)) {
                              //take last cont number
                              _list_input =
                                  _list_input + list_cont[0].toString();
                            } else if (i > 0) {
                              //take cont number from 2
                              _list_input =
                                  _list_input + list_cont[0].toString() + ' ';
                            }
                            i++;
                          }
                        }
                        // print(_list_input);
                        setState(() {
                          _CntrNo.text = _list_input;
                          _list_input = '';
                          i = 0;
                        });
                        // }
                      } else {
                        print('no data');
                      }
                    },
                    child: Text(
                      'Import file excel',
                      style: TextStyle(color: white, fontSize: 15),
                    )),
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
                        'Kiểm tra lại số Container do có số Container không tìm thấy',
                        style: TextStyle(fontSize: 16, color: red),
                      ))
                  : Container(),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  'Kết quả kết hợp trả về',
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
        } else if (snapshot.hasError) {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(
              'Vui lòng nhập số Container',
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
        border: const TableBorder(
            verticalInside: BorderSide(color: Colors.black12)),
        sortColumnIndex: 0,
        dataRowMaxHeight: 50,
        columnSpacing: 16,
        columns: [
          DataColumn(
            label: Expanded(
              child: Center(
                  child: Text('STT', style: style_text_Table_small_bold)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Số Container', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Kích cỡ', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child:
                    Text('Số lần kết hợp', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Số lần', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Số lần CP', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Chất lượng container',
                    style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Trạng thái', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Shipper', style: style_text_Table_small_bold),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text('Kết quả', style: style_text_Table_small_bold),
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
              child: Text(
                snapshot.data![index].soLanKetHop.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                snapshot.data![index].soLanKetHopNum.toString(),
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Center(
              child: Text(
                '0',
                style: style_text_table_small_tracking,
                textAlign: TextAlign.center,
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
                child: ElevatedButton(
                  onPressed: () {
                    if (snapshot.data![index].approval == Reject) {
                      savecntr = snapshot.data![index].cntrno!;
                      sideBarController.index.value = 3;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: Text(
                    snapshot.data![index].approval.toString(),
                    style: text_style_status,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ]);
        }));
  }
}
