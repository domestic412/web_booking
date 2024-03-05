import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  SelectableText(
                    'Booking Request',
                    style: style_title_page,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Schedule',
                          style: TextStyle(fontSize: 20, color: haian)),
                      Container(
                          height: 20,
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: VerticalDivider(
                            color: grey,
                            width: 1,
                          )),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          children: [
                            Text(
                              'Change Shedule',
                              style: TextStyle(color: haian),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: haian,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  RouteInformationWidget(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Person in charge',
                          style: TextStyle(fontSize: 20, color: haian)),
                    ],
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  ConsigneeWidget(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Term',
                          style: TextStyle(fontSize: 20, color: haian)),
                    ],
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  ServiceWidget(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Information Cargo',
                          style: TextStyle(fontSize: 20, color: haian)),
                    ],
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  CargoInformation(),
                  TableInformationContainer(),
                  const SizedBox(height: 30),
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
