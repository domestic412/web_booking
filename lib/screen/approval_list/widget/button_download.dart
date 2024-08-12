import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';

class DownloadButtonApproval extends StatefulWidget {
  @override
  _DownloadButtonApprovalState createState() => _DownloadButtonApprovalState();
}

class _DownloadButtonApprovalState extends State<DownloadButtonApproval> {
  bool isExport = false;

  Future<void> downloadFile(String fromDate, String toDate) async {
    final url =
        '$SERVER/Requests/Export?fromDay=$fromDate&toDay=$toDate'; // Replace with your direct link
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Export approval list done');
      final bytes = response.bodyBytes;
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download',
            'Requests List.xlsx') // Change file name and extension as needed
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      print('Error export approval list: ' + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isExport = !isExport;
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(haian),
              minimumSize: MaterialStateProperty.all(Size(100, 40))),
          child: Text('Export data'),
        ),
        SizedBox(
          height: 10,
        ),
        isExport == true ? dateDownload(context) : SizedBox.shrink(),
      ],
    );
  }

  Row dateDownload(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 40,
          width: 150,
          child: TextField(
            controller: historyController.fromDate.value,
            decoration: InputDecoration(
              fillColor: white,
              border: OutlineInputBorder(),
              label: Text(
                'From Date',
                style: TextStyle(fontSize: 14),
              ),
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100));
              if (pickeddate != null) {
                setState(() {
                  historyController.fromDate.value.text =
                      DateFormat('dd/MM/yyyy').format(pickeddate);
                  historyController.fromDate_send.value =
                      DateFormat('MM/dd/yyyy').format(pickeddate);
                });
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 40,
          width: 150,
          child: TextField(
            controller: historyController.toDate.value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                'To Date',
                style: TextStyle(fontSize: 14),
              ),
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100));
              if (pickeddate != null) {
                setState(() {
                  historyController.toDate.value.text =
                      DateFormat('dd/MM/yyyy').format(pickeddate);
                  historyController.toDate_send.value =
                      DateFormat('MM/dd/yyyy').format(pickeddate);
                });
              }
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (historyController.fromDate_send.value == '' ||
                historyController.toDate_send.value == '') {
              print('Error: Choose date');
            } else {
              downloadFile(historyController.fromDate_send.value,
                  historyController.toDate_send.value);
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(haian),
              minimumSize: MaterialStateProperty.all(Size(100, 40))),
          child: Text('Download'),
        ),
      ],
    );
  }
}
