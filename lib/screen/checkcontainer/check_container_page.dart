import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/CheckContainer/model_check_container.dart';
import 'package:web_booking/screen/checkcontainer/Popup/detail_check_container.dart';
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
bool boolVisible = false;

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
              padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
              child: Text(
                "Nhập số Container",
                style: TextStyle(fontSize: 30, color: haian),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: blue.withOpacity(.4), width: .5),
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
              child: ListTile(
                title: TextField(
                    inputFormatters: [InputContainerFormatter()],
                    onSubmitted: (value) {
                      setState(() {
                        checkContainers =
                            ContainerResponse.fetchContainerResponses(
                                CntrNo.text.trim());
                        boolVisible = false;
                      });
                    },
                    controller: CntrNo,
                    textCapitalization: TextCapitalization.characters,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    decoration: InputDecoration(
                      hintText: 'Nhập số Container',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                checkContainers =
                                    ContainerResponse.fetchContainerResponses(
                                        CntrNo.text.trim());
                                boolVisible = false;
                              },
                            );
                          },
                          icon: const Icon(Icons.search)),
                    )),
              ),
            ),
            Container(child: buildFutureBuilder()),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ContainerResponse>> buildFutureBuilder() {
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
          if (snapshot.data!.length < countCont.length) {
            boolVisible = true;
          }
          // print('show data check container');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: boolVisible,
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, bottom: 16),
                      width: deviceWidth(context),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Không tìm thấy thông tin hoặc chưa nhập điều kiện kiểm tra',
                        style: TextStyle(fontSize: 15, color: red),
                      ))),
              Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
                child: Text(
                  'Kết quả kết hợp trả về',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: deviceWidth(context),
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: blue.withOpacity(.4), width: .5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: blue.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
                child: DataTable(
                    border: const TableBorder(
                        verticalInside: BorderSide(color: Colors.black26)),
                    sortColumnIndex: 0,
                    dataRowMaxHeight: 70,
                    columnSpacing: 16,
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('STT', style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Số Container',
                                  style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Kích cỡ', style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Số lần kết hợp',
                                  style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Chất lượng container',
                                  style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Trạng thái', style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Shipper', style: text_Table_small_bold),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Kết quả', style: text_Table_small_bold),
                            ],
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
                          Expanded(
                              child: Text(
                            (index + 1).toString(),
                            style: text_Table_small,
                          )),
                        ),
                        DataCell(Container(
                            // width: deviceWidth(context)*0.15,
                            child: Center(
                          child: Text(
                            snapshot.data![index].cntrno.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                            child: Center(
                          child: Text(
                            snapshot.data![index].sizeType.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                            child: Center(
                          child: Text(
                            snapshot.data![index].soLanKetHop.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                            child: Center(
                          child: Text(
                            snapshot.data![index].quanlity.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                            child: Center(
                          child: Text(
                            snapshot.data![index].status.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                            child: Center(
                          child: Text(
                            snapshot.data![index].shipper.toString(),
                            style: text_Table_small,
                            textAlign: TextAlign.center,
                          ),
                        ))),
                        DataCell(Container(
                          child: Center(
                            child: Container(
                              width: 150,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: _color,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                child: InkWell(
                                  onTap: () {
                                    cntrno_CheckCntr =
                                        snapshot.data![index].cntrno;
                                    sizeType_CheckCntr =
                                        snapshot.data![index].sizeType;
                                    shipper_CheckCntr =
                                        snapshot.data![index].shipper;
                                    remark_CheckCntr =
                                        snapshot.data![index].remark;
                                    ghiChuTinhTrang_CheckCntr =
                                        snapshot.data![index].ghiChuTinhTrang;
                                    luuYSuDung_CheckCntr =
                                        snapshot.data![index].luuYSuDung;
                                    // soLanKetHop_CheckCntr = snapshot.data!.soLanKetHop?? '';
                                    soLanKetHop_CheckCntr =
                                        snapshot.data![index].soLanKetHop;
                                    ketQua_CheckCntr =
                                        snapshot.data![index].ketQua;
                                    updateTime_CheckCntr =
                                        snapshot.data![index].updateTime;
                                    approval_CheckCntr =
                                        snapshot.data![index].approval;
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
                          ),
                        ))
                      ]);
                    })),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          // print('Check reload !!!');
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(
              'Vui lòng nhập số Container',
              style: TextStyle(fontSize: 16, color: red),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
