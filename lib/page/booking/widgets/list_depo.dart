import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';

// ignore: must_be_immutable

TextEditingController soluongcntr = TextEditingController();

Future<void> ListDepo(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn Depot'),
          content: buildDepo(),
        );
      });
}

FutureBuilder<Voyage> buildDepo() {
  return FutureBuilder<Voyage>(
      future: fetchVoyage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                border: TableBorder.all(),
                sortColumnIndex: 0,
                dataRowMaxHeight: 70,
                columnSpacing: 30,
                columns: [
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText('Seq',
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("DEPOT NAME",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("SIZE / QUANTITY",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("QUANTITY",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Center(
                      child: SelectableText("BOOKING",
                          style: style_text_Table_small_bold),
                    )),
                  ),
                ],
                rows: List.generate(data.depots!.length, (index) {
                  var dataDepo = data.depots![index];
                  nameDepo = dataDepo.depotName;
                  idDepo = dataDepo.depotId;
                  soluongcontDepo = dataDepo.soluong;
                  return DataRow(cells: [
                    DataCell(Center(
                        child: Text(
                      (index + 1).toString(),
                      style: style_text_Table_small,
                    ))),
                    DataCell(
                      Center(
                        child: Text(
                          nameDepo.toString(),
                          style: style_text_Table_small,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          soluongcontDepo.toString(),
                          style: style_text_Table_small,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 60,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            // style: text_style4,
                            controller: soluongcntr,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // ListDepo(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: normalColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Send Request',
                              style: style_text_button_detail,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                })),
          );
        }
        return const Text('');
      });
}
