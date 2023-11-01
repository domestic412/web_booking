import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_port.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/utils/app_route_config.dart';

class ScheduleSearch extends StatefulWidget {
  const ScheduleSearch({super.key});

  @override
  State<ScheduleSearch> createState() => _ScheduleSearchState();
}

class _ScheduleSearchState extends State<ScheduleSearch> {
  // String? dateSelect;

  // List<DropdownMenuEntry<Ports>> _portEntries = <DropdownMenuEntry<Ports>>[];
  // TextEditingController _port_select1 = TextEditingController();
  // TextEditingController _port_select2 = TextEditingController();

  void initState() {
    super.initState();
    dateSelect = DateFormat('MM/dd/yyyy').format(DateTime.now());
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
            'schedule'.tr(),
            style: TextStyle(fontSize: 25, color: haian),
          ),
          const SizedBox(
            height: 10,
          ),
          buildPort_schedule_mainSearch(),
          // Container(
          //   margin: const EdgeInsets.only(left: 20, right: 20),
          //   padding: const EdgeInsets.only(left: 15),
          //   decoration: BoxDecoration(
          //     color: Colors.white60,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: TextField(
          //     controller: port_select1,
          //     decoration: InputDecoration(
          //         icon: const Icon(
          //           Icons.location_on,
          //           size: 30,
          //         ),
          //         hintText: 'departure'.tr(),
          //         border: InputBorder.none),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   margin: const EdgeInsets.only(left: 20, right: 20),
          //   padding: const EdgeInsets.only(left: 15),
          //   decoration: BoxDecoration(
          //     color: Colors.white60,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: TextField(
          //     controller: port_select2,
          //     decoration: InputDecoration(
          //         icon: const Icon(
          //           Icons.location_on,
          //           size: 30,
          //         ),
          //         hintText: 'arrival'.tr(),
          //         border: InputBorder.none),
          //   ),
          // ),
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
                      idPort1.toString(), idPort2.toString(), dateSelect!);
                });
                context.go(AppRoutes.BookingRoute);
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: haian),
                child: Text(
                  'inquiry'.tr(),
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
            List _listports = snapshot.data!;
            List<DropdownMenuEntry<Ports>> _portEntries =
                <DropdownMenuEntry<Ports>>[];
            for (final portId in _listports) {
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
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownMenu<Ports>(
                    menuHeight: 500,
                    controller: port_select1,
                    enableFilter: true,
                    label: Text('departure'.tr()),
                    dropdownMenuEntries: _portEntries,
                    onSelected: (Ports? id) {
                      setState(() {
                        selectPort1 = id;
                        idPort1 = selectPort1?.portId;
                      });
                    },
                  ),
                ),
                Container(
                  width: deviceWidth(context),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownMenu<Ports>(
                    // width: deviceWidth(context),
                    menuHeight: 500,
                    controller: port_select2,
                    enableFilter: true,
                    label: Text('arrival'.tr()),
                    dropdownMenuEntries: _portEntries,
                    onSelected: (Ports? id) {
                      setState(() {
                        selectPort2 = id;
                        idPort2 = selectPort2?.portId;
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
