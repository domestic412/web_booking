import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/utils/app_route_config.dart';

class VoyageList extends StatefulWidget {
  const VoyageList({super.key});

  @override
  State<VoyageList> createState() => _VoyageListState();
}

class _VoyageListState extends State<VoyageList> {
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
            var data = snapshot.data!;
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
              margin: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
              child: DataTable(
                  border: TableBorder.all(),
                  sortColumnIndex: 0,
                  dataRowMaxHeight: 70,
                  columnSpacing: 16,
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
                        child: SelectableText("VESSEL'S NAME",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("VOY. NO",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("PORT TO LOADING",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText('DEPARTURE\n (ETD/ATD)',
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText('BOOKING REQUEST',
                            style: style_text_Table_small_bold),
                      )),
                    ),
                  ],
                  rows: List.generate(data.listBookingVoys!.length, (index) {
                    var dataVoyage1 = data.listBookingVoys?[index];
                    nameVoyage = dataVoyage1?.vesselName;
                    dateVoyage = dataVoyage1?.etd;
                    String _dt = DateFormat("dd-MMM-yyyy  hh:mm")
                        .format(DateTime.parse(dateVoyage!));
                    idVoyage = dataVoyage1?.voyId;
                    polVoyage = dataVoyage1?.pol;
                    return DataRow(cells: [
                      DataCell(Center(
                          child: Text(
                        (index + 1).toString(),
                        style: style_text_Table_small,
                      ))),
                      DataCell(
                        Center(
                          child: Text(
                            nameVoyage.toString(),
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            idVoyage.toString(),
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            polVoyage.toString(),
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            _dt,
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.go(AppRoutes.depoRoute);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: normalColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Booking',
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
}
