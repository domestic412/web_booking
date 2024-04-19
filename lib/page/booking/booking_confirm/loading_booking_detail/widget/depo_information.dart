import 'package:flutter/material.dart';
import 'package:web_booking/model/booking_confirm/model_loading_booking_detail.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';

class DepoInformation extends StatefulWidget {
  const DepoInformation({super.key});

  @override
  State<DepoInformation> createState() => _DepoInformationState();
}

class _DepoInformationState extends State<DepoInformation> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: <DataColumn>[
          DataColumn(label: Expanded(child: Text('Depo Name'))),
          DataColumn(label: Expanded(child: Text('Size'))),
          DataColumn(label: Expanded(child: Text('Empty Av'))),
          DataColumn(label: Expanded(child: Text('FOS Av')))
        ],
        rows: List.generate(loadingBookingDetail.depAvaModel.length, (index) {
          var dataDepo = loadingBookingDetail.depAvaModel[index];
          return DataRow(cells: [
            DataCell(Center(
              child: Text(dataDepo.depotName!),
            )),
            DataCell(Center(
              child: Text(dataDepo.size!),
            )),
            DataCell(Center(
              child: Text(dataDepo.mia!.toString()),
            )),
            DataCell(Center(
              child: Text(dataDepo.fos!.toString()),
            )),
          ]);
        }));
  }
}
