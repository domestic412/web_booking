import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';

import 'widget/port_quote.dart';

// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class AEQuotePage extends StatefulWidget {
  @override
  State<AEQuotePage> createState() => _AEQuotePageState();
}

class _AEQuotePageState extends State<AEQuotePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // use sizedbox to content always start on top
      height: deviceHeight(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.selectWidget.value = quoteList;
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(grey),
                        minimumSize: MaterialStateProperty.all(Size(100, 40))),
                    child: Text('Back'),
                  ),
                  Center(
                    child: Text(
                      "title input quote".tr,
                      style: style_title_page,
                    ),
                  ),
                ]),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.all(17),
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
                    child: PortQuote()),
                Container(
                  padding: EdgeInsets.all(10),
                  color: red,
                )
              ]),
        ),
      ),
    );
  }
}
