import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_port.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class ScheduleSearch extends StatefulWidget {
  // const ScheduleSearch({super.key});

  @override
  State<ScheduleSearch> createState() => _ScheduleSearchState();
}

class _ScheduleSearchState extends State<ScheduleSearch> {
  Ports? selectPort1;
  Ports? selectPort2;

  void initState() {
    super.initState();
    routeController.dateSelect.value =
        DateFormat('MM/dd/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white54,
          boxShadow: const [
            BoxShadow(
                color: Colors.white30,
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 7,
            decoration: BoxDecoration(
                color: haian,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          const SizedBox(height: 20),
          Text(
            'schedule'.tr,
            style: TextStyle(fontSize: 25, color: haian),
          ),
          const SizedBox(
            height: 10,
          ),
          buildPort_schedule_mainSearch(),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              // splashColor: green,
              highlightColor: blue,
              onTap: () {
                setState(() {
                  fetchVoyage = Voyage().fetchDataVoyage(
                      routeController.pOLLocId.value,
                      routeController.pODLocId.value,
                      routeController.dateSelect.value);
                  box.write(polLocId_booking, routeController.pOLLocId.value);
                  box.write(podLocId_booking, routeController.pODLocId.value);
                });
                // context.go(AppRoutes.bookingRoute);
                Get.toNamed(GetRoutes.Booking);
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: haian),
                child: Text(
                  'inquiry'.tr,
                  style: TextStyle(fontSize: 20, color: white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder<List<Ports>> buildPort_schedule_mainSearch() {
    return FutureBuilder<List<Ports>>(
        future: Ports().fetchPorts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List listports = snapshot.data!;
            List<DropdownMenuEntry<Ports>> _portEntries =
                <DropdownMenuEntry<Ports>>[];
            for (final portId in listports) {
              _portEntries.add(
                DropdownMenuEntry<Ports>(
                  value: portId,
                  label: portId.portName,
                ),
              );
            }
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: deviceWidth(context),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownMenu<Ports>(
                    inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60)),
                        border: OutlineInputBorder()),
                    menuHeight: 500,
                    width: 360,
                    controller: routeController.port_select1.value,
                    enableFilter: true,
                    label: Text(
                      'departure'.tr,
                      style: TextStyle(fontSize: 16),
                    ),
                    dropdownMenuEntries: _portEntries,
                    onSelected: (Ports? id) {
                      setState(() {
                        selectPort1 = id;
                        routeController.pOLLocId.value =
                            selectPort1?.portId ?? '';
                        routeController.pOLLoc.value =
                            selectPort1?.portName ?? '';
                      });
                    },
                  ),
                ),
                Container(
                  width: deviceWidth(context),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownMenu<Ports>(
                    inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60)),
                        border: OutlineInputBorder()),
                    width: 360,
                    menuHeight: 500,
                    controller: routeController.port_select2.value,
                    enableFilter: true,
                    label: Text(
                      'arrival'.tr,
                      style: TextStyle(fontSize: 16),
                    ),
                    dropdownMenuEntries: _portEntries,
                    onSelected: (Ports? id) {
                      setState(() {
                        selectPort2 = id;
                        routeController.pODLocId.value =
                            selectPort2?.portId ?? '';
                        routeController.pODLoc.value =
                            selectPort2?.portName ?? '';
                      });
                    },
                  ),
                ),
              ],
            );
          }
          return Text('Error');
        });
  }
}
