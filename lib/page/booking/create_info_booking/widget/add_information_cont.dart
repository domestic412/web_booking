import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

class TableInformationContainer extends StatefulWidget {
  const TableInformationContainer({super.key});

  @override
  State<TableInformationContainer> createState() =>
      _TableInformationContainerState();
}

class _TableInformationContainerState extends State<TableInformationContainer> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 904,
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
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Type',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
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
                    'Temp.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Dangerous',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Remove',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(createBookingController.countRowContainer.value
                      .toString())),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.commodityConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.sizeConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.typeConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.statusConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.volumeConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.weightConts!)),
                  DataCell(Text(createBookingController
                      .listInfoContainer.value.temperatureConts!)),
                  DataCell(Text(
                      createBookingController.listInfoContainer.value.dg!)),
                  DataCell(createBookingController.countRowContainer.value != 0
                      ? InkWell(
                          onTap: () {
                            createBookingController.countRowContainer.value =
                                createBookingController
                                        .countRowContainer.value -
                                    1;
                            createBookingController.listInfoContainer.value =
                                Volumes(
                                    commodityConts: '',
                                    typeConts: '',
                                    sizeConts: '',
                                    statusConts: '',
                                    volumeConts: '',
                                    weightConts: '',
                                    temperatureConts: '',
                                    dg: '',
                                    dgUnNo: '',
                                    dgClass: '');
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
