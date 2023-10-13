
import 'package:flutter/material.dart';

import '../../../model/model_port.dart';

class ListPort extends StatefulWidget {
  const ListPort({super.key});

  @override
  State<ListPort> createState() => _ListPortState();
}

class _ListPortState extends State<ListPort> {

  TextEditingController port_select1 = TextEditingController();
  TextEditingController port_select2 = TextEditingController();
  Ports? selectPort1;
  Ports? selectPort2;
  String? idPort1;
  String? idPort2;

  @override
  Widget build(BuildContext context) {
    return buildPort();
  }

    FutureBuilder<List<Ports>> buildPort() {
    return FutureBuilder<List<Ports>> (
      future: Ports().fetchPorts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List listports = snapshot.data!;
          final List<DropdownMenuEntry<Ports>> portEntries = <DropdownMenuEntry<Ports>>[];
          for (final portId in listports) {
            portEntries.add(
              DropdownMenuEntry<Ports>(
                  value: portId, label: portId.portName, 
                  ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 275,
                child: DropdownMenu<Ports>(
                  menuHeight: 500,
                  controller: port_select1,
                  enableFilter: true,
                  label: const Text('Cảng đi '),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? id) {
                    setState(() {
                      selectPort1 = id;
                      idPort1 = selectPort1?.portId;
                    });
                  },
                  ),
              ),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_right_alt),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                width: 275,
                child: DropdownMenu<Ports>(
                  menuHeight: 500,
                  controller: port_select2,
                  enableFilter: true,
                  label: const Text('Cảng đến '),
                  dropdownMenuEntries: portEntries,
                  onSelected: (Ports? id) {
                    setState(() {
                      selectPort2 = id;
                      idPort2 = selectPort2?.portId;
                    });
                  },
                  ),
              )
            ],
          );
        } return Text('Error');    
      });
  }
}