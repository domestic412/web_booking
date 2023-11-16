import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/page/booking/widgets/list_port.dart';
import 'package:web_booking/page/booking/widgets/list_voyage.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class BookingPage extends StatefulWidget {
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    super.initState();
    date_select.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    dateSelect = DateFormat('MM/dd/yyyy').format(DateTime.now());
  }

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
                    'Booking',
                    style: style_title_page,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                                  date_select.text = DateFormat('dd/MM/yyyy')
                                      .format(pickeddate);
                                  dateSelect = DateFormat('MM/dd/yyyy')
                                      .format(pickeddate);
                                  // print(dateSelect);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 830,
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
                        child: Text(
                          'Tìm chuyến tàu',
                          style: style_text_button_detail,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListVoyage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
