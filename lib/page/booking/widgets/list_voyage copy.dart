import 'package:flutter/material.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';
import 'package:intl/intl.dart';

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
                      height: 700,
                      width: 900,
                      padding: const EdgeInsets.only(bottom: 30),
                      // width: 1024,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(7)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            DataTable(
                                columns: [
                                  DataColumn(
                                    label: Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText('Seq',
                                            style: style15_black_bold),
                                      ],
                                    )),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText("VESSEL'S NAME",
                                            style: style15_black_bold),
                                      ],
                                    )),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText("VOY",
                                            style: style15_black_bold),
                                      ],
                                    )),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText("PORT",
                                            style: style15_black_bold),
                                      ],
                                    )),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                        child: Center(
                                          child: SelectableText('DEPARTURE\n(ETD)',
                                              style: style15_black_bold),
                                        )),
                                  ),
                                ],
                                rows:
                                    List.generate(dataVoyage1!.length, (index) {
                                      var dataVoyage1 = snapshot.data!.listBookingVoys?[index];
                                      nameVoyage = dataVoyage1?.vesselName;
                                      dateVoyage = dataVoyage1?.etd;
                                      String dt = DateFormat("yyyy-MM-dd  hh:mm").format(
                                        DateTime.parse(dateVoyage!));
                                      idVoyage = dataVoyage1?.voyId;
                                      polVoyage = dataVoyage1?.pol;
                                      
                                      return DataRow(cells: [
                                        DataCell(Container(
                                          width: 30,
                                          child: Center(
                                              child: SelectableText(
                                            (index + 1).toString(),
                                            style: style13_black,
                                          )),
                                        )),
                                        DataCell(
                                          Container(
                                            // width: 500,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              nameVoyage.toString(),
                                              style: text_style2,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            // width: 500,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              idVoyage.toString(),
                                              style: text_style2,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            // width: 500,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              polVoyage.toString(),
                                              style: text_style2,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            // width: 500,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              dt,
                                              style: text_style2,
                                            ),
                                          ),
                                        ),
                                      ]);
                                }))
                          ]),
                    );
          }
          return const Text('');
        });
  }
}
