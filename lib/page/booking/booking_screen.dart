import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';
import 'package:web_booking/page/booking/widgets/list_port.dart';
import 'package:web_booking/page/booking/widgets/list_voyage%20copy.dart';
import 'package:web_booking/page/booking/widgets/list_voyage.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class BookingPage extends StatefulWidget {
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController date_select = TextEditingController();
  TextEditingController port_select1 = TextEditingController();
  TextEditingController port_select2 = TextEditingController();

  String? dateSelect;
  // AlertSelectPort alertSelectPort = AlertSelectPort();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
              decoration: BoxDecoration(
                  color: contentColor, borderRadius: BorderRadius.circular(10)),
              width: 1004,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                children: [
                  SelectableText(
                    'Schedule',
                    style: style20_blue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ListPort(),
                      const SizedBox(width: 20),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: TextField(
                          controller: date_select,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              'Chọn ngày đi',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: Icon(Icons.calendar_month),
                          ),
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2123));
                            if (pickeddate != null) {
                              setState(() {
                                date_select.text =
                                    DateFormat('dd/MM/yyyy').format(pickeddate);
                                dateSelect =
                                    DateFormat('MM/dd/yyyy').format(pickeddate);
                                print(dateSelect);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 840,
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF09227e),
                            minimumSize: const Size(180, 45),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          if (idPort1 == idPort2) {
                            // alertSelectPort.showAlertSamePort(context);
                          } else if (idPort1 == null || idPort2 == null) {
                            // alertSelectPort.showAlertPort(context);
                          } else {
                            setState(() {
                              fetchVoyage = Voyage().fetchDataVoyage(
                                  idPort1.toString(),
                                  idPort2.toString(),
                                  dateSelect!);
                            });
                          }
                        },
                        child: const Text(
                          'Tìm chuyến tàu',
                          // style: text_style3
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListVoyage1(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
