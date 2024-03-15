import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';

class RouteInformationWidget extends StatefulWidget {
  @override
  State<RouteInformationWidget> createState() => _RouteInformationWidgetState();
}

class _RouteInformationWidgetState extends State<RouteInformationWidget> {
  Depots? selectDepots;

  @override
  Widget build(BuildContext context) {

    List<DropdownMenuEntry<Depots>> depotsEntries =
        <DropdownMenuEntry<Depots>>[];
    List depotsList = box.read(depotsList_booking).map((e) => Depots.fromJson(e))
                  .toList();
    for (final depots in depotsList) {
      depotsEntries.add(DropdownMenuEntry<Depots>(
          value: depots, label: depots.depotName));
    }

    return Obx(()=>
    Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      width: 100,
                      child: Text(
                        'Vessel',
                        style: style_text_Table_small,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        alignment: Alignment.center,
                        // width: 100,
                        child: Text(
                          routeController.vessel.value,
                          style: style_text_Table_small,
                        ))
                  ],
                ),
              ),
              Container(
                width: 300,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      width: 70,
                      child: Text(
                        'Voyage',
                        style: style_text_Table_small,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        alignment: Alignment.center,
                        width: 100,
                        child: Text(
                          routeController.voy.value,
                          style: style_text_Table_small,
                        ))
                  ],
                ),
              ),
              Container(
                width: 300,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      width: 55,
                      child: Text(
                        'Date',
                        style: style_text_Table_small,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        alignment: Alignment.center,
                        // width: 100,
                        child: Text(
                          routeController.date.value,
                          style: style_text_Table_small,
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // width: 300,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      width: 100,
                      child: Text(
                        'Port to loading',
                        style: style_text_Table_small,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        alignment: Alignment.center,
                        // width: 100,
                        child: Text(
                          routeController.pol_final.value,
                          style: style_text_Table_small,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.double_arrow_sharp),
              SizedBox(
                width: 30,
              ),
              Container(
                // width: 300,
                child: Row(
                  children: [
                    Text(
                      'Port to destination',
                      style: style_text_Table_small,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        alignment: Alignment.center,
                        // width: 100,
                        child: Text(
                          routeController.pod.value,
                          style: style_text_Table_small,
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 100,
                  child: Text('Lift On Depot')),
              DropdownMenu<Depots>(
                // width: 120,
                controller: routeController.depot_controller.value,
                // enableFilter: true,
                // enableSearch: true,
                label: Text('Depot'.tr),
                dropdownMenuEntries: depotsEntries,
                onSelected: (Depots? depots) {
                  setState(() {
                    selectDepots = depots;
                    routeController.depotId.value = selectDepots?.depotId ?? '';
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
