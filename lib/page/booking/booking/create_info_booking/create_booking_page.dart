import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/page/booking/booking/create_info_booking/widget/service.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import 'widget/add_information_cont.dart';
import 'widget/button_booking_request.dart';
import 'widget/cargo_information.dart';
import 'widget/consignee.dart';
import 'widget/route_information.dart';

class BookingRequestPage extends StatelessWidget {
  const BookingRequestPage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    if (routeController.vessel.value == '') {
      if (box.read(vessel_booking) != null) {
        routeController.updateRouteController(
            voyDetail: box.read(voyDetailId_booking),
            vessel: box.read(vessel_booking),
            voy: box.read(voy_booking),
            date: box.read(date_booking),
            pol_final: box.read(pol_final_booking),
            polId_final: box.read(polId_final_booking),
            pod_final: box.read(pod_final_booking),
            podId_final: box.read(podId_final_booking));
      }
    }
    return buildBookingRequest();
  }

  FutureBuilder<List<GetRef>> buildBookingRequest() {
    return FutureBuilder<List<GetRef>>(
        future: GetRef().fetchGetRef(
          shipperId: box.read(shipperId_signin),
          // polLocId: routeController.pOLLocId.value,
          polLocId: box.read(polLocId_booking),
          // podLocId: routeController.pODLocId.value,
          podLocId: box.read(podLocId_booking),
          // date: routeController.dateSelect.value,
          date: box.read(date_booking),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // print(snapshot.data);
            box.write(ref_booking, snapshot.data);
            // print(box.read(ref_booking)[0].refNo);
            // print(box.read(ref_booking));
            return bodyBookingRequest();
          }
          return Text('');
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return bodyBookingRequest();
  // }

  Scaffold bodyBookingRequest() {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
              decoration: BoxDecoration(
                  color: backgroundColor
                  // contentColor
                  ,
                  borderRadius: BorderRadius.circular(10)),
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
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: contentColor,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: blue.withOpacity(.4),
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Schedule',
                                style: TextStyle(fontSize: 20, color: haian)),
                            Container(
                                height: 20,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: VerticalDivider(
                                  color: grey,
                                  width: 1,
                                )),
                            InkWell(
                              onTap: () {
                                Get.toNamed(GetRoutes.Booking);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Change Shedule',
                                    style: TextStyle(color: haian),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: contentColor,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: blue.withOpacity(.4),
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: contentColor,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: blue.withOpacity(.4),
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: contentColor,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: blue.withOpacity(.4),
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
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
