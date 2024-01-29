import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/page/booking/create_info_booking/widget/service.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import 'widget/add_information_cont.dart';
import 'widget/button_booking_request.dart';
import 'widget/cargo_information.dart';
import 'widget/consignee.dart';
import 'widget/route_information.dart';

class BookingRequestPage extends StatefulWidget {
  @override
  State<BookingRequestPage> createState() => _BookingRequestPageState();
}

class _BookingRequestPageState extends State<BookingRequestPage> {
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
                    'Booking Request',
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
                  RouteInformationWidget(),
                  const SizedBox(height: 20),
                  ConsigneeWidget(),
                  const SizedBox(height: 20),
                  ServiceWidget(),
                  const SizedBox(height: 50),
                  CargoInformation(),
                  TableInformationContainer(),
                  const SizedBox(height: 10),
                  ButtonBookingRequest(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
