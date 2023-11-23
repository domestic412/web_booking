import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/page/booking/select_depo/select_list_depo.dart';
import 'package:web_booking/page/booking/widgets/list_depo.dart';
import 'package:web_booking/page/booking/widgets/select_%20list_port.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class DepoPage extends StatefulWidget {
  @override
  State<DepoPage> createState() => _DepoPageState();
}

class _DepoPageState extends State<DepoPage> {
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
                    'Depot',
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
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectDepoSize(),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: deviceWidth(context),
                    alignment: Alignment.center,
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
                          //     fetchVoyage = Voyage().fetchDataVoyage(
                          //         idPort1.toString(),
                          //         idPort2.toString(),
                          //         dateSelect!);
                          //   });
                          // }
                        },
                        child: Text(
                          'Send Request',
                          style: style_text_button_detail,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowListDepo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
