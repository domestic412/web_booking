import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/login/model_login.dart';

class TableInformationContainer extends StatefulWidget {
  const TableInformationContainer({super.key});

  @override
  State<TableInformationContainer> createState() =>
      _TableInformationContainerState();
}

class _TableInformationContainerState extends State<TableInformationContainer> {
  @override
  Widget build(BuildContext context) {
    // print(createBookingController.listInfoContainer);
    return Obx(
      () => Container(
        width: 1004,
        alignment: Alignment.topCenter,
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
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 40,
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'No.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Commodity',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Size',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              // DataColumn(
              //   label: Expanded(
              //     child: Text(
              //       'Type',
              //       style: TextStyle(fontStyle: FontStyle.italic),
              //     ),
              //   ),
              // ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Status',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Volume',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Weight(KG)',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'DG',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
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
              for (int i = 0;
                  i < createBookingController.countRowContainer.value;
                  i++)
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text((i + 1).toString())),
                    DataCell(Text(findCommodityName(createBookingController
                            .listInfoContainer[i].commodityId!) ??
                        '')),
                    DataCell(Text(createBookingController
                            .listInfoContainer[i].sizeId! +
                        createBookingController.listInfoContainer[i].type!)),
                    // DataCell(Text(
                    //     createBookingController.listInfoContainer[i].type!)),
                    DataCell(Text(
                        createBookingController.listInfoContainer[i].status!)),
                    DataCell(Text(createBookingController
                        .listInfoContainer[i].volume!
                        .toString())),
                    DataCell(Text(formatCurrency
                        .format(createBookingController
                            .listInfoContainer[i].weight!)
                        .toString())),
                    DataCell(Text(
                        createBookingController.listInfoContainer[i].dg!
                            ? 'YES'
                            : 'NO')),
                    // DataCell(
                    //     Text(createBookingController.listInfoContainer[i].dg!)),
                    DataCell(createBookingController.countRowContainer.value !=
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

findCommodityName(String commodityId) {
  for (final commodity in box
      .read(commodityList_signin)
      .map((e) => DataTable5s.fromJson(e))
      .toList()) {
    if (commodity.commodityId == commodityId) {
      return commodity.commodityName;
    }
  }
}
