import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

class TableInputQuote extends StatefulWidget {
  const TableInputQuote({super.key});

  @override
  State<TableInputQuote> createState() => _TableInputQuoteState();
}

class _TableInputQuoteState extends State<TableInputQuote> {
  @override
  Widget build(BuildContext context) {
    // print(createBookingController.listInfoContainer);
    return Obx(
      () => Container(
        // width: 1004,
        // alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: blue.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: blue.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 15,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Seq.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Charge',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Container',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Gate In Date',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Component',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Detail of Damage',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Damage Code',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Quantity',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Dimension',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Length',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Width',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Location',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Repair Coode',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Labor Code',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Mr. Cost',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Total Cost',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Remove',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              for (int i = 0; i < quoteController.countRow.value; i++)
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text((i + 1).toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].chargeTypeId!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].container!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].inGateDate!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].componentId!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].damageDetail!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].errorId!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].quantity!.toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].dimension!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].length!.toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].width!.toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].location!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].categoryId!)),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].laborCost!.toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].mrCost!.toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].totalCost!.toString())),                    
                    // DataCell(Text(
                    //     createBookingController.listInfoContainer[i].dg!
                    //         ? 'YES'
                    //         : 'NO')),
                    // DataCell(
                    //     Text(createBookingController.listInfoContainer[i].dg!)),
                    DataCell(quoteController.countRow.value !=
                            0
                        ? InkWell(
                            onTap: () {
                              //remove infoContainer in listInfoContainer
                              createBookingController.listInfoContainer
                                  .removeAt(i);
                              // subtract countRowContianer
                              createBookingController.countRowContainer.value =
                                  createBookingController
                                          .countRowContainer.value -
                                      1;
                              // if countRowContianer = 0 then Error Send Eequest
                              createBookingController.countRowContainer.value ==
                                      0
                                  ? createBookingController
                                      .boolErrorBookingRequest.value = true
                                  : null;
                            },
                            child: Icon(Icons.delete),
                          )
                        : Text('')),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// findChargeName(String chargeTypeId) {
//   for (final charge in box
//       .read(commodityList_signin)
//       .map((e) => DataTable5s.fromJson(e))
//       .toList()) {
//     if (commodity.commodityId == commodityId) {
//       return commodity.commodityName;
//     }
//   }
// }
