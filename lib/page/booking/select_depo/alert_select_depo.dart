import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';

Future<void> DialogDepo(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Depot",
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectDepo(),
              SizedBox(width: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: haian),
                    child: Container(
                      // alignment: Alignment.center,
                      // margin: EdgeInsets.only(right: 30),
                      // height: 40,
                      width: 100,
                      child: Text(
                        'Send Request',
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: grey),
                    child: Container(
                      // alignment: Alignment.center,
                      // height: 40,
                      width: 100,
                      child: Text(
                        'Cancle',
                        style: TextStyle(color: white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      });
}

FutureBuilder<Voyage> SelectDepo() {
  return FutureBuilder<Voyage>(
      future: fetchVoyage,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          List<Depots>? listdepo = snapshot.data!.depots;
          listPickDepo = <Depots>[];
          for (final depo in listdepo!) {
            if ((depo.size ==
                    createBookingController.realSizeContainer.value) &&
                (depo.soluong! >=
                    int.parse(
                        createBookingController.inputVolume.value.text))) {
              listPickDepo.add(Depots(
                  depotId: depo.depotId,
                  depotName: depo.depotName,
                  soluong: depo.soluong,
                  size: depo.size));
            }
            ;
          }
          return setupDialoadDepo();
        }
        return Text('Error');
      });
}

Widget setupDialoadDepo() {
  return Container(
    // height: 300.0, // Change as per your requirement
    // width: 300.0, // Change as per your requirement
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: listPickDepo.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(listPickDepo[index].depotName!),
          subtitle: Text(listPickDepo[index].soluong!.toString() +
              '-' +
              listPickDepo[index].size!),
        );
      },
    ),
  );
}
