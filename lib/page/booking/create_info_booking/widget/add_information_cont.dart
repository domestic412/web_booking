import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/booking/create_info_booking/create_booking_page.dart';
import 'package:web_booking/page/booking/create_info_booking/variabl_add_cont.dart';

class TableInformationContainer extends StatefulWidget {
  const TableInformationContainer({super.key});

  @override
  State<TableInformationContainer> createState() =>
      _TableInformationContainerState();
}

class _TableInformationContainerState extends State<TableInformationContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Quality',
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
                  'Rem',
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
                DataCell(Text(test_no)),
                DataCell(Text(test_commodity)),
                DataCell(Text(test_size)),
                DataCell(Text(test_type)),
                DataCell(Text(test_status)),
                DataCell(Text(test_quality)),
                DataCell(Text(test_volume)),
                DataCell(Text(test_weight)),
                DataCell(Text(test_temp)),
                DataCell(Text(test_dangerous)),
                DataCell(Text(test_rem)),
                DataCell(bool_add_cont == true
                    ? InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Icon(Icons.delete),
                      )
                    : Text('')),
              ],
            ),
            // DataRow(
            //   cells: <DataCell>[
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //     DataCell(Text('')),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
