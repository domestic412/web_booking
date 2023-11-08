// import 'package:excel/excel.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/check_container/model_check_container.dart';
import 'package:web_booking/screen/checkcontainer/Popup/detail_check_container.dart';
import 'package:web_booking/screen/checkcontainer/import_excel/import_excel.dart';
import 'package:web_booking/screen/widgets/format_input_container.dart';

class CheckContainerPage extends StatefulWidget {
  const CheckContainerPage({super.key});

  @override
  State<CheckContainerPage> createState() => _CheckContainerPageState();
}

final CntrNo = TextEditingController();
List countCont = [];
Future<List<ContainerResponse>>? checkContainers;
Color? _color;

String list_input = '';
int i = 0;

class _CheckContainerPageState extends State<CheckContainerPage> {
  @override
  void initState() {
    super.initState();
    CntrNo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: deviceWidth(context),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                "Check Container",
                style: style_title_page,
              ),
            ),
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
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(color: Colors.black45)            // error excel
                ),
                child: ListTile(
                  leading: Icon(Icons.calendar_view_week_rounded),
                  title: TextField(
                      inputFormatters: [InputContainerFormatter()],
                      onSubmitted: (value) {
                        setState(() {
                          checkContainers =
                              ContainerResponse.fetchContainerResponses(
                                  CntrNo.text.trim());
                        });
                      },
                      controller: CntrNo,
                      textCapitalization: TextCapitalization.characters,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Nhập số Container',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  checkContainers =
                                      ContainerResponse.fetchContainerResponses(
                                          CntrNo.text.trim());
                                },
                              );
                            },
                            icon: const Icon(Icons.search)),
                      )),
                ),
              ),
            ),
            Container(
              // alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(10),
              color: haian,
              child: TextButton(
                  onPressed: () async {
                    await Import().ImportExcel();
                    if (pickedFile != null) {
                      var bytes = pickedFile?.files.single.bytes;
                      var excel = Excel.decodeBytes(bytes!);
                      // choose sheet1 in file excel
                      String table = 'Sheet1';
                      // for (var table in excel.tables.keys) {         // take data all sheet in file excel
                      print(table); //sheet Name
                      // print max number column
                      print(excel.tables[table]!.maxColumns);
                      print(
                          // print max number row
                          excel.tables[table]!.maxRows);
                      // take all data, style, cell... each row
                      for (var row in excel.tables[table]!.rows) {
                        List list_cont = row.map((e) => e?.value).toList();
                        print(list_cont[0]);
                        if (i > 4) {
                          list_input =
                              list_input + list_cont[0].toString() + ' - ';
                        }
                        i++;
                      }
                      print(list_input);
                      setState(() {
                        CntrNo.text = list_input;
                        list_input = '';
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
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   padding: EdgeInsets.all(10),
            //   color: haian,
            //   child: TextButton(
            //       onPressed: () {
            //         if (pickedFile != null) {
            //           var bytes = pickedFile?.files.single.bytes;
            //           var excel = Excel.decodeBytes(bytes!);
            //           // choose sheet1 in file excel
            //           String table = 'Sheet1';
            //           // for (var table in excel.tables.keys) {         // take data all sheet in file excel
            //           print(table); //sheet Name
            //           // print max number column
            //           print(excel.tables[table]!.maxColumns);
            //           print(
            //               // print max number row
            //               excel.tables[table]!.maxRows);
            //           // take all data, style, cell... each row
            //           for (var row in excel.tables[table]!.rows) {
            //             List list_cont = row.map((e) => e?.value).toList();
            //             print(list_cont[0]);
            //             list_input =
            //                 list_input + list_cont[0].toString() + ' - ';
            //           }
            //           print(list_input);
            //           setState(() {
            //             CntrNo.text = list_input;
            //             list_input = '';
            //           });
            //           // }
            //         } else {
            //           print('no data');
            //         }
            //       },
            //       child: Text(
            //         'print data file excel',
            //         style: TextStyle(color: white, fontSize: 15),
            //       )),
            // ),
            Container(child: fetchDataListContainer()),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ContainerResponse>> fetchDataListContainer() {
    return FutureBuilder<List<ContainerResponse>>(
      future: checkContainers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          countCont = CntrNo.text
              .trim()
              .split('-'); // list space to count the number of containers
          // print('show data check container');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              snapshot.data!.length < countCont.length
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, bottom: 16),
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      child: Text(
                        'Kiểm tra lại số Container do có số Container không tìm thấy',
                        style: TextStyle(fontSize: 16, color: red),
                      ))
                  : Container(),
              Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
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
                margin: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
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
      AsyncSnapshot<List<ContainerResponse>> snapshot, BuildContext context) {
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: InkWell(
                    onTap: () {
                      cntrno_CheckCntr = snapshot.data![index].cntrno;
                      sizeType_CheckCntr = snapshot.data![index].sizeType;
                      shipper_CheckCntr = snapshot.data![index].shipper;
                      remark_CheckCntr = snapshot.data![index].remark;
                      ghiChuTinhTrang_CheckCntr =
                          snapshot.data![index].ghiChuTinhTrang;
                      luuYSuDung_CheckCntr = snapshot.data![index].luuYSuDung;
                      // soLanKetHop_CheckCntr = snapshot.data!.soLanKetHop?? '';
                      soLanKetHop_CheckCntr = snapshot.data![index].soLanKetHop;
                      ketQua_CheckCntr = snapshot.data![index].ketQua;
                      updateTime_CheckCntr = snapshot.data![index].updateTime;
                      approval_CheckCntr = snapshot.data![index].approval;
                      PopUpCheckContainer(context);
                    },
                    child: Text(
                      snapshot.data![index].approval.toString(),
                      style: text_style_status,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ))
          ]);
        }));
  }
}
