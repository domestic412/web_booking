import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';

class FreightInformation extends StatefulWidget {
  const FreightInformation({super.key});

  @override
  State<FreightInformation> createState() => _FreightInformationState();
}

class _FreightInformationState extends State<FreightInformation> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: <DataColumn>[
          DataColumn(label: Expanded(child: Text('Commodity'))),
          DataColumn(label: Expanded(child: Text('Freight'))),
          DataColumn(label: Expanded(child: Text('Size'))),
          DataColumn(label: Expanded(child: Text('Volume'))),
          DataColumn(label: Expanded(child: Text('Price'))),
          // DataColumn(label: Expanded(child: Text('Term'))),
          DataColumn(label: Expanded(child: Text('Total'))),
          DataColumn(label: Expanded(child: Text('CC'))),
        ],
        rows: List.generate(loadingBookingDetail.refDetails.length, (index) {
          var dataRef = loadingBookingDetail.refDetails[index];
          return DataRow(cells: [
            DataCell(Center(
              child: Text(dataRef.commodity!),
            )),
            DataCell(Center(
              child: Text(dataRef.chargeType!),
            )),
            DataCell(Center(
              child: Text(dataRef.perCode!),
            )),
            
            DataCell(Center(
              child: Text(dataRef.volume!.toString()),
            )),
            DataCell(Center(
              child: Text(formatCurrency.format(dataRef.price!).toString()),
            )),
            // DataCell(Center(
            //   child: Text(dataRef.paymentTem!),
            // )),
            DataCell(Center(
              child: Text(formatCurrency.format(dataRef.total!).toString()),
            )),
            DataCell(Center(
              child: Text(dataRef.ccy!),
            )),
          ]);
        }));
  }
}
