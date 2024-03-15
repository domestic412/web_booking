import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/storage_controller/port_date_controller.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/page/booking/widgets/select_port_list.dart';
import 'package:web_booking/page/booking/widgets/voyage_list.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class BookingPage extends StatefulWidget {
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    super.initState();
    routeController.date_select.value.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    routeController.dateSelect.value =
        DateFormat('MM/dd/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appbar(),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                decoration: BoxDecoration(
                    color: contentColor,
                    borderRadius: BorderRadius.circular(10)),
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
                          PortList(),
                          const SizedBox(width: 20),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextField(
                              controller: routeController.date_select.value,
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
                                    routeController.date_select.value.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickeddate);
                                    routeController.dateSelect.value =
                                        DateFormat('MM/dd/yyyy')
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
                      width: 930,
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF09227e),
                              minimumSize: const Size(180, 45),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                          onPressed: () {
                            // if (idPort1 == idPort2) {
                            //   // alertSelectPort.showAlertSamePort(context);
                            // } else if (idPort1 == null || idPort2 == null) {
                            //   // alertSelectPort.showAlertPort(context);
                            // } else {
                            //   setState(() {
                            //     routeController.polID.value =
                            //         idPort1.toString();
                            //     routeController.podID.value =
                            //         idPort2.toString();
                            //     fetchVoyage = Voyage().fetchDataVoyage(
                            //         idPort1.toString(),
                            //         idPort2.toString(),
                            //         initialPortController.dateSelect.value);
                            //   });
                            // }
                            if (routeController.polID.value ==
                                routeController.podID.value) {
                              // alertSelectPort.showAlertSamePort(context);
                            } else if (routeController.polID.value == '' ||
                                routeController.podID.value == '') {
                              // alertSelectPort.showAlertPort(context);
                            } else {
                              setState(() {
                                fetchVoyage = Voyage().fetchDataVoyage(
                                    routeController.polID.value,
                                    routeController.podID.value,
                                    routeController.dateSelect.value);

                                print(routeController.polID.value);
                                print(routeController.podID.value);
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
                    VoyageList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
