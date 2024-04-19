import 'package:flutter/material.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';

class CargoInformation extends StatefulWidget {
  const CargoInformation({super.key});

  @override
  State<CargoInformation> createState() => _CargoInformationState();
}

class _CargoInformationState extends State<CargoInformation> {
  @override
  Widget build(BuildContext context) {
    var confirmVolume_controller$index = TextEditingController();
    var quality_controller$index = TextEditingController();
    return Column(
      children: [
        DataTable(
            columns: <DataColumn>[
              DataColumn(label: Expanded(child: Text('Seq'))),
              DataColumn(label: Expanded(child: Text('Commodity'))),
              DataColumn(label: Expanded(child: Text('Size'))),
              DataColumn(label: Expanded(child: Text('Type'))),
              DataColumn(label: Expanded(child: Text('Status'))),
              DataColumn(label: Expanded(child: Text('Weight'))),
              DataColumn(label: Expanded(child: Text('R.Vol'))),
              DataColumn(label: Expanded(child: Text('C.Vol'))),
              DataColumn(label: Expanded(child: Text('Quality'))),
              DataColumn(label: Expanded(child: Text('DG'))),
              DataColumn(label: Expanded(child: Text('UNNO'))),
              DataColumn(label: Expanded(child: Text('Class'))),
              DataColumn(label: Expanded(child: Text('DG Remark'))),
            ],
            rows: List.generate(loadingBookingDetail.commoditieDetail.length,
                (index) {
              var dataCommodity = loadingBookingDetail.commoditieDetail[index];

              return DataRow(cells: [
                DataCell(Center(
                  child: Text('${index + 1}'),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.commodityName!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.sizeId!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.type!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.status!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.weight!.toString()),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.requestVol!.toString()),
                )),
                DataCell(Center(
                  child: Container(
                      width: 50,
                      child: TextField(
                          controller: confirmVolume_controller$index)),
                )),
                DataCell(Center(
                  child: Container(
                      width: 50,
                      child: TextField(controller: quality_controller$index)),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.dg!.toString()),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.unno!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.Class!),
                )),
                DataCell(Center(
                  child: Text(dataCommodity.dgRemark!),
                )),
              ]);
            })),
        SizedBox(
          height: 20,
        ),
        Container(
          child: ElevatedButton(
              onPressed: () {
                for (int i = 0;
                    i < loadingBookingDetail.commoditieDetail.length;
                    i++) {
                  print(loadingBookingDetail
                          .commoditieDetail[0].bookingDetailId! +
                      ':' +
                      confirmVolume_controller$index.text +
                      ':' +
                      quality_controller$index.text);
                }
              },
              child: Text('Print')),
        )
      ],
    );
  }
}
