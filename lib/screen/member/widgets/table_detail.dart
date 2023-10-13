import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/screen/member/widgets/popup_details.dart';

class TableDetail extends StatelessWidget {
  const TableDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: blue.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: blue.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DataTable(
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.grey.shade200),
              columns: [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Creation Date")),
                DataColumn(label: Text("Role")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("0")),
                  DataCell(Text("How to build a Flutter Web App")),
                  DataCell(Text("${DateTime.now()}")),
                  DataCell(Text("2.3K Views")),
                  DataCell(Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  DataCell(ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: white, onPrimary: black),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text("1")),
                  DataCell(Text("How to build a Flutter Mobile App")),
                  DataCell(Text("${DateTime.now()}")),
                  DataCell(Text("21.3K Views")),
                  DataCell(Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  DataCell(ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                        primary: white, onPrimary: black),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text("2")),
                  DataCell(Text("Flutter for your first project")),
                  DataCell(Text("${DateTime.now()}")),
                  DataCell(Text("2.3M Views")),
                  DataCell(Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Inactive',
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  DataCell(ElevatedButton(
                    onPressed: () {
                      PopUpEdit(context);
                    },
                    child: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                        primary: white, onPrimary: black),
                  )),
                ]),
              ]),
        ),
        //Now let's set the pagination
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "1",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "2",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "3",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        )
      ],
    );
  }
}
