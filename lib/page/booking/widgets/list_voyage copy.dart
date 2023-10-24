import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/page/booking/widgets/list_depo.dart';

class ListVoyage1 extends StatefulWidget {
  const ListVoyage1({super.key});

  @override
  State<ListVoyage1> createState() => _ListVoyage1State();
}

class _ListVoyage1State extends State<ListVoyage1> {
  @override
  Widget build(BuildContext context) {
    return buildVoyage();
  }

  FutureBuilder<Voyage> buildVoyage() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            var dataVoyage1 = snapshot.data!.listBookingVoys;
            return Container(
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
              // height: 700,
              // width: 900,
              // padding: const EdgeInsets.only(bottom: 30),
              // width: 1024,
              margin: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
              child: DataTable(
                  border: TableBorder.all(),
                  sortColumnIndex: 0,
                  dataRowMaxHeight: 70,
                  columnSpacing: 16,
                  columns: [
                    DataColumn(
                      label: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText('Seq', style: style15_black_bold),
                        ],
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText("VESSEL'S NAME",
                              style: style15_black_bold),
                        ],
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText("VOY. NO", style: style15_black_bold),
                        ],
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText("PORT", style: style15_black_bold),
                        ],
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText('DEPARTURE\n (ETD/ATD)',
                            style: style15_black_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText('BOOKING REQUEST',
                            style: style15_black_bold),
                      )),
                    ),
                  ],
                  rows: List.generate(dataVoyage1!.length, (index) {
                    var dataVoyage1 = snapshot.data!.listBookingVoys?[index];
                    nameVoyage = dataVoyage1?.vesselName;
                    dateVoyage = dataVoyage1?.etd;
                    String _dt = DateFormat("dd-MMM-yyyy  hh:mm")
                        .format(DateTime.parse(dateVoyage!));
                    idVoyage = dataVoyage1?.voyId;
                    polVoyage = dataVoyage1?.pol;

                    return DataRow(cells: [
                      DataCell(Container(
                        width: 30,
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: style13_black,
                        )),
                      )),
                      DataCell(
                        Container(
                          // width: 500,
                          alignment: Alignment.bottomLeft,
                          child: Center(
                            child: Text(
                              nameVoyage.toString(),
                              style: text_style2,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          // width: 500,
                          alignment: Alignment.bottomLeft,
                          child: Center(
                            child: Text(
                              idVoyage.toString(),
                              style: text_style2,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          // width: 500,
                          alignment: Alignment.bottomLeft,
                          child: Center(
                            child: Text(
                              polVoyage.toString(),
                              style: text_style2,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          // width: 500,
                          alignment: Alignment.bottomLeft,
                          child: Center(
                            child: Text(
                              _dt,
                              style: text_style2,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          // width: 500,
                          child: Center(
                            child: Container(
                              width: 110,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  ListDepo(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: green,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                child: Text(
                                  'Booking'.toString(),
                                  style: text_style_status,
                                  textAlign: TextAlign.center,
                                ),
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
}
