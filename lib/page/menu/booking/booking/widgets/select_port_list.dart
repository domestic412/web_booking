import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_port.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
// import 'package:easy_localization/easy_localization.dart';

class PortList extends StatefulWidget {
  const PortList({super.key});

  @override
  State<PortList> createState() => _PortListState();
}

class _PortListState extends State<PortList> {
  Ports? selectPort1;
  Ports? selectPort2;

  @override
  Widget build(BuildContext context) {
    return buildPort();
  }

  FutureBuilder<List<Ports>> buildPort() {
    return FutureBuilder<List<Ports>>(
        future: Ports().fetchPorts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List listports = snapshot.data!;
            final List<DropdownMenuEntry<Ports>> portEntries =
                <DropdownMenuEntry<Ports>>[];
            for (final port in listports) {
              portEntries.add(
                DropdownMenuEntry<Ports>(
                  value: port,
                  label: port.portName,
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<Ports>(
                  menuHeight: 500,
                  controller: routeController.port_select1.value,
                  enableFilter: true,
                  enableSearch: true,
                  label: Text('departure'.tr),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? port) {
                    setState(() {
                      selectPort1 = port;
                      routeController.pOLLocId.value =
                          selectPort1?.portId ?? '';
                      routeController.pOLLoc.value =
                          selectPort1?.portName ?? '';
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.arrow_right_alt),
                const SizedBox(
                  width: 10,
                ),
                DropdownMenu<Ports>(
                  menuHeight: 500,
                  controller: routeController.port_select2.value,
                  enableFilter: true,
                  enableSearch: true,
                  label: Text('arrival'.tr),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? port) {
                    setState(() {
                      selectPort2 = port;
                      routeController.pODLocId.value =
                          selectPort2?.portId ?? '';
                      routeController.pODLoc.value =
                          selectPort2?.portName ?? '';
                    });
                  },
                )
              ],
            );
          }
          return Text('Error');
        });
  }
}
