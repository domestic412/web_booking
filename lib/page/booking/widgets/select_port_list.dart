import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_port.dart';
import 'package:easy_localization/easy_localization.dart';

class PortList extends StatefulWidget {
  const PortList({super.key});

  @override
  State<PortList> createState() => _PortListState();
}

class _PortListState extends State<PortList> {
  // TextEditingController port_select1 = TextEditingController();
  // TextEditingController port_select2 = TextEditingController();
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
                  controller: port_select1,
                  enableFilter: true,
                  enableSearch: true,
                  label: Text('departure'.tr()),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? port) {
                    setState(() {
                      selectPort1 = port;
                      idPort1 = selectPort1?.portId;
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
                  controller: port_select2,
                  enableFilter: true,
                  enableSearch: true,
                  label: Text('arrival'.tr()),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? port) {
                    setState(() {
                      selectPort2 = port;
                      idPort2 = selectPort2?.portId;
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
