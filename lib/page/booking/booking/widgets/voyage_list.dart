import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

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
                  horizontalMargin: 10,
                  sortColumnIndex: 0,
                  dataRowMaxHeight: 70,
                  columnSpacing: 12,
                  columns: [
                    DataColumn(
                      label: Expanded(
                          child: Container(
                        width: 40,
                        child: Center(
                          child: SelectableText('Seq',
                              style: style_text_Table_small_bold),
                        ),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("VESSEL",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("VOY.NO",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("PORT OF LOADING",
                            style: style_text_Table_small_bold),
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                        child: SelectableText("PORT OF DISCHARGE",
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
                    String? nameVoyage = dataVoyage1?.vesselName;
                    String? dateVoyage = dataVoyage1?.etd;
                    String _dt = DateFormat("dd-MMM-yyyy\n    hh:mm")
                        .format(DateTime.parse(dateVoyage!));
                    String? idVoyage = dataVoyage1?.voyId;
                    String? pol_final = dataVoyage1?.pol;
                    String? pod_final = dataVoyage1?.pod;
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
                            pol_final.toString(),
                            style: style_text_Table_small,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            pod_final.toString(),
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
                              currentRouteController.route.value = booking;
                              //update countRow in informationContainer
                              createBookingController.countRowContainer.value =
                                  0;
                              //update RouteController
                              routeController.updateRouteController(
                                  voyDetail:
                                      data.listBookingVoys?[index].voyDetail,
                                  vessel:
                                      data.listBookingVoys?[index].vesselName,
                                  voy: data.listBookingVoys?[index].voyId,
                                  date: DateFormat("dd-MMM-yyyy").format(
                                      DateTime.parse(
                                          (data.listBookingVoys?[index])!
                                              .etd!)),
                                  pol_final: data.listBookingVoys?[index].pol,
                                  polId_final:
                                      data.listBookingVoys?[index].polId,
                                  pod_final: data.listBookingVoys?[index].pod,
                                  podId_final:
                                      data.listBookingVoys?[index].podId);

                              box.write(
                                  vessel_booking, routeController.vessel.value);
                              box.write(voy_booking, routeController.voy.value);
                              box.write(pol_final_booking,
                                  routeController.pol_final.value);
                              box.write(pod_final_booking,
                                  routeController.pod_final.value);
                              box.write(
                                  date_booking, routeController.date.value);

                              box.write(voyDetailId_booking,
                                  routeController.voyDetail.value);
                              box.write(polId_final_booking,
                                  routeController.polId_final.value);
                              box.write(podId_final_booking,
                                  routeController.podId_final.value);

                              //go to BookingRequestPage
                              // inforUserController.shipperName.value == ''
                              //     ? Get.toNamed(GetRoutes.NewSignIn)
                              //     : Get.toNamed(GetRoutes.BookingRequest);
                              switch (inforUserController.shipperName.value) {
                                case '':
                                  Get.toNamed(GetRoutes.NewSignIn);
                                  break;
                                default:
                                  {
                                    switch (inforUserController.isStaff.value) {
                                      case 0:
                                        Get.toNamed(GetRoutes.BookingRequest);
                                        break;
                                      default:
                                        break;
                                    }
                                  }
                              }
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
